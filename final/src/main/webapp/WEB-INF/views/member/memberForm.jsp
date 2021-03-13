<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="css/form.css">    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">   
$(function(){
	//form 서브밋
	//입력값이 0일시 경고창, 페이지 안넘어감 
	$("form").on("submit",function(event){
		var userid = $("#userid").val();
		var passwd = $("#passwd").val();
		var passwd2 = $("#passwd2").val();
		var username = $("#username").val();
		var sample4_postcode = $("#sample4_postcode").val();
		var sample4_roadAddress =$ ("#sample4_roadAddress").val();
		var sample4_jibunAddress =$("#sample4_jibunAddress").val();
		var phone2 =$("#phone2").val();
		var phone3 =$("#phone3").val();
		var email1 =$("#email1").val();
		var email2 =$("#email2").val();
		var phone3 =$("#phone3").val();
		
		if(userid.length==0){
			alert("아이디를 입력해주세요")
			$("#userid").focus();
			event.preventDefault();
			
		}else if(passwd.length==0){
			alert("비밀번호를 입력해주세요")
			$("#passwd").focus();
			event.preventDefault();
			
		}else if(passwd2.length==0){
			alert("비밀번호를 확인해주세요")
			$("#passwd").focus();
			event.preventDefault(); 
			
		}else if(username.length==0){
			alert("이름을 입력해주세요")
			$("#username").focus();
			event.preventDefault();
		
		}else if(sample4_postcode.length==0){
			alert("주소를 입력해주세요")
			$("#sample4_postcode").focus();
			event.preventDefault();
			
		}else if(sample4_roadAddress.length==0){
			alert("도로명주소를 입력해주세요")
			$("#sample4_roadAddress").focus();
			event.preventDefault();
			
	    }else if(sample4_jibunAddress.length==0){	
	    	alert("지번주소를 입력해주세요")
			$("#sample4_jibunAddress").focus();
			event.preventDefault(); 
			
		}else if(phone2.length==0){
			alert("전화번호를 입력해주세요")
			$("#phone2").focus();
			event.preventDefault();
			
		}else if(phone3.length==0){
			alert("전화번호를 입력해주세요")
			$("#phone3").focus();
			event.preventDefault();
			
		}else if(email1.length==0){
			alert("이메일을 입력해주세요")
			$("#email1").focus();
			event.preventDefault();
			
		}else if(email2.length==0){
			alert("이메일을 입력해주세요")
			$("#email2").focus();
			event.preventDefault();
		}				
	});
		
	//비밀번호 확인
	 $("#passwd2").on("keyup",function(){
		var passwd = $("#passwd").val();
		var mesg = "정확하게 입력해주세요.";
		if(passwd==$(this).val()){
			mesg = "일치합니다.";
		};
	 	$("#result1").text(mesg);
		});
	
	//이메일 선택
		$("#emailSelect").on("change",function(){
			var email = $(this).val();
			$("#email2").val(email);
		});
	
	//아이디 중복체크
	$(document).ready(function(event){
		  $("#userid").on("keyup",function(){
			  $.ajax({
				 url:"idDuplicateCheck",  //서버 주소
				 type:"GET",
				 data:{
					 userid:$("#userid").val()  //전송데이터 id
				 },
				 dataType:"text", //응답데이터 타입
				 success:function(data,status,xhr){  //처리 성공시
					 $("#result").text(data);  //중복여부 화면에 출력
					 console.log(data);
				 },
				 error:function(xhr,status,error){//처리 실패시
					 console.log("error");
				 }
			  });//end ajax
		  });//end on
	 });//end ready
});//function
</script>     
    
<div id="section">
<h2>회원가입</h2>
<div id="content">    
<form action="memberAdd" method="get">
<p>*아이디</p>
<input type="text" name="userid" id="userid" placeholder="아이디를 입력해주세요">
<br>
<span id="result"></span>

<p>*비밀번호</p>
<input type="text" name="passwd" id="passwd" placeholder="6자 이상의 영문 혹은 영문과 숫자를 조합"><br> 
<p>비밀번호확인</p>
<input type="text" name="passwd2" id="passwd2" placeholder="비밀번호를 한번 더 입력해주세요">
<br>
<span id="result1"></span>
<br>
<p>이름</p>
<input type="text" name="username" id="username" placeholder="이름을 입력해주세요"><br> 
<input type="text" name="post" id="sample4_postcode" placeholder="우편번호"><br>
<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
<input type="text" name="addr1" id="sample4_roadAddress" placeholder="도로명주소"><br>
<input type="text" name="addr2" id="sample4_jibunAddress" placeholder="지번주소"><br>
<span id="guide" style="color:#999"></span>
<br>
전화번호:<select name="phone1">
  <option value="010">010</option>
  <option value="011">011</option>
</select><br>
<div class="phonebox">
<input type="text" name="phone2" id=phone2><br>
<input type="text" name="phone3" id=phone3>
</div>
<br>
<p>이메일</p><input type="text" name="email1" id="email1"><br>
       <input type="text" name="email2" id="email2" placeholder="@직접입력"><br>
       <select  id="emailSelect">
        <option value="daum.net">daum.net</option>
        <option value="naver.com">naver.com</option>
       </select>
<br>
<div class="Btn">
<input type="submit" value="회원가입"><br>
<input type="reset" value="취소">
</div><!-- Btn -->
</form><!-- memberAdd -->
</div><!-- content -->
</div><!-- section -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
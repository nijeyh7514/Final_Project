<%@page import="com.sun.scenario.effect.Merge"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderAllConfirm</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script>
//제이쿼리문 시작
//보내는 주문자(order)와 받는 주문자(m)정보가 동일할 경우 체크시 같은 값 들어감
//체크했을시 $(#orderName)안에 #musername값이 들어간다. 
		$(function(){
		$("#same").on("click",function(){
			if(this.checked){			
				$("#orderName").val($("#musername").val());
				$("#phone").val($("#mphone").val());				
				$("#sample4_postcode").val($("#mpost").val());
				$("#sample4_roadAddress").val($("#maddr1").val());
				$("#sample4_jibunAddress").val($("#maddr2").val());
			}else{
				$("#orderName").val("");
				$("#phone").val("");
				$("#sample4_postcode").val("");
				$("#sample4_roadAddress").val("");
				$("#sample4_jibunAddress").val("");				
			}
		});
	});
	
	
	
</script>	

<body>
<div class="container">
<!--상품주문서 -->
<FORM name="myForm" method="GET" action="loginCheck/orderAllDone">
	<table width="80%" cellspacing="0" cellpadding="0" style="margin-left: 140px;">

		<tr>
			<td height="30">
		</tr>

	<tr>
		<td colspan="5" class="td_default"align='center'>&nbsp;&nbsp;&nbsp; 
		<font size="6"><strong>주문서</strong></font> &nbsp;
		</td>
	</tr>

		<tr>
			<td height="15">
		</tr>

		<tr>
			<td>
				<hr size="1" color="CCCCCC">
			</td>
		</tr>

		<tr>
			<td height="5">
		</tr>

		<tr>
			<td>
			<!-- 테이블 시작 -->
				<table width="100%" cellspacing="0" cellpadding="0">
					<tr>
						<td class="td_default" align='left'><b><font size="5">주문상품</font></b></td> 
						<!-- <td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
						<td class="td_default" align="center"><strong>판매가</strong></td>
						<td class="td_default" align="center" colspan="2"><strong>수량</strong></td> -->

					</tr>

					<tr>
						<td colspan="7">
							<hr size="1" color="CCCCCC">
						</td>
					</tr>
				
					

<!-- 누적 반복문--><!-- 변수 선언 -->	
<c:set var="totalSum" value="0"/>
<input type="hidden" name="userid" value="${login.userid}" >

<c:forEach var="xxx" items="${cList}">
  <c:set var="totalSum" 
  value="${totalSum + xxx.gPrice*xxx.gAmount }"/>

 <input type="hidden" name="num" value="${xxx.num}" >
<input type="hidden" name="gCode" value="${xxx.gCode}" >
<input type="hidden" name="gImage" value="${xxx.gImage}" >
<input type="hidden" name="gName" value="${xxx.gName}" >
<input type="hidden" name="gPrice" value="${xxx.gPrice}" >
<input type="hidden" name="gAmount" value="${xxx.gAmount}" >

								<tr>
									<%-- <td class="td_default" width="80">${xxx.num}</td> --%>
									<td class="td_default" width="80"><img
										src="images/items/${xxx.gImage}.jpg" border="0" align="center"
										width="80" /></td>
									<td class="td_default" width="300" style='padding-left: 30px'>
										${xxx.gName} <br>
									</td>
									<td class="td_default" align="center" width="110">
										${xxx.gPrice}원</td>
									<td class="td_default" align="center" width="90">${xxx.gAmount}개</tr>
					<td colspan="10">
			<hr size="1" color="CCCCCC">				   
</td> 			
					
</c:forEach> <!-- 주문상품 반복 끝-->   

					<tr>
						<td height="30"></td>
						<td class="td_default" align="right"></td><!-- 띄어쓰기 -->
						<td class="td_default" align='right'><font size="4"><b>최종 결제 금액 : ${totalSum} 원</b></font></td>
					</tr>
			</table><!--주문상품 테이블 끝-->
	

		<!--  고객 정보 시작-->
		<tr>
		<td height="30">
		</tr>

				<tr>
					<td><b><font size="5">주문자 정보</font></b></td>														
				</tr>

		<tr>
		<td height="15">
		</tr>
<!-- -------------------------------------------------------------------------------- -->
	<tr>
		<td>
		<!-- 테이블시작-->
		<!--MemberDTO 회원정보 -->	
			<table width="100%" cellspacing="0" cellpadding="0" border="1"
					style="border-collapse:collapse" bordercolor="#CCCCCC">
			<!-- ------------------------------------------------------------- -->
				<tr>
					 <td width="125" height="50" class="td_default"> 
						
						<font size="4"><strong> 보내는 분</strong></font>
				<!-- -------------------------------------------------- -->
					
					<td height="35" class="td_default">
						<input class="input_default" id="musername" name="musername" size="20"
							maxlength="20" value="${mDTO.username}"></input>
					</td>
				</tr>
				<!-- -------------------------------------------------------------- -->
				<tr>
					<td height="50" class="td_default">
					
						<font size="4"><strong>휴대폰</strong></font>
					</td>
					
					<td height="50" class="td_default">
						<input class="input_default" type="text" id="mphone" name="mphone1" size="20"
							maxlength="15" value="${mDTO.phone1}-${mDTO.phone2}-${mDTO.phone3}"></input>		
				
				</tr>				
				<!-- ----------------------------------------------------------------- -->
				<tr>
					<td height="50 class="td_default">
						
							<font size="4"><strong>이메일</strong></font>
					</td>
					<td height="35" class="td_default">
						<input class="input_default" type="text" id="memail" size="15"
							maxlength="6" value="${mDTO.email1}" readonly>@			
						<input class="input_default" type="text" id="memail" size="13"
							maxlength="6" value="${mDTO.email2}" readonly>
				       </table>
					</td>
				</tr>
	<!--주문자 정보테이블 끝 ------------------------------------------------------------>
<!--배송지 정보 -------------------------------------------------------------------------- -->				
			<tr>
		<td height="30">
		</tr>
				<tr>
					<td><b><font size="5">배송정보</font></b></td>														
				</tr>
		<tr>
		<td height="15">
		</tr>
		
		<tr>
		   <td>			
		<table width="100%" cellspacing="0" cellpadding="0" border="1"
					style="border-collapse:collapse" bordercolor="#CCCCCC">
					
				<tr>
					<td width="125" height="50" class="td_default"> 
										
					<font size="4"><strong> 기본 배송지</strong></font>					
					</td>
					
					 <td height="50" class="td_default">	
					 				
						<input class="input_default" type="text" id="mpost" size="40"
							maxlength="20" value="${mDTO.post}"readonly><br>
							
						<input class="input_default" type="text" id="maddr1" size="40"
							maxlength="200" value="${mDTO.addr1}" readonly><br>
							
						<input class="input_default" type="text" id="maddr2" size="40"
							maxlength="200" value="${mDTO.addr2}" readonly></input>	
						</td>
					</tr>							
			</table><!--기본 배송지 테이블 끝 -->							
		</td>
	</tr>

<!-- 주문자정보 끝  -->
									
	<tr> 
		<td class="td_default">
		<br>
			 <input type="checkbox" name="same" id="same"> 주문자 정보와 동일
		<br>	 
		</td>
	</tr> 	

	<tr>
		<td height="15">
		</tr>
<!-- -------------------------------------------------------------------------------- -->
	<tr>
		<td>
		<!-- 받으실 분 테이블시작-->
			<table width="100%" cellspacing="0" cellpadding="0" border="1"
					style="border-collapse:collapse" bordercolor="#CCCCCC">
			<!-- ------------------------------------------------------------- -->
				<tr>
					 <td width="125" height="50" class="td_default"> 
						
						<font size="4"><strong> 받으실 분 정보</strong></font>
				<!-- -------------------------------------------------- -->
					
					<td height="35" class="td_default">
						<input class="input_default" type="text" id="orderName" name="orderName" value="" 
						size="20" maxlength="20" placeholder="이름을 입력해주세요"></input>
					</td>
				</tr>
				<!-- -------------------------------------------------------------- -->
				<tr>
					<td height="50" class="td_default">
					
						<font size="4"><strong>휴대폰</strong></font>
					</td>
					<td height="50" class="td_default">
						<input class="input_default" type="text" id="phone" name="phone" value="" 
							size="20" maxlength="15"  placeholder="숫자만 입력해주세요"></input>
							<tr>
					<td width="125" height="50" class="td_default"> 
										
					<font size="4"><strong> 배송지</strong></font>					
					</td>
					
					 <td height="50" class="td_default">
<!-- Daum 제공 주소 -->					 
	<input type="text" name="post" id="sample4_postcode" size="40" placeholder="우편번호">
	<input type="button" onclick="sample4_execDaumPostcode()"size="40" value="우편번호 찾기"><br>
	<input type="text" name="addr1" id="sample4_roadAddress" size="40" placeholder="도로명주소"><br>
	<input type="text" name="addr2" id="sample4_jibunAddress"size="40" placeholder="지번주소">
	<span id="guide" style="color:#999">
	</span>
	<br>
<!-- Daum 제공 주소 끝 -->
					</td>						 	
				</tr>				
			</table><!--받으실분 정보 긑 -->							
		</td>
	</tr>


	<tr>
		<td height="30">	
		</tr>
	<tr>
		<td><b><font size="5">결제수단</font></b></td>														
	</tr>

	<tr>
		<td height="15">
	
		</tr>
	<tr>
		<td>
			<table width="100%" cellspacing="0" cellpadding="0" border="1"
					style="border-collapse:collapse" bordercolor="#CCCCCC">
				<tr>
					<td width="125" height="35" class="td_default">
						<input type="radio" name="payMethod" value="신용카드" checked>신용카드</input>
						
						<input type="radio" name="payMethod" value="계좌이체">계좌이체</input>
						
						<input type="radio" name="payMethod" value="무통장 입금">무통장 입금</input>
					</td>
					
				</tr>
				
			</table>							
		</td>
	</tr>
	
	<tr>
		<td height="30">
	
		</tr>


	<tr>
		<td class="td_default" align="center">
			<input type='button' value='취소' onclick="javascript:history.back()">	
			<input type='submit' value='결제하기'>
		</td>
	</tr>

</table>

</form>
</div>
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


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
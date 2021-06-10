<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cartList</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
 <script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript"> 

//ajax 시작
//*(장바구니)상품 전체선택
		$(function(){ 
		$("#allCheck").on("click", function() {
			var result = this.checked;
			$(".check").each(function(idx, data) {
				this.checked = result;
			});
		});//allCheck End
		});//function ready End
		
//*(장바구니)상품 수량수정버튼(0)
$(function(){ 
	$(".updateBtn").on("click",function(){//class="updateBtn"	
		var num = $(this).attr("data-xxx");//번호가져오기 ${x.num}
		var gAmount = $("#cartAmount"+num).val();//수량가져오기
		var gPrice = $(this).attr("data-price");//가격 가져오기
		
		$.ajax({			
			url:"loginCheck/cartUpdate",//서블릿이동
			type:'get',
			dataType:'text',
			data:{
				num:num,//장바구니 상품번호
				gAmount:gAmount //수정한 수량전송
			},
			success: function(data, status, xhr){
				var sum = gAmount * gPrice;// 성공시 합계만 변경함
				$("#sum"+num).text(sum);//기격*수량으로 변경
				totalxxx();
			},
			error: function(xhr,status,error){
					
				}//updateBtn error End
			});//updateBtn ajax End
		});//.updateBtn click End
});//function ready End
		
	//(장바구니)상품 개별삭제버튼(0)
		$(function(){ 
		$(".delBtn1").on("click", function() {
			var num = $(this).attr("data-num");
			var xxx = $(this);
			if (confirm("삭제하시겠습니까?") == true) {
				$.ajax({
					url : "loginCheck/cartDelete", //서블릿이동
					type : "get",
					data : {
						num : num
					},
					dataType : "text",
					success : function(data, status, xhr) {
						console.log("success");
						xxx.parents().filter("tr").remove();
						totalxxx();
					},
					error : function(xhr, status, error) {
						console.log(error);
					}//delBtn error End

				});//delBtn ajax End
			} else {
				return;
			}//if End
		});//delBtn End
	});//function ready End
	
	//(장바구니)상품 선택삭제버튼(x)
	/*  $(function(){ 
	$(".delBtn2").on("click",function() {
				var num = $(this).attr("data-num");
				//console.log("카트삭제===="+num);
				var xxx = $(this);
				if ($("input:checkbox[name='check']:checked")
						.is(":checked") == false) {
					alert("상품을 선택해주세요");
				} else {
					alert("삭제"); 
					$.ajax({
						url : "loginCheck/cartDelete", //서블릿이동
						alert("서블릿이동"); 
						type : "get",
						data : {
							num : num
						},
						dataType : "text",
						success : function(data, status, xhr) {
							console.log("success");
							xxx.parents().filter("tr").remove();
							totalxxx();
						},
						error : function(xhr, status, error) {
							console.log(error);

						}//error End

					});//ajax End
			
			});//delBtn2 ajax End
	});//function ready End  
	 */
	 
	//*(장바구니)선택주문 버튼(0)
	$(function(){ 
	$("#orderAllConfirm").on("click", function() {
				var num = $(this).attr("data-num");
				$("form").attr("action", "loginCheck/orderAllConfirm?num=" + num);
				if ($("input:checkbox[name='check']:checked")
						.is(":checked") == false) {
					alert("상품을 선택해주세요");
					event.preventDefault();
				} else {
					$("form").submit();// trigger//
				}
			});//orderAllConfirm End
	});//function End
	
	//*(장바구니)카트목록 총합가격 구하기	
	$(function totalxxx(){
		var totalSum = 0;		
		$(".sum").each(function(idx, data) {
			totalSum += Number.parseInt($(data).text());
		});
		$("#totalSum").text(totalSum);
	});//totalxxx
	
	//*(장바구니)전체 삭제 -(징바구니 비우기)(x)
	/* $(function(){ 
	$("#delAllCart").on("click", function() {			
					if (confirm("징바구니를 비우시겠습니까?") == true) {
						$("form").attr("action", "loginCheck/delAllCart")
				} else {
					 $("form").submit(); // trigger
					
				}//if End
			});//delAllCart Click End
	});//function End
	 */
	
	
		//전체카트 삭제1
		/* $("#delAllCart1").on("click",function(){
			var num = [];
			$("input:checkbox[name='check']:checked").each(function(idx,ele){
				num[idx]=$(this).val();
			});
			console.log(num);
			location.href="CartAllDeleteServlet?data="+num;
		});//delAllCart End */
	
		//*(장바구니)개별주문버튼(0)
	 /* 	$(function(){ 
		$(".orderBtn").on("click", function() {
			var num = $(this).attr("data-num");
			location.href = "loginCheck/orderConfirm?num=" + num;
		});//orderBtn End
		    });//function End  */
		
	

</script>
<div class="container">
<table width="100%" cellspacing="0" cellpadding="0" border="0">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; 
		<font size="5"><b> 장바구니</b></font> &nbsp;
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>

	<!-- <tr>
		<td height="7">
	</tr> -->

	<tr>
		<td class="td_default" align="center">
		<input type="checkbox" name="allCheck" id="allCheck"> <strong>전체선택</strong></td>
		<%-- <td><input type="button" value="선택삭제" class="delBtn2" data-num="${x.num}"></td> --%>
		<!-- <td class="td_default" align="center"><strong>주문번호</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
		<td class="td_default" align="center"><strong>판매가</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
		<td class="td_default" align="center"><strong>합계</strong></td>
 -->
	</tr>

	<tr><td height="7"></tr>

	<tr><td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>

	<form name="myForm">
	    <!-- 장바구니 상품목록 반복시작 -->
		<c:forEach var="x" items="${cartList}">
		<tr>
			<td class="td_default" width="80">
<!-- checkbox- 체크된 값만 서블릿으로 넘어간다. 따라서  삭제시 value에 삭제할 num(주문번호)값을  클릭해야한다. -->
			<input type="checkbox"
				name="check" id="check81" class="check" value="${x.num}"></td><!--체크된 상품의 주문번호값이 들어간다. -->
			
<!--주문번호-->			
		<%-- 	<td class="td_default" width="80">${x.num}</td> --%>
<!--상품이미지-->
			<td class="td_default" width="80">
			<img src="images/items/${x.gImage}.jpg" border="0" align="center"
				width="80" height="80"/></td>
<!--상품이름-->	
			<td class="td_default" width="300" style='padding-left: 30px'>
			${x.gName}
<!--상품 판매가-->
		<%-- 	<td class="td_default" align="center" width="110">
			${x.gPrice} 원
			</td>	 --%>
<!--수량의 총합 구하기 -->
			<td class="td_default" align="center" width="80"
				style='padding-left: 5px'><span id="sum${x.num}" class="sum">
				${x.gPrice * x.gAmount} 
				</span>원
			</td>			
		<td>
<!--상품수량text상자 -->			
			<td class="td_default" align="center" width="90">
			<input class="input_default" type="text" name="cartAmount"
				id="cartAmount${x.num}" style="text-align: right" maxlength="3"
				size="2" value="${x.gAmount}"></input></td>
			<td>
<!--상품수량 수정버튼 -->			
			<input type="button" value="수정" class="updateBtn" data-xxx="${x.num}" data-price="${x.gPrice}">&nbsp;&nbsp;&nbsp;
<!--상품 삭제 -->
			<input type="button" value="삭제" class="delBtn1" data-num="${x.num}">
			<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
			
			</c:forEach>		
	</form>
	
<!--상품개별주문 --> 
	<%-- 	<input type="button" class="orderBtn" value="주문" data-num="${x.num}"></td>
			<td class="td_default" align="center" width="30"
				style='padding-left: 10px'> --%>

	
	 <tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr> 
	<tr>
<!--장바구니 모든 상춤총합-->	
		<td colspan="10">
		<font size="4">결제예정금액 :<span id="totalSum">
		</span>
		</font>
	<font size="4">원</font>&nbsp;&nbsp;&nbsp;&nbsp;<button id="orderAllConfirm">주문하기</button> 
			<hr size="1" color="CCCCCC">
		</td>		
	</tr>
	<!-- <tr>
		<td align="center" colspan="5">				
	 	<a class="a_black" href="goodsList?gCategory=meat"> 계속 쇼핑하기 </a> 
	 <button id="delAllCart">장바구니비우기</button>&nbsp;&nbsp;&nbsp;&nbsp; 
		</td>
	</tr> -->
	<tr>
		<td height="20">
	</tr>

</table>
</div>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>   
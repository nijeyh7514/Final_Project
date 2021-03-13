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

	$(function(){
		totalxxx();
		//수정버튼
		$(".updateBtn").on("click",function(){
			var num = $(this).attr("data-xxx");
			var gAmount = $("#cartAmount"+num).val();
			var gPrice = $(this).attr("data-price");
			$.ajax({
				url:'CartUpdateServlet',
				type:'get',
				dataType:'text',
				data:{
					num:num,
					gAmount:gAmount
				},
				success: function(data, status, xhr){
					var sum = gAmount * gPrice;
					$("#sum"+num).text(sum);
					totalxxx();
				},
				error: function(xhr,status,error){
					
				}
			});
		});
		
		//삭제버튼
		$(".delBtn").on("click",function(){
			var num = $(this).attr("data-num");
			console.log("카트삭제===="+num);
			var xxx = $(this);
			$.ajax({
				url:"loginCheck/cartDelete",
				type: "get",
				data:{
					num : num
				},
				dataType: "text",
				success:function(data, status, xhr){
					console.log("success");
					xxx.parents().filter("tr").remove();
					totalxxx();
				},
				error: function(xhr, status, error){
					console.log(error);
				}
			});
		});
		
		//전체선택
		$("#allCheck").on("click",function(){
			var result = this.checked;
			$(".check").each(function(idx,data){
				this.checked=result;
			});
		});
		
		//전체카트 삭제1
		$("#delAllCart1").on("click",function(){
			var num = [];
			$("input:checkbox[name='check']:checked").each(function(idx,ele){
				num[idx]=$(this).val();
			});
			console.log(num);
			location.href="CartAllDeleteServlet?data="+num;
		});
		//전체카트 삭제
		$("#delAllCart").on("click",function(){
			$("form").attr("action", "loginCheck/delAllCart");
			if($("input:checkbox[name='check']:checked").is(":checked") == false){
				alert("체크박스를 체크해주세요");
				event.preventDefault();
			}else{
			$("form").submit();// trigger
			}
		});
		
		//주문버튼
		$(".orderBtn").on("click",function(){
			var num = $(this).attr("data-num");
			location.href="loginCheck/orderConfirm?num="+num;
			/* if($("input:checkbox[name='check']:checked").is(":checked") == false){
				alert("체크박스를 체크해주세요");
				event.preventDefault();
			}else{
			$("form").submit();// trigger
			} */
			
		});
		
		//전체주문 버튼
		$("#orderAllConfirm").on("click",function(){
			var num = $(this).attr("data-num");
			$("form").attr("action", "loginCheck/orderAllConfirm?num="+num);
			if($("input:checkbox[name='check']:checked").is(":checked") == false){
				alert("체크박스를 체크해주세요");
				event.preventDefault();
			}else{
			$("form").submit();// trigger
			}
		});
		
		//카트목록 총합가격 구하기
		function totalxxx(){
			var totalSum = 0;
			$(".sum").each(function(idx, data){
				totalSum += Number.parseInt($(data).text());
			});
			$("#totalSum").text(totalSum);
		}
		
	});

</script>
<div class="container">
<table width="100%" cellspacing="0" cellpadding="0" border="0">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td colspan="5" class="td_default">&nbsp;&nbsp;&nbsp; <font
			size="5"><b>- 장바구니-</b></font> &nbsp;
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

	<tr>
		<td height="7">
	</tr>

	<tr>
		<td class="td_default" align="center">
		<input type="checkbox" name="allCheck" id="allCheck"> <strong>전체선택</strong></td>
		<td class="td_default" align="center"><strong>주문번호</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>상품정보</strong></td>
		<td class="td_default" align="center"><strong>판매가</strong></td>
		<td class="td_default" align="center" colspan="2"><strong>수량</strong></td>
		<td class="td_default" align="center"><strong>합계</strong></td>

	</tr>

	<tr>
		<td height="7">
	</tr>
	
	
	
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>



	<form name="myForm">
	    <!-- 반복시작 -->
		<c:forEach var="x" items="${cartList}">	    

		<tr>
			<td class="td_default" width="80">
			<!-- checkbox는 체크된 값만 서블릿으로 넘어간다. 따라서 value에 삭제할 num값을 설정한다. -->
			<input type="checkbox"
				name="check" id="check81" class="check" value="${x.num}"></td>
			<td class="td_default" width="80">${x.num}</td>
			<td class="td_default" width="80"><img
				src="images/items/${x.gImage}.jpg" border="0" align="center"
				width="80" height="80"/></td>
			<td class="td_default" width="300" style='padding-left: 30px'>
			${x.gName}
			
			<td class="td_default" align="center" width="110">
			${x.gPrice}
			</td>
			<td class="td_default" align="center" width="90">
			<input class="input_default" type="text" name="cartAmount"
				id="cartAmount${x.num}" style="text-align: right" maxlength="3"
				size="2" value="${x.gAmount}"></input></td>
			<td>
			<input type="button" value="수정" 
			class="updateBtn"
			data-xxx="${x.num}"
			data-price="${x.gPrice}">
			</td>
			<!-- 총합구하기 -->
			<td class="td_default" align="center" width="80"
				style='padding-left: 5px'><span id="sum${x.num}" class="sum">
				${x.gPrice * x.gAmount}
				</span>
			</td>
			
			
			
			<td><input type="button" class="orderBtn" value="주문" data-num="${x.num}"></td>
			<td class="td_default" align="center" width="30"
				style='padding-left: 10px'>
				<input type="button" value="삭제"
				 class="delBtn" data-num="${x.num}"></td>
			<td height="10"></td>
			
		</tr>
	</c:forEach>
	</form>
	<tr>
		<td colspan="10">
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td colspan="10">
		총합:<span id="totalSum"></span>
			<hr size="1" color="CCCCCC">
		</td>
	</tr>
	<tr>
		<td height="30">
	</tr>

	<tr>
		<td align="center" colspan="5">
			<button id="orderAllConfirm">전체 주문하기</button> &nbsp;&nbsp;&nbsp;&nbsp; 
			
			<button id="delAllCart">전체삭제하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="a_black" href="goodsList?gCategory=meat"> 계속 쇼핑하기 </a>&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td height="20">
	</tr>

</table>
</div>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>   
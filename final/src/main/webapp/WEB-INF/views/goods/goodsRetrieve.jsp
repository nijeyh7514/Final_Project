<%@page import="com.dto.GoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<meta charset="UTF-8">
<title>goodsRetrieve</title>
<link rel="stylesheet" href="css/menu.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>



<%
	String mesg = (String)session.getAttribute("mesg");
	if(mesg!=null){
		
%>
	<script>
	
		alert('<%=mesg%>');
	</script>
<%
	}
	session.removeAttribute("mesg");
%>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#edit").on("click", function(){
	  		location.href = 'AdminGoodsEditUIServlet';
	  	});
		
		//장바구니담기
		$("#cart").on("click",function(){
			$("form").attr("action", "loginCheck/cartAdd");//인터셉터 검사 후 진행
		});
		
		//수량증가감소 기능
		  $("#up").on("click",function(){
			   var count = $("#gAmount").val();
			   	$("#gAmount").val(parseInt(count)+1)
		        });
		    $("#down").on("click",function(){
			   	var count = $("#gAmount").val();	   	
			   	//0일 경우 버튼작동 안하게 (조건)
			   	if(count>0){
			   		$("#gAmount").val(parseInt(count)-1)
			   	}
			   	});
			 
			   if($("#gAmount").val()=="수량선택"){
		  			alert("수량을 선택하세요");
		  			return false;	   			
			   }
		  		/* if($("#gColor").val()=="색상선택"){
		  			alert("색상을 선택하세요");
		  			return false; 	   			
		  		}*/
		  	$("form").attr("action", "GoodsCartServlet");  	
		  		
		  
	});
	

</script>
<body>

<c:if test="${!empty mesg }">
<script>
	alert("${mesg}상품을 장바구니에 담았습니다.");
</script>
</c:if>
<%if(session.getAttribute("mesg")!=null){  //장바구니 담기에서 온 메세지가 있는 경우 삭제 
		session.removeAttribute("mesg");
}
%>

<form name="goodRetrieveForm" method="GET" action="#">
	    <input type="hidden" name="gImage" value="${goodsRetrieve.gImage}"> 
		<input type="hidden" name="gCode" value="${goodsRetrieve.gCode}"> 
		<input type="hidden" name="gName" value="${goodsRetrieve.gName}"> 
		<input type="hidden" name="gPrice" value="${goodsRetrieve.gPrice}">
	<div class="container">
	<table  cellspacing="0" cellpadding="0" style="margin-left: 250px;">
		<tr>
			<td height="30">
		</tr>
		<tr>
			<td>
				<table align="center" width="710" cellspacing="0" cellpadding="0"
					border="0" style='margin-left: 30px'>
					<tr>
						<td class="td_default"><font size="5"><b>- 상품 정보 -</b></font>
							&nbsp;</td>
					</tr>
					<tr>
						<td height="5"></td>
					</tr>
					<tr>
						<td height="1" colspan="8" bgcolor="CECECE"></td>
					</tr>
					<tr>
						<td height="10"></td>
					</tr>

					<tr>
						<td rowspan="7"><img src="images/items/${goodsRetrieve.gImage}.jpg"
							border="0" align="center" width="300" /></td>
						<td class="td_title">제품코드</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>
						 ${goodsRetrieve.gCode}
						</td>
					</tr>
					<tr>
						<td class="td_title">상품명</td>
						<td class="td_default" colspan="2" style='padding-left: 30px'>${goodsRetrieve.gName}</td>
					</tr>
					<tr>
						<td class="td_title">가격</td>

						<td class="td_red" colspan="2" style='padding-left: 30px'>
						${goodsRetrieve.gPrice}
						</td>
					</tr>
					<tr>
						<td class="td_title">배송비</td>
						<td colspan="2"><font color="#2e56a9" size="2"
							style='padding-left: 30px'><b> 무료배송</b> </font> <font size="2">(도서
								산간지역 별도 배송비 추가)</font></td>
					</tr>
				
					

					<tr>
						<td class="td_title">주문수량</td>
						<td style="padding-left: 30px"><input type="text"
							name="gAmount" value="1" id="gAmount"
							style="text-align: right; height: 18px"> <img
							src="images/up.PNG" id="up"> <img src="images/down.PNG"
							id="down"></td>
					</tr>
				</table>
			</div>
			</td>
		</tr>
	</table>
	<div style="margin-left: 270px;">
		<br> &nbsp;&nbsp;&nbsp;<button>구매</button>
		&nbsp;&nbsp;
		<button id="cart">장바구니</button>
	</div>
</form>

<br>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
    
<%@page import="java.util.List"%>
<%@page import="com.dto.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>orderAllDone</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>

<body>   
<div class="container">

<c:set var="xxx" value="${oList}" />
<c:set var="userid" value="${xxx[0].userid}" />
<c:set var="orderName" value="${xxx[0].orderName}" />
<c:set var="post" value="${xxx[0].post}" />
<c:set var="addr1" value="${xxx[0].addr1}" />
<c:set var="addr2" value="${xxx[0].addr2}" />
<c:set var="phone" value="${xxx[0].phone}" />
<c:set var="orderDay" value="${xxx[0].orderday}" />

<table width="70%" cellspacing="0" cellpadding="0" style="margin-left: 180px;">

	<tr>
		<td height="30">
	</tr>

	<tr>
		<td><b><font size="6">주문완료</font></b>
		</td>
	</tr>

	<tr>
		<td height="30">
	</tr>
	<tr>
		<td align="center"><b>주문해주셔서 감사합니다.</b></td>
	</tr>

	<tr>
		<td height="7">
	</tr>

	<tr>
		<td class="td_default" align="center"><b>${xxx[0].userid}</b> 님의 주문이
			안전하게 처리되었습니다.</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default"><b><font size="5">상품 및 배송정보</font></b>
		</td>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td class="td_default" width="150" height="35"> 받으시는 분</td>
					<td class="td_default" height="35">${xxx[0].orderName}</td>
				</tr>
				<tr>
					<td class="td_default" height="35"> 주소</td>
					<td class="td_default" height="35"> (${xxx[0].post})<br>
						${xxx[0].addr1}${xxx[0].addr2}
					</td>
				</tr>
				
				<tr>
					<td class="td_default" height="35"> 휴대전화</td>
					<td class="td_default" height="35"> ${xxx[0].phone}</td>
				</tr>
			</table>
	</tr>
	</td>

	<tr>
		<td height="20">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td width="250" class="td_default" height="35" align="center"><strong>상품명</strong></td>
					<td width="100" class="td_default" height="35" align="center"><strong>판매가</strong></td>
					<td class="td_default" width="50" height="35" align="center"><strong>수량</strong></td>
					<td class="td_default" width="100" height="35" align="center"><strong>합계</strong></td>
				</tr>

 		
   <!--  변수 선언 -->
    <c:set var="totalSum" value="0" />
<c:forEach var="xxx" items="${oList}" varStatus="status">
    <!-- 누적 -->
		<c:set var="totalSum" value="${totalSum + xxx.gPrice * xxx.gAmount }" />		
				<tr>
					<td height="35" class="td_default">
						<span class="a_default">${xxx.gName} </span>
					</td>
					<td height="35" class="td_default" align="center">
						<span  id = "price1">${xxx.gPrice}</span>원
					</td>
					<td height="35" class="td_default" align="center">
						<span id = "num1">${xxx.gAmount}</span>개
					</td>
					<td height="35" class="td_default" align="center">
						<span>${xxx.gPrice * xxx.gAmount}</span>원
					</td>
				</tr>		
</c:forEach>

			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	<tr>
	<td class="td_default"><b><font size="5">결제정보</font></b>
	</tr>

	<tr>
		<td height="15">
	</tr>

	<tr>
		<td>
			<table width="100%" border="1" style="border-collapse: collapse"
				bordercolor="#CCCCCC">
				<tr>
					<td class="td_default" width="150" height="35"> 결제금액</td>
					<td class="td_default" height="35" align = 'right'> 
					<input type = 'text' id = 'total' value = '${totalSum}' readonly>원
					</td>
				</tr>
				<tr>
					<td class="td_default" width="150" height="35"> 결제수단</td>
					<td class="td_default" height="35" align = 'right'> 
					<span>${xxx.payMethod}</span>
					</td>
				</tr>
			</table>
		</td>
	</tr>

	<tr>
		<td height="40">
	</tr>

	

	<tr>
		<td height="40">
	</tr>

	<tr>
		<td class="td_default" align="center"><a class="a_default"
			href="goodsList?gCategory=meat">계속 쇼핑하기</a></td>
	</tr>

	<tr>
		<td height="30">
	</tr>

</table>
</div>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
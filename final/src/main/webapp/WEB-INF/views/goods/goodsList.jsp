<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>

<link rel="stylesheet" href="css/goods.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>

<table width="100%" cellspacing="0" cellpadding="0">
		<tr>
			<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
			border="0">
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
	<!-- request에서 데이터 얻은 후  모든 멤버변수를 변수에 저장  후 표에 출력해줌-->
	<%--  <%
	  List<GoodsDTO>list = (List<GoodsDTO>)request.getAttribute("goodsList");
	    for(int i=1; i<=list.size(); i++){
	    GoodsDTO dto = list.get(i-1);
	    String gCode = dto.getgCode();
	    String gCategory = dto.getgCategory();
	    String gName = dto.getgName();
	    String gContent = dto.getgContent();
	    int gPrice = dto.getgPrice();
	    String gImage = dto.getgImage();
	%> --%>
	<!-- 반복시작 -->
	<!-- "goodsList"키의 ArrayList get해서 for문 동작시 방하나의 goodsDTO를 "dto"로 저장, status: 인덱스번호 -->
	<c:forEach var="dto" items="${goodsList}" varStatus="status">
	<td>
	<div class="card">
	<table style='padding:15px'>
		<tr>
			
			<td>
				<div class="img">
				<a href="goodsRetrieve?gCode=${dto.gCode}"> 
				<img src="images/items/${dto.gImage}.jpg" border="0" align="center" width="200">
				</a>
				</div>
			</td>
			
		</tr>
		<tr>
			<td height="10">
				</tr>
				<tr>
					<div class="gName">
						<td class= "td_default" align ="center">
								
								<a class= "a_black" href="goodsRetrieve?gCode=${dto.gCode}"> 
								${dto.gName}
								</a><br>
											
						</td>
					</div>
				</tr>
	<tr>
	<td height="10">
	</tr>
	<tr>
		<div class="content">
		<td class="td_gray" align ="center">
		${dto.gContent}
		</td>
		</div>
	</tr>
	<tr>
	<td height="10">
	</tr>
	<tr>
		<div class="price">
		<td class="td_red" align ="center"><font color="red"><strong>
		${dto.gPrice}원	</strong></font>
		</td>
		</div>
	</tr>
	</table>
	
	</td>
	</div>
	<!-- 한줄에 4개씩 보여주기 -->
	<c:if test="${status.count%4 == 0}"><!-- status는 forEach의 index번호 -->
	<tr>
	<td height="10"></td>
	</tr>
	  <%-- <%
	      if(i%4==0){
	  %>
	      <tr>
	        <td height="10">
	      </tr>
	  <%
	      }//end if
	  %>	--%>
	  <%-- <%
	    }//end for
	%> --%>
	  </c:if>
	</c:forEach>
	</tr>
	</table>
	</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>

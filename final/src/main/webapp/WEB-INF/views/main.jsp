<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 회원가입되었습니다 알림창-->
 <c:if test="${!empty success }">
	<script>alert("${success}")</script>
</c:if>

</head>
<body>

<jsp:include page="common/top.jsp" flush="false"></jsp:include><BR>
<jsp:include page="common/menu.jsp" flush="false"></jsp:include>
<jsp:include page="common/carousel.jsp" ></jsp:include>
<hr>
<jsp:include page="goods/goodsSearch.jsp" ></jsp:include>
<jsp:include page="goods/goodsList.jsp" ></jsp:include>

</body>
</html>
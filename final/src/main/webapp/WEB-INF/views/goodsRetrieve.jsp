<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

<jsp:include page="common/top.jsp" flush="false"></jsp:include><BR>
<jsp:include page="common/menu.jsp" flush="false"></jsp:include>
<jsp:include page="common/carousel.jsp" ></jsp:include>
<hr>
<jsp:include page="goods/goodsRetrieve.jsp" ></jsp:include>

</body>
</html>
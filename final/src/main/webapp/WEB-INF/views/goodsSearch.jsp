<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="common/top.jsp" flush="ture"></jsp:include>
<jsp:include page="common/menu.jsp" flush="ture"></jsp:include>
<jsp:include page="goods/goodsSearch.jsp" flush="ture"></jsp:include>
<br>
<jsp:include page="goods/goodsSearchList.jsp" flush="false"></jsp:include>
</body>
</html>
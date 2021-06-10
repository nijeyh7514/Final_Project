 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="css/header.css">

<c:if test="${empty login}">
<div class="header">
	<a href="memberForm">회원가입</a>&nbsp;|
	<a href="loginForm">로그인</a>&nbsp;|
	<a href="BoardList">고객센터</a>&nbsp;
</div>
</c:if>
<c:if test="${!empty login}">
<div class="header">
	안녕하세요 ${login.username }님
	<a href="loginCheck/logout">로그아웃</a>&nbsp;|
	<a href="loginCheck/mypage">마이페이지</a>&nbsp;|
	<a href="loginCheck/cartList">장바구니</a>&nbsp;|
	<a href="BoardList">고객센터</a>&nbsp;
	
	<!-- jsp주소아님/
	Controller RequestMapping=(value="/boardListT") -->
</div>
</c:if>

<br>
<h1>
<a href="goodsList?gCategory=meat"><img class="img-circle" 
 id="logo" src="images/logo.jpg" height="200" width="1000"></a>
</h1>
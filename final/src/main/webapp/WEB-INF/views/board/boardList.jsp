<%@page import="com.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>

<body>
<div class="container">
<br>
<h1 class="text-center"><a  href="#" style="color:#8A2BE2 ";>게시판 목록</a></h1>
<br>
<br>
<table class="table text-center table-hover table-striped " style="border: 1px solid;">
		<tr>
		<td colspan="5">
			<form action="loginCheck/boardList">
			<select name="searchName">
				<option value="title">제목</option>
				<option value="author">작성자</option>
			</select>
				<input type="text" name="searchValue">
				<input type="submit" value="검색">
			</form>
		</td>
	</tr>
	<tr class="text-center">
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	
	<tbody>
<c:forEach var = "boardList" items="${boardList}"><!-- var=변수명 -->
	<tr class="text-center">
		<th>${boardList.num}</th>
		<th><a href="loginCheck/boardRetrieve?num=${boardList.num}">${boardList.title}</a></th>
		<th>${boardList.author}</th>
		<th>${boardList.writeday}</th>
		<th>${boardList.readcnt}</th>
	</tr>
</c:forEach>
	</tbody>
</table>

<a href="boardWrite" class="btn btn-outline-info float-right">글쓰기</a>
</div>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
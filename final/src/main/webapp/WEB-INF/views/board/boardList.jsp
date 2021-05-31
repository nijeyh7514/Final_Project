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
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script>

</script>
<style type="text/css">
.line1{border-top:2px solid purple;
	border-bottom:1px solid black;}
</style>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>

<body>
<div class="container">
<br>
<h1 class="text-left">고객센터</h1>
<br>
<br>

<table width="100%">
<!-- <table class="table text-center"> -->
   
   <tr class="line1" align="center" height="30">
      <td>번호</td>
      <td>제목</td>
      <td>작성자</td>
      <td>작성일</td>
      <td>조회</td>      
      </tr>      
   <tbody>
     
   <!-- 게시판 글 목록 출력은 어떻게 되는거지? -->  
<c:forEach var = "boardList" items="${boardList}"><!--  -->
<!--
var:사용할 변수명 
items은 Collecion객체이다(List,ArrayList,Map등 )  -->
   
   <tr align="center" height="30">      
      <td>${boardList.num}</td>
      <td><a href=boardRetrieve?num=${boardList.num}>${boardList.title}</a></td>
      <td>${boardList.author}</td>
      <td>${boardList.writeday}</td>
      <td>${boardList.readcnt}</td>
   </tr>
   
</c:forEach>
   </tbody>
   
</table>

<form action="boardList"><!--  -->
         <select name="searchName">
            <option value="title">제목</option>
            <option value="author">작성자</option>
         </select>
            <input type="text" name="searchValue">
            <input type="submit" value="검색">
         </form>
         
	<c:if test="${empty login}">
	<div class="header">		
</div>
</c:if>

   <c:if test="${!empty login}">
	<div class="header">
	<a href="/loginCheck/boardWrite" class="btn btn-outline-info float-right">글쓰기</a>
	</div>
	</c:if>

</div>
</body>
</html>
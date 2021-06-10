
<%-- <%@ page isELIgnored="false" %> --%><!-- 이거추가 -->
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
//없음
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
<br><table width="100%">
   <tr class="line1" align="center" height="30">
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>작성일</th>
      <th>조회</th>      
      </tr>
			<c:forEach var="boardList" items="${boardList}">
				<tr align="center" height="30">
					<th>${boardList.num}</th>
					<th><a href="BoardRetrieve?num=${boardList.num}">${boardList.title}</a></th>
					<th>${boardList.author}</th>
					<th>${boardList.writeday}</th>
					<th>${boardList.readcnt}</th>
				</tr>
			</c:forEach>
		</table>

<!-- 제목또는 작성자 게시글 검색기능-->
<form action="BoardList"><!--BoardController 서블릿이동  -->
         <select name="searchName">
            <option value="title">제목</option>
            <option value="author">작성자</option>
         </select>
            <input type="text" name="searchValue">
            <input type="submit" value="검색">
         </form>
         
 <!--로그인시 글쓰기기능 구현가능 -->        
	<c:if test="${empty login}">
	<div class="header">
<a href="loginCheck/loginForm" class="btn btn-outline-info float-right">글쓰기</a>
</div>
</c:if>
   <c:if test="${!empty login}">
	<div class="header">
	<a href="boardWrite" class="btn btn-outline-info float-right">글쓰기</a>
	</div>
	</c:if>

</div>
</body>
</html>
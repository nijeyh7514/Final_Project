<%@page import="com.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

//글 수정
function updateBoard(e,f){
	 e.preventDefault();//이벤트 중단
	 f.action="loginCheck/boardUpdate";//쿼리id
	 f.submit();
}

//글 삭제
function deleteBoard(e,num){
	 e.preventDefault();//이벤트 중단
	 location.href="loginCheck/boardDelete?num="+num;
}

//글목록으로 돌아가기
$(function(){
	$("#btnList").on('click',function(e){
		e.preventDefault();
		location.href="boardList";//loginCheck/
	});
});
</script>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<div class="container">
<h1>고객센터</h1>
<form name="myForm" action="BoardReplyServlet">
<input type="hidden" name="num" value="${boardRetrieve.num}">
글번호:${boardRetrieve.num}&nbsp;작성일:${boardRetrieve.writeday}
조회수:${boardRetrieve.readcnt}<br>
제목:<input type="text" name="title" value="${boardRetrieve.title}" class="form-control"><br>
작성자:<input type="text" name="author" value="${boardRetrieve.author}" class="form-control"><br>
내용:<textarea rows="10" cols="10" name="content" class="form-control">${boardRetrieve.content}</textarea>

<button onclick="deleteBoard(event, ${boardRetrieve.num})">삭제</button>
<button onclick="updateBoard(event, myForm)">목록보기</button>

</form>
<input type="button" class="btn btn-sm btn-primary" id="btnList" value="목록"><!--이거안됨-->
<a href="BoardReplyUIServlet?num"+${boardRetrieve.num}>답변달기</a><br>

</div>


<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script>

	//글목록으로 돌아가기
	$(function(){
		$("#btnList").on('click',function(e){
			e.preventDefault();
			location.href="boardList";
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
<h1>게시판글쓰기</h1>
<form action="loginCheck/boardWrite" method="post">
제목:<input type="text" name="title" class="form-control"><br>
작성자:<input type="text" name="author"  class="form-control"><br>
내용:<textarea rows="10" cols="10" name="content"  class="form-control"></textarea>
<input type="submit" value="저장" class="btn btn-sm btn-primary">
<input type="button" class="btn btn-sm btn-primary" id="btnList" value="목록">
</form>
</div>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
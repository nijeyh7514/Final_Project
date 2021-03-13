<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="css/form.css">
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function() {	
	$("Form").on("submit", function(event) {
		var userid = $("#userid").val();
		var passwd = $("#passwd").val();
		if (userid.length == 0) {
			alert("아이디를 입력해주세요")
			$("#userid").focus();
			event.preventDefault();
		} else if (passed.length == 0) {
			alert("비밀번호를  입력해주세요")
			$("#passwd").focus();
			event.preventDefault();
		}//else if
	});//form
		/* var userid1 = $("#userid").val();
		var passwd1 = $("#passwd").val()
		if (userid1==null) {
			alert("아이디를 입력해주세요 ")
			$("#userid").focus();
			event.preventDefault();
		} else if (passwd1==null) {
			alert("비밀번호를 입력해주세요")
			$("#passwd").focus();
			event.preventDefault();
		}//else if */
	});//function
</script>
<c:if test="${!empty mesg }">
	<script>
		alert('${mesg}');
	</script>
</c:if>
<div id="section">
	<h3>로그인</h3>
	<div id="content">
		<form action="login" method="get">
		<div class="Form">
		<!-- id="#" class="." -->
			<input type="text" id="userid" name="userid" placeholder="아이디를 입력해주세요"><br>
			<input type="text" id="passwd" name="passwd" placeholder="비밀번호를 입력해주세요"><br>
			</div>
			<div class="Btn">
				<input type="submit" name="submit" value="로그인"><br>
				<input type="reset" value="취소">
			</div>
		</form>
	</div>

</div>
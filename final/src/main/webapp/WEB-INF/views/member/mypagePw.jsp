<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="com.dto.MemberDTO"%>
<link rel="stylesheet" href="css/form.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript"> 

<%
//로그인정보 가져오고
MemberDTO dto = (MemberDTO)session.getAttribute("login");
%>
//dto에서 비밀번호 정보 가져옴 


//로그인정보의 비밀번호 재확인 메세지
$(function() {
$("#passwd").on("keyup",function(){
		var passwd = $("#passwd").val();
		var mesg = "비밀번호를 정확하게 입력해주세요";	
		
		if(<%= dto.getPasswd()%>==passwd){
			mesg = "비밀번호가 확인되었습니다";
		};
		$("#result1").text(mesg);
	});
});
//회원정보의 비번일치 검사

</script>
<div id="section">
<h2></h2>
<div id="content">
<form action="loginCheck/mypage" method="get">
<p>회원정보 확인을 위해 비밀번호를 한번 더 확인합니다.</p>
<p>비밀번호 재확인</p>
<input type="text" name="passwd" id="passwd" placeholder="비밀번호를 입력해주세요">
<br> 
<span id="result1"></span>
<br>
<div class="Btn">
<input type="submit" value="확인"><br>
</div>
</form>
</div>
</div>

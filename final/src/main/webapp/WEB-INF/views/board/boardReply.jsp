<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.BoardReplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <!DOCTYPE html> 
<html>
<meta charset="UTF-8"> 
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<title></title>
</head>

<script type="text/javascript" src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

//*(게시글) 댓글삭제
/* $(function(){
   $(".delBtn").on("click", function() {
      var num = $(this).attr("data-xxx");
      location.href = "";
   });
}); */

</script>
<%
MemberDTO dto = (MemberDTO)session.getAttribute("login");
String username=null;
   if(dto!=null){
      username = dto.getUsername();
   }
%>

<body>
<div class="container">
   <form action="BoardReply" method="post">
      <!-- 답변글 작성란 -->
      <input type="hidden" name="num" value="${boardRetrieve.num}">
      <input type="hidden" name="author" value="<%=username %>">
      <table>
         <tr>
            <th colspan="4"><h4>댓글</h4></th></tr>
         <tr>
            <td width="50">이름</td>
            <td width="100"><%=username %></td>
            <td width="60">비밀번호</td>
            <td width="100"><input type="password" size="5" name="password" class="form-control"></td>
         </tr>
         <tr>
            <td>내용</td>
            <td colspan="3"><input type="text" size="44" style="height:50px"  name="content" class="form-control"></td>
         </tr>
         <tr>
            <td clospan="4">
            <input type="submit" value="저장" name="replyWrite" class="btn btn-sm btn-primary"> 
            </td>
            <td>
               <input type="reset" value="다시쓰기" name="replyUpdate" class="btn btn-sm btn-primary">
            </td>   
            </tr>
      </table>
      </form>
      <br>
      <h4>댓글목록</h4><br>  
   <table width="50%" border="0">
    <tr>
      <th>작성자</th>
      <th>덧글내용</th>
      <th>작성일</th>
   </tr>
      <c:forEach var = "reply" items="${replyList}">
      
 <tr class="reply" align="center">
      <td>${reply.author}</td>
      <td>${reply.content}</td>
      <td>${reply.writeday}</td>   
      <td><input type="button" value="삭제" id="xx${reply}" 
             class="delBtn" data-xxx="${reply.contentNum }"></td>
      <td><input type="button" value="수정" class="updateBtn" ></td>
</tr>
</c:forEach> 
    </table>          




<br>
</div>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
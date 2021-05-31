<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

<link rel="stylesheet" href="css/goods.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
<div class="container" style="margin-left: 250px;">
<table width="100%" cellspacing="0" cellpadding="0">

	<tr>
		<td>
			<table align="center" width="710" cellspacing="0" cellpadding="0"
				border="0">
				
				<tr>	
					<td height="5"></td>
				</tr>
				<tr>
					<td height="1" colspan="8" bgcolor="CECECE"></td>
				</tr>
				<tr>
					<td height="10"></td>
				</tr>

				<tr>
				
<!-- request에서 데이터 얻은 후  모든 멤버변수를 변수에 저장  후 표에 출력해줌-->
 <%
   	List<GoodsDTO>list = (List<GoodsDTO>)request.getAttribute("priceCategory");
 	System.out.println("SearchPCServlet에서"+list.size());
    for(int i=1; i<=list.size(); i++){
    	GoodsDTO dto = list.get(i-1);
    	String gCode = dto.getgCode();
    	String gCategory = dto.getgCategory();
    	String gName = dto.getgName();
    	String gContent = dto.getgContent();
    	int gPrice = dto.getgPrice();
    	String gImage = dto.getgImage();
 %>
						<td>
						
						<div class="card">
							<table style='padding:15px'>
								<tr>
									<td>
										<div class="img">
										<a href="goodsRetrieve?gCode=<%=gCode %>"> 
											<img src="images/items/<%=gImage %>.jpg" border="0" align="center" width="200">
										</a>
										</div>
									</td>
								</tr>
								<tr>
								
									<td height="10">
								</tr>
								<tr>
									<div class="gName">
									<td class= "td_default" align ="center">
										<a class= "a_black" href=""> 
										<%= gName%><br>
										</a>
										
									</td>
									</div>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<div class="content">
									<td class="td_gray" align ="center">
										<%= gContent%>
									</td>
									</div>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<div class="price">
									<td class="td_red" align ="center"><font color="red"><strong>
									<%= gPrice%>	</strong></font></td>
									</div>
								</tr>
							</table>
						</td>
						</div>
				
					<!-- 한줄에 4개씩 보여주기 -->	
				   <%
				      if(i%5==0){
				   %>
				       <tr>
				        <td height="10">
				       </tr>
				   <%
				      }//end if
				   %>		
						
<%
    }//end for
%>
				<td>
				<%-- 	<%
					
    				int curPage = pDTO.getCurPage();
    				int perPage = pDTO.getPerPage();
    				int totalCount = pDTO.getTotalCount();
    				int totalPage = totalCount/perPage;
    				if(totalCount%perPage!=0) totalPage++;	
					for(int i = 1; i<= totalPage; i++){
						if(i == curPage){
							out.print(i + "&nbsp;");
						}else{
							out.print("<a href='goodsSearchList?curPage="+i+"&searchName="+searchName+"&searchValue="+searchValue+"'>"+i+"</a>&nbsp;");
						}
					}
					
					
					
					%> --%>
				</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>
</div>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</body>
</html>
    
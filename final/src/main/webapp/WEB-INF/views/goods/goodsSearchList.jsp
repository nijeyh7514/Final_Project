<%@page import="com.dto.PageDTO"%>
<%@page import="com.dto.GoodsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 검색된 상품 화면에 출력되는 곳-->
<%
	PageDTO pDTO = (PageDTO)request.getAttribute("pDTO");
	System.out.println(pDTO);
	List<GoodsDTO> list = pDTO.getList();
	
	String searchName = (String)request.getAttribute("searchName");
	String searchValue = (String)request.getAttribute("searchValue"); 
%>
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
   
 	System.out.println("goodsSearchList에서"+list.size());
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
							<table style='padding:15px'>
								<tr>
									<td>
										<a href="goodsRetrieve?gCode=<%= gCode%>"> 
											<img src="images/items/<%=gImage %>.jpg" border="0" align="center" width="200">
										</a>
									</td>
								</tr>
								<tr>
								
									<td height="10">
								</tr>
								<tr>
									<td class= "td_default" align ="center">
										<a class= "a_black" href=""> 
										<%= gName%><br>
										</a>
										
									</td>
									
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_gray" align ="center">
										<%= gContent%>
									</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_red" align ="center"><font color="red"><strong>
									<%= gPrice%>	</strong></font></td>
								</tr>
							</table>
						</td>
					<!-- 한줄에 4개씩 보여주기 -->	
				   <%
				      if(i%4 == 0){
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
				</tr>
				<tr>
					<td>
				<!-- 페이징처리되는 곳 -->
					<%					
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
					
					
					
					%>
					
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="10">
	</tr>
</table>
    
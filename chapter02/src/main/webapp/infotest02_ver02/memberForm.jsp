<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
</head>
<body>
    	  <jsp:include page="header.jsp"></jsp:include>

  <section>
    	<table>
    		<tr>
    			<th>회원번호</th>
    			<th>회원성명</th>
    			<th>전화번호</th>
    			<th>주소</th>
    			<th>가입일자</th>
    			<th>고객등급</th>
    			<th>거주지역</th>
    		</tr>
    		
    		  <%try{
    			  String grade ="";
    			  
    			  Class.forName(driver);
    			  con = DriverManager.getConnection(url, user, password);
    			  String sql ="select * from member_tbl_02";
    			  pstmt = con.prepareStatement(sql);
    			  rs = pstmt.executeQuery();
    			  
    			  while(rs.next()){
    				  grade= rs.getString("grade");
    				 String gradeName = grade.equals("A") ? "VIP" 
    						 :grade.equals("B") ? "일반" 
    						:grade.equals("C") ? "직원" : "";
    			%>
    			    	<tr>
    		    		<td><a class="link" href="modForm.jsp?id=<%= rs.getInt("custno") %>"><%= rs.getInt("custno") %></a></td>
    		    		<td><%= rs.getString("custname") %></td>
    		    		<td><%= rs.getString("phone") %></td>
    		    		<td><%= rs.getString("address") %></td>
    		    		<td><%= rs.getString("joindate")%></td>
    		    		<td><%= gradeName %></td>
    		    		<td><%= rs.getString("city") %></td>
    		    	</tr>
    			  <%}
    			  
    		  } catch (Exception e) {
    			    e.printStackTrace();
    			  } finally {
    			    try {
    			      if (rs != null) rs.close();
    			      if (pstmt != null) pstmt.close();
    			      if (con != null) con.close();
    			    } catch (Exception e) { e.printStackTrace(); }
    			  }%>
    	
   		<!-- 회원번호는 클릭하면 수정화면으로 이동할 때 custno를 get방식으로 넘겨야함 
   			get방식 = 이동할페이지 이름 ? 변수 = 필드명 
   		-->
	
    	</table>
    	
    	</section>
    	  <jsp:include page="footer.jsp"></jsp:include>
    	
    	


    
</body>
</html>
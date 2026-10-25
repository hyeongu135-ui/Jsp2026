<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
	<%@ page import ="java.sql.*" %>   
	<%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
</head>
<body>
	
		<jsp:inc lude page="header.jsp"></jsp:include>
	<%
	request.setCharacterEncoding("utf-8");
	DecimalFormat df =new DecimalFormat("#,###");
	DecimalFormat df2 =new DecimalFormat("￦#,###");
	try {%>
		<%Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		
    	String spl = "select t.custno, t.custname,grade,sum(price) from member_tbl_02 t "
    				+ "join money_tbl_02 m on t.custno = m.custno "
    				+ "group by custno;";
    	pstmt = con.prepareStatement(spl);
    	rs = pstmt.executeQuery();
    	
    	%>
	<section>
    		<table>
    		<tr>
    			<th>회원번호</th>
    			<th>회원성명</th>
    			<th>고객등급</th>
    			<th>매출</th>
    		</tr>
    		<%while(rs.next()){%>
    			<tr>
    				<td><%= rs.getString("t.custno") %></td>
    				<td><%= rs.getString("t.custname") %></td>
    				<td><%= rs.getString("grade") %></td>
    				<td><%= rs.getString("sum(price)") %></td>
    			</tr>
    		<%} %>
    		</table>
    </section>
    			<jsp:include page="footer.jsp"></jsp:include>
    	
    
  <%} catch (Exception e) {
    e.printStackTrace();
  } finally {
    try {
      if (rs != null) rs.close();
      if (pstmt != null) pstmt.close();
      if (con != null) con.close();
    } catch (Exception e) { e.printStackTrace(); }
  }%>
</body>
</html>
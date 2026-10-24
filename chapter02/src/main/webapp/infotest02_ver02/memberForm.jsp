<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		request.setCharacterEncoding("utf-8");
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat sf2 = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
			
			
    	String sql = "SELECT * FROM member_tbl_02;";
    	pstmt = con.prepareStatement(sql);
    	rs = pstmt.executeQuery();%>
    	
    	
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
    	<%while(rs.next()){%>
    	
    	<tr>
    		<td><%-- <a href="modFrom.jsp?=<%=rs.getString("custno")%>"> --%><%= rs.getString("custno") %></a></td>
    		<td><%= rs.getString("custname") %></td>
    		<td><%= rs.getString("phone") %></td>
    		<td><%= rs.getString("address") %></td>
    		<td><%= sf2.format(sf.parse(rs.getString("joindate")))%></td>
    		<td><%= rs.getString("grade") %></td>
    		<%--<td><% 
    		if("A".equals(rs.getString("grade"))){%>
     		<%= "VIP" %>
    		<%}else if("B".equals(rs.getString("grade"))){%>
    		<%= "일반" %>
    		<%}else if("C".equals(rs.getString("grade"))){%>
    		<%= "직원" %>
    		<%}%>
    		</td> --%>
    		<td><%= rs.getString("city") %></td>
    	</tr>	
    	<%}%>
    	</table>
    
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
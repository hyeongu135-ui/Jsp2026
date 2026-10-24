<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
	<%@ page import ="java.sql.*" %>   
	<%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String id = request.getParameter("num");
	   String sql = "select * from member_tbl_02";
	   pstmt = con.prepareStatement(sql);
	   rs = pstmt.executeQuery();
	%>
</body>
</html>
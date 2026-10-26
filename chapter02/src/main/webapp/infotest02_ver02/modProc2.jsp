<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*"%>
    <%@ page import= "java.sql.*" %>
    <%@ include file="db_conn.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	
	
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String add = request.getParameter("add");
	String day = request.getParameter("day");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);		
		String sql = "update member_tbl_02 set custname = ? , phone = ?, address = ?, joindate =?, grade=?, city=? "
				+ "where custno= ?;";
				
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, tel);
		pstmt.setString(3, add);
		pstmt.setString(4, day);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setString(7, num);
		boolean result = pstmt.executeUpdate() > 0;
		
		if(result){%>
			<script type="text/javascript">
				alert('업뎃 성공');
				location.href ="memberForm.jsp"
			</script>
		<%}; %>
		
	<%}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
		if(rs != null)rs.close();
		if(pstmt != null)pstmt.close();
		if(con != null)con.close();}
		catch(Exception e){e.printStackTrace();}
	}
	
	
	
%>


</body>
</html>
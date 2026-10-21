<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량조회</title>
</head>
<body>
<h1>주행내역조회</h1>
	<% 
	DecimalFormat dec = new DecimalFormat();
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt = null;
	Connection con = null;
	ResultSet rs = null;
	//id를 체크하는 체크키

	// DB 접속 정보 설정
	String driver = "com.mysql.cj.jdbc.Driver"; //JDBC드라이버
	// DB URL(스키마 이름 : jspdb)
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root"; //DB계정 아이디
	String password = "1234";//DB계정 비밀번호
	
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		String sql = "SELECT d.DRIVE_DATE,d.CAR_NO,c.CAR_MODEL,d.DRIVE_START,d.DRIVE_END,d.DEPT_CODE,d.DRIVE_MONEY FROM tbl_drive dinner join tbl_car c on d.CAR_NO = c.CAR_NO";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();%>
		<table border="1">
			<tr>
				<th>주행일자</th>
				<th>차량번호</th>
				<th>모델</th>
				<th>출발Km</th>
				<th>도착Km</th>
				<th>부서명</th>
				<th>주유금액</th>
			</tr>
			
			<%while(rs.next()){ %>
			
			<tr>
				<td><%= rs.getString("d.DRIVE_DATE") %></td>
				<td><%= rs.getString("d.CAR_NO") %></td>
				<td><%= rs.getString("c.CAR_MODEL") %></td>
				<td><%= rs.getString("d.DRIVE_START") %></td>
				<td><%= rs.getString("d.DRIVE_END") %></td>
				<td><%= rs.getString("d.DEPT_CODE") %></td>
				<td><%= rs.getString("d.DRIVE_MONEY") %></td>
			</tr>
		</table>
		
		<%}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
				if(rs != null){
					rs.close();
				}if(pstmt != null){
					pstmt.close();
				}if(con != null){
					con.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
				}%>
</body>
</html>

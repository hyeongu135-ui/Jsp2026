<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량조회</title>
</head>
<body>
	<h3>(부서별)주행통계</h3>
	<%
	
	DecimalFormat df = new DecimalFormat("#,##0");
	DecimalFormat df02 = new DecimalFormat("￦#,##0");
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
	

		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		String sql = "select d.DEPT_COD,DEPT_NAME,sum(DRIVE_END-DRIVE_START) as s ,sum(DRIVE_MONEY) as t  from tbl_drive t "
				 + "inner join tbl_dept d on t.DEPT_CODE = d.DEPT_COD "
				 + "group by d.DEPT_COD "
				 + "ORDER BY d.DEPT_COD;"; 
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();%>
		<table class="list">
			<tr>
				<th>부서코드</th>
				<th>부서명</th>
				<th>총운행거리</th>
				<th>총주유금액</th>
			</tr>
			<%while(rs.next()){ %>
			<tr>
				<td><%= rs.getString("d.DEPT_COD") %></td>
				<td><%= rs.getString("DEPT_NAME") %></td>
				<td><%= rs.getInt("s") %></td>
				<td><%= df02.format(rs.getInt("t")) %></td>
			</tr>
			<%} %>
		</table>
	
<body>
</body>
</html>
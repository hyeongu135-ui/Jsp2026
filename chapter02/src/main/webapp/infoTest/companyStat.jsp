<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(제조사별) 주행통계</title>
</head>
<body>

	<h3>(제조사별) 주행통계</h3>
	<table class="list">
		<tr>
			<th>제조사</th>
			<th>차량수</th>
			<th>총운행거리</th>
			<th>총주유금액</th>
		</tr>
	<%
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
		con=DriverManager.getConnection(url, user, password);
		String spl = "select c.CAR_COMPANY,COUNT(distinct c.CAR_NO) as c,SUM(DRIVE_END-DRIVE_START) as x,SUM(DRIVE_MONEY) as z "
				+ "from tbl_car c "
				+ "left join tbl_drive d on c.CAR_NO = d.CAR_NO "
				+ "group by c.CAR_COMPANY "
				+ "order by z desc;";
				
		pstmt = con.prepareStatement(spl);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
	%>

			<tr>
				<td><%= rs.getString("c.CAR_COMPANY") %></td>
				<td><%= rs.getString("c") %></td>
				<td><%= rs.getString("x") %></td>
				<td><%= rs.getString("z") %></td>
			</tr>
		<%} %>
	<%}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){try{rs.close();}catch(Exception e){e.printStackTrace();}}
		if(pstmt != null){try{pstmt.close();}catch(Exception e){e.printStackTrace();}}
		if(con != null){try{con.close();}catch(Exception e){e.printStackTrace();}}
	} %>
</table>
	
</body>
</html>
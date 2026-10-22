<%@page import="java.text.SimpleDateFormat"%>
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
<h3>주행내역조회</h3>
	<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
	SimpleDateFormat sf02 = new SimpleDateFormat("yyyy년mm월dd일");
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
	
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		String sql = "select CAR_DATE,c.CAR_NO,CAR_MODEL,DRIVE_START,DRIVE_END,DEPT_NAME,DRIVE_MONEY "+
				"from tbl_drive d "+
				"inner join tbl_car c on c.CAR_NO = d.CAR_NO "+
				"inner join tbl_dept p on d.DEPT_CODE = p.DEPT_COD "+
				"order by  d.CAR_NO ASC;";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();%>
		<table class="list">
			<tr>
				<th>주행일자</th>
				<th>차량번호</th>
				<th>모델</th>
				<th>출발Km</th>
				<th>도착Km</th>
				<th>부서명</th>
				<th>주유금액</th>
			</tr>
			
			<%while(rs.next()){%>
			
			<tr>
				<td ><%= sf02.format(sf.parse(rs.getString("CAR_DATE"))) %></td>
				<td ><%= rs.getString("CAR_NO") %></td>
				<td ><%= rs.getString("CAR_MODEL") %></td>
				<td ><%= df.format(rs.getInt("DRIVE_START"))  %></td>
				<td ><%= df.format(rs.getInt("DRIVE_END")) %></td>
				<td ><%= rs.getString("DEPT_NAME") %></td>
				<td ><%= df02.format(rs.getInt("DRIVE_MONEY")) %></td>
			</tr>
		<%}%>
		</table>
		
			<% }catch(Exception e){
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


<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import = "java.sql.*" %>
    <%@ include file="db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량조회</title>
</head>
<body>
<h3>차량조회</h3>
	<% 
/* 	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt = null;
	Connection con = null;
	ResultSet rs = null;
	//id를 체크하는 체크키

	// DB 접속 정보 설정
	String driver = "com.mysql.cj.jdbc.Driver"; //JDBC드라이버
	// DB URL(스키마 이름 : jspdb)
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root"; //DB계정 아이디
	String password = "1234";//DB계정 비밀번호 */
	
	SimpleDateFormat sf = new SimpleDateFormat("yyyymmdd");
	SimpleDateFormat sf02 = new SimpleDateFormat("yyyy년mm월dd일");
	
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		String sql = "select * from TBL_CAR";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();%>
		
		<table class="list">
			<tr>
				<th>차량번호</th>
				<th>모델</th>
				<th>제조사</th>
				<th>구매일</th>
			</tr>
			<% while(rs.next()){
		String date = rs.getString("CAR_DATE");
		String format = date.substring(0,4)+"년"
						+date.substring(4, 6)+"월"
						+date.substring(6, 8)+"일";
		%>
				<tr>
				<td class="form"><%= rs.getString("CAR_NO") %></td>
				<td class="form"><%= rs.getString("CAR_MODEL") %></td>
				<td class="form"><%= rs.getString("CAR_COMPANY") %></td>
				<!-- 
					format()은 Date형식이고, DB는 String이기 때문에
					parse() : String -> Date => 20230101 => Date객체로 변환
					format() : Date -> String => Date객체 => "2023년01월01일"
				 -->
				<td class="form"><%= sf02.format(sf.parse(rs.getString("CAR_DATE"))) %></td>
				</tr>
			<% } %>

		</table>
		
	<%}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){
			try{rs.close();}catch(Exception e){
				e.printStackTrace();}
		}if(pstmt != null){
			try{pstmt.close();}catch(Exception e){
				e.printStackTrace();}
		}
		if(con != null){
			try{con.close();}catch(Exception e){
				e.printStackTrace();}
		}
	}
	%>
</body>
</html>
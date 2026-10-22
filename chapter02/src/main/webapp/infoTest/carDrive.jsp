<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량별주행조회</title>
</head>
<body>
	<h3>차량별주행조회</h3>
	<form action="index.jsp" method="post">
		<select name ="car" >
			<option>차량선택</option>
			<option value = "0001">[10가0001]소나타</option>
			<option value = "0002">[10가0002]K5</option>
			<option value = "0003">[10가0003]SM5</option>
			<option value = "0004">[10가0004]그랜저</option>
			<option value = "0005">[10가0005]K5</option>
		</select>
	<button type="submit">조회</button>
	
	</form>
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

	try {
		
		Class.forName(driver);
		con=DriverManager.getConnection(url, user, password);
		
		
		
		
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	try {
		if (rs != null) {
			rs.close();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	try {
		if (pstmt != null) {
			pstmt.close();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	try {
		if (con != null) {
			con.close();
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	}
	%>
</body>
</html>
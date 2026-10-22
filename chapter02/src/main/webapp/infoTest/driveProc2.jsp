<%@page import="javax.tools.DocumentationTool.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주행내역등록</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt = null;
	Connection con = null;
	ResultSet rs = null;
	//id를 체크하는 체크키
	String day = request.getParameter("DRV_DATE");
	String num = request.getParameter("CAR_NO");
	int st = Integer.parseInt(request.getParameter("DRV_START"));
	String end = request.getParameter("DRV_END");
	String de = request.getParameter("DEPT_CODE");
	String money = request.getParameter("DRV_MONEY");
	String msg = "";

	// DB 접속 정보 설정
	String driver = "com.mysql.cj.jdbc.Driver"; //JDBC드라이버
	// DB URL(스키마 이름 : jspdb)
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root"; //DB계정 아이디
	String password = "1234";//DB계정 비밀번호
	
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		String sql = "insert into TBL_DRIVE values(?,?,?,?,?,?)";

		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, day);
		pstmt.setString(2, num);
		pstmt.setInt(3, st);
		pstmt.setInt(4, Integer.parseInt(end));
		pstmt.setString(5, de);
		pstmt.setString(6, money);

		//insert는 ExecuteUpdate()메소드를 이용하여 실행
		//insert, delete, update쿼리는 executeUpdate()메소드를 이용하여 실행한다
		//select => excuteQuery()메소드를 이용하여 실행함
		// 			단, select문의 결과는 ResultSet객체에 담는다.
		pstmt.executeUpdate();%>
		<script type="text/javascript">
		alert("주행내역이 정상적으로 등록 되었습니다!")
		location.href = "main.jsp";
		</script>
		%>
	
	

	<%
	}catch (Exception e) {
	e.printStackTrace();
	} finally {
	if (pstmt != null) {
		try {
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	if (con != null) {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
			}
		}
	}
	%>
</body>
</html>
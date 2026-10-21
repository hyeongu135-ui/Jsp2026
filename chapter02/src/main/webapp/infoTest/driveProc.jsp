<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import = "java.sql.*" %>
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
	String st = request.getParameter("DRV_START");
	String end = request.getParameter("DRV_END");
	String de = request.getParameter("DEPT_CODE");
	String money = request.getParameter("DRV_MONEY");
	String msg ="";

	// DB 접속 정보 설정
	String driver = "com.mysql.cj.jdbc.Driver"; //JDBC드라이버
	// DB URL(스키마 이름 : jspdb)
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root"; //DB계정 아이디
	String password = "1234";//DB계정 비밀번호
	if(day.equals("")||day==null){
		msg = "주행일자가입력되지않았습니다!";
	} else if(num.equals("")|| num==null){
		msg = "차량번호가입력되지않았습니다!";
	} else if(st.equals("")|| st==null){
		msg = "출발Km가입력되지않았습니다!";
	} else if(end.equals("")|| end == null){
		msg = "도착km가입력되지않았습니다!";
	} else if(de.equals("")|| de == null){
		msg = "부서코드가선택되지않았습니다!";
	} else if(money.equals("")|| money==null){
		msg = "주유금액이입력되지않았습니다!";
	}%>
	<script>
		alert("<%=msg %>");
	</script>

	
	<%
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		String sql = "insert into TBL_DRIVE values(?,?,?,?,?,?)";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		pstmt.setString(1, day);
		pstmt.setString(2, num);
		pstmt.setString(3, st);
		pstmt.setString(4, end);
		pstmt.setString(5, de);
		pstmt.setString(6, money);

		//insert는 ExecuteUpdate()메소드를 이용하여 실행
		//insert, delete, update쿼리는 executeUpdate()메소드를 이용하여 실행한다
		//select => excuteQuery()메소드를 이용하여 실행함
		// 			단, select문의 결과는 ResultSet객체에 담는다.
		pstmt.executeUpdate(); // insert를 성공하면 1을 반환
		
	%>

		<%}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(con != null){
				try{con.close();}catch(Exception e){
					e.printStackTrace();}
			}if(rs != null){
				try{rs.close();}catch(Exception e){
					e.printStackTrace();}
			}if(pstmt != null){
				try{con.close();}catch(Exception e){
					e.printStackTrace();}
			}
		}%>
</body>
</html>
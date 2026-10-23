<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.util.*"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 삭제하기</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		String msg= "";
		
		String driver = "com.mysql.cj.jdbc.Driver"; //JDBC드라이버
		// DB URL(스키마 이름 : jspdb)
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root"; //DB계정 아이디
		String password = "1234";//DB계정 비밀번호
		
		if(pass.equals("")|| pass == null){
			msg = "비밀번호를 입력하세요";
		}else{
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			String sql = "select id,pass from member where id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				rs.close();
				pstmt.close();
			
			String sql2 = "delete from member where id='?';";
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			int result = pstmt.executeUpdate();
			
			if(result > 0){
				msg = "업뎃 성공";
			}else{
				msg = "업뎃 실패";
			}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null){try{rs.close();}catch(Exception e){e.printStackTrace();}}
			if(pstmt != null){try{pstmt.close();}catch(Exception e){e.printStackTrace();}}
			if(con != null){try{con.close();}catch(Exception e){e.printStackTrace();}}
		}}
		%>
		<script type="text/javascript">
			alert('<%=msg%>');
			location.href = "main.jsp?page=MemberList"
		</script>
	
	
</body>
</html>
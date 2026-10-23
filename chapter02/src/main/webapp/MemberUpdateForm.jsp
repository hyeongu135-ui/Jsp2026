<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원수정</title>
</head>
<body>
	<h3>개인 회원정보 수정</h3>
	<%
	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	
	String email = "";
	String tel = "";
	/* 아이디 일치 여부 체크키 */
	boolean idchk = false;
	
	

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	//id를 체크하는 체크키
	
	// DB 접속 정보 설정
	String driver = "com.mysql.cj.jdbc.Driver"; //JDBC드라이버
	// DB URL(스키마 이름 : jspdb)
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root"; //DB계정 아이디
	String password = "1234";//DB계정 비밀번호
	
	try{
		//드라이브 연결
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		String sql = "select id,email,tel from member where id = ?;";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		if(rs.next()){
			idchk = true;
			email = rs.getString("email");
			tel = rs.getString("tel");
		}%>
		<form action="MemberUpdateProc.jsp" method="post">
		<input type = "hidden" name = id = value = <%= id %>><!-- ★ -->
		<table width="400" border="1">
			<tr height="50">
				<td align = "center" width="150">아이디</td>
				<!-- 넘겨받은 id는 수정 대상이아님 -->
				<td><%= id %></td>
			</tr>
			<tr height="50">
				<td align = "center" width="150">이메일</td>
				<td width="250"><input type="email" name="email" value="<%=email%>"></td>
			</tr>
			<tr height="50">
				<td align = "center" width="150">전화번호</td>
				<td width="250">
					<input type="tel" name="tel" value="<%=tel%>">
				</td>
			</tr>
			<tr height="50">
				<td align = "center" width="150">패스워드</td>
				<td width="250">
					<input type="password" name="pass2" placeholder="본인 비밀번호 입력">
				</td>
			</tr>
			<tr height="50">
				<td align = "center" colspan="2">
					<input type="submit" value ="회원 수정하기">&nbsp;
					<input type="button" value ="회원 전체보기" onclick="location.href='main.jsp?page=MemberList'">&nbsp;
				</td>
			</tr>
		</table>
	</form>
		<%
		//DB연동
		//쿼리문
		/* 일치하는지 확인 */
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){
			try{
				rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(pstmt != null){
			try{
				pstmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(con != null){
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	%>


</body>
</html>
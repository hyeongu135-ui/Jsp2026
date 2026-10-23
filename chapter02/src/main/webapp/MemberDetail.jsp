<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원정보 보기</h1>
	<%
	// 스크립트릿은 자바 코드만 가능함
	request.setCharacterEncoding("utf-8");

	// RequestJoin.jsp의 입력값 전부 받아올것 Request 객체를 통해
	// 정보를 꺼내오세요.
	String id = request.getParameter("id");


	//DB 연동 시작 - ------------------------------------------

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
	
	try {

		//드라이버 로딩
		Class.forName(driver);
		//DB 연결
		con = DriverManager.getConnection(url, user, password);
		// select 쿼리문작성
		String sel = "select * from member where id=?";
		pstmt = con.prepareStatement(sel);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){%>
			<table border = "1">
				<tr height="50">
					<td align="center" width ="150">ID</td>
					<td width="350"><%= id %></td>
				</tr>
				<tr height="50">
					<td align="center" width ="150">이메일</td>
					<td width="350"><%=rs.getString("email") %></td>
				</tr>
				<tr height="50">
					<td align="center" width ="150">전화번호</td>
					<td width="350"><%=rs.getString("tel")  %></td>
				</tr>
				<tr height="50">
					<td align="center" width ="150">취미</td>
					<td width="350"><%=rs.getString("hobby")  %></td>
				</tr>
				<tr height="50">
					<td align="center" width ="150">직업</td>
					<td width="350"><%=rs.getString("job")  %></td>
				</tr>
				<tr height="50">
					<td align="center" width ="150">나이</td>
					<td width="350"><%=rs.getString("age")  %></td>
				</tr>
				<tr height="50">
					<td align="center" width ="150">남기는 말</td>
					<td width="350"><%=rs.getString("info")  %></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button onclick = "location.href='main.jsp?page=MemberUpdateForm&id=<%=id%>'">회원수정</button>
						<button onclick = "location.href='main.jsp?page=MemberDeleteForm&id=<%=id%>'">회원삭제</button>
						<button onclick = "location.href='main.jsp?page=MemberList'">목록보기</button>
						<button onclick = "location.href='main.jsp?page=MemberJoin'">회원가입</button>
					</td>
				</tr>
			</table>
			<a href="main.jsp?page=MemberJoin">회원가입으로 가기</a>
		<%} 
		
	}catch(Exception e){e.printStackTrace();}finally{
		if(rs != null){try{rs.close();}catch(Exception e){e.printStackTrace();}
		if(con != null){try{con.close();}catch(Exception e){e.printStackTrace();}
		if(pstmt != null){try{pstmt.close();}catch(Exception e){e.printStackTrace();}}
		}
	}
	}
	%>
</body>
</html>
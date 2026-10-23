<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.util.*"%>
<%@ page import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전체 목록보기</title>
</head>
<body>
	<h2>가입한 회원 전체목록</h2>
	<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int count = 0; // 회원수 세는 변수
	//id를 체크하는 체크키

	// DB 접속 정보 설정
	String driver = "com.mysql.cj.jdbc.Driver"; //JDBC드라이버
	// DB URL(스키마 이름 : jspdb)
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root"; //DB계정 아이디
	String password = "1234";//DB계정 비밀번호
	%>
	<!-- 테이블 태그 -->
		<table width="700" border ="1">
		<tr height="50" align="center">
			<th>번호</th>
			<th>아이디</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>관심분야</th>
			<th>직업</th>
			<th>연령</th>
			<th>남기는말</th>
			<th>상세보기</th>
		</tr>
		
	<%
	// DB는 네트워크의 톰캣서버를 통해 데이터가 전달되므로 개발자가 
	// 오류를 찾기 어렵다. 고로 try(){}catch()문을 이용해 작성함이 원칙이다.
	try {

		//드라이버 로딩
		Class.forName(driver);
		//DB 연결
		con = DriverManager.getConnection(url, user, password);
		// insert 쿼리문작성
	
		// 가입한 회원 모든정보 검색 select문 이용
		String sql = "select * from member";
		pstmt = con.prepareStatement(sql);
		// rs(resultSet)에 실행결과를 저장;
		rs = pstmt.executeQuery();
		//rs의 데이터가 1개이상이므로 반복문이 필요
		while(rs.next()){
			count++;
		%>
		<!-- select문으로 검색한 정보가 출력되는 tr이 필요함 -->
		<tr height="50" align="center">
			<td><%= count %></td>
			<td><%= rs.getString("id") %></td>
			<td><%= rs.getString("email") %></td>
			<td><%= rs.getString("tel") %></td>
			<td><%= rs.getString("hobby") %></td>
			<td><%= rs.getString("job") %></td>
			<td><%= rs.getString("age") %></td>
			<td><%= rs.getString("info") %></td>
			<td><a href="main.jsp?page=MemberDetail&id=<%= rs.getString("id")%>">상세보기</a>
		</tr>
		<% }
		}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){
			try{rs.close();}catch(Exception e){}}
		if(con != null){
			try{con.close();}catch(Exception e){}}
		if(pstmt != null){
			try{pstmt.close();}catch(Exception e){}}
	}
		%>
	</table>
	<a href="MemberJoin.jsp">회원가입으로 가기</a>
</body>
</html>
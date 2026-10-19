<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 나는 forward입니다.</h2>
	<%
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
	%>
		<h3>당신의 아이디는 <%=id%>이고, 당신의 비밀번호는 <%=pass%>입니다.</h3>
		<!-- Request 객체의 실행 범위는 다음페이지(RequestLoginProc)까지다. -->
	<a href="RequsetForward.jsp">다음페이지</a>
</body>
</html>
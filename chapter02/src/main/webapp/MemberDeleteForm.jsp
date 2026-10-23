<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import ="java.sql.*" %> <!-- 이거 위에 쓰면 안되는지? -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원 정보 삭제</h3>
			<% String id = request.getParameter("id"); %>

			<input type = "hidden" name = "id" value = "<%= id %>">
			<form action="MemberDeleteProc.jsp" method = "post">
			<table border ="1">
				<tr>
				<td>아이디</td><td><%= id %></td>
				</tr>
				<tr>
				<td>패스워드</td><td><input type="password" name = "pass"></td>
				</tr>
				<tr>
				<td colspan ="2">
				<input type ="submit" value = "회원 삭제하기">
				<input type ="reset" value = "회원 전체보기">
				</td>
				</tr>
			</table>
			</form>
		
</body>
</html>
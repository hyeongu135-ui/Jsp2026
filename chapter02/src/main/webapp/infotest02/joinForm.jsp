<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
	<%@ page import ="java.sql.*" %>   
	<%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8");
	%>
	<form action="joinProc.jsp" method="post">
	<table class ="form">
		<tr>
			<td>회원번호(자동생성)</td><td><input type="text" name = "num"></td>
		</tr>
		<tr>
			<td>회원성명</td><td><input type="text" name = "names"></td>
		</tr>
		<tr>
			<td>회원전화</td><td><input type="text" name = "tel"></td>
		</tr>
		<tr>
			<td>회원주소</td><td><input type="text" name = "ac"></td>
		</tr>
		<tr>
			<td>가입일자</td><td><input type="text" name = "day"></td>
		</tr>
		<tr>
			<td>고객등급[A:VIP,B:일반,C:직원]</td>
			<td>
				<select name = "grade">
					<option value = "A">A</option>
					<option value = "B">B</option>
					<option value = "C">C</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>도시코드</td><td><input type="text" name = "city"></td>
		</tr>
		<tr>
			<td colspan="2"> <button type="submit">회원등록</button> </td>
		</tr>
	</table>
	</form>
</body>
</html>
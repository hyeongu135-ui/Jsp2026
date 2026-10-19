<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<tr>
			<th>숫자</th>
			<th>제곱</th>
			<th>구분</th>
		</tr>
		<%
		for (int i = 1; i <= 19; i++) {
		%>
		<tr
			<%=i * i % 2 == 1 ? "Style=background-color:#ffffff" : "Style=background-color:#e6f2ff"%>>
			<td><%=i % 3 == 0 ? "<b>" + i + "</b>" : i%></td>
			<td><%=i * i%></td>
			<%=i * i % 2 == 1 ? "<td>" + "홀수" + "</td>" : "<td>" + "짝수" + "</td>"%>
			<%
			}
			%>
		
	</table>
</body>
</html>
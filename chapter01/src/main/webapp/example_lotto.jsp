<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!int[] winNums = { 3, 12, 19, 27, 33, 41 };
	int count = 1;

	public int isWinning(int num) {
		for (int i = 0; i < winNums.length; i++) {
			if (winNums[i] == num) {
				return 1;
			}
		}
		return 0;
	}%>

	<table border="1"; style="text-align: center";>
		<%
		for (int i = 0; i < 9; i++) {
		%>
		<tr>
			<%
			for (int j = 0; j < 5; j++) {
			%>
			<td style="<%=isWinning(count) == 1 ? "background-color:gold" : ""%>"><%=count%></td>
			<%
			count++;
			}
			%>
		
		</tr>
			<%
			}
			%>
		
	</table>
		<% for(int i = 0; i < winNums.length; i++){%>
				<%=  winNums[i] %>
				<% if(winNums.length-1 > i){%>
				<%="," %>
				<%} %>
		<% } %>


</body>
</html>
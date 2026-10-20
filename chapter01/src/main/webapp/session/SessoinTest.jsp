<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>세션 네임 페이지</h2>
	<%
		String sessName = request.getParameter("name");
		//String sessName = request.getParameter("name");
		//세션에 저장된 seNaame 데이터를 꺼내온다. : getAttribute()
		String seName02 = (String)session.getAttribute("seName");
	%>
	<%= seName02 %>님 반갑습니다.
	<a href="SessionName.jsp">세션네임 페이지로 이동</a>
</body>
</html>

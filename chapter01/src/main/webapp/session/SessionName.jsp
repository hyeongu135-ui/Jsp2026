<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String name = "shin"; 
		// session은 내장객체로 서버에서 정보(데이터)를 유지하다.
		// setAttribute("텍스트",Object) => 저장
		// getAttribute("텍스트") => 추출
		session.setAttribute("seName", name);
		session.setMaxInactiveInterval(10); // 10초간 유지 후 꺼짐	
	%>
	
	<a href="SessionName02.jsp">세션네임 페이지로 이동</a>
</body>
</html>
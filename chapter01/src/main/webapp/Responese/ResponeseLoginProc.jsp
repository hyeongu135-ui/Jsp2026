<%@page import="org.apache.catalina.connector.Response"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8");
		//db에 id,pw가 존재한다고 설정
		String dbid = "aaaa";
		String dbpw = "1234";
		
		//request 객체를 이용해서 id, pw의 입력정보를 꺼내온다.
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		if(dbid.equals(id)&&dbpw.equals(pass)){
			/* ResponseMain.jsp로 이동
			   Response 내장객체를 이용하여 서버에서 사용자의 응답정보를 가지고 있는 객체이다.
			   sendRedirect()메소드를 이용하여 다른페이지로 이동한다.
			*/
			/* get방식을 이용하여 ResponseMain.jsp로 id넘기기 */
			// http://localhost:8080/chapter01/Responese/ResponseMain.jsp?id=aaaa
			response.sendRedirect("ResponseMain.jsp?id="+id);
		}else{%>
			<script type="text/javascript">
			alert("아이디와 비밀번호를 확인하세요")
			history.go(-1);
			</script>
		<% }%>
	<!-- 화면 출력 -->
	<p>아이디 : <%= id %></p>
	<p>비밀번호 : <%= pass %></p>
</body>
</html>
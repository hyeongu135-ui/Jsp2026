<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="coffee.css">
</head>
<body>
	<% 
	   request.setCharacterEncoding("utf-8");
	   String menu = request.getParameter("menu");
	   String type = request.getParameter("type");
	   String price = request.getParameter("price");
	   String status = request.getParameter("status");
	   String coment = request.getParameter("coment");
	   
	   
	   if(menu.equals("")||menu==null){
		   menu = "메뉴명이입력되지않았습니다!";
	   }
	   if(type.equals("")||type==null){
		   type = "분류가선택되지않았습니다!";
	   }
	   if(price.equals("")||price==null){
		   price = "가격이입력되지않았습니다!";
	   }
	   if(status.equals("")||status==null){
		   status = "판매상태가선택되지않았습니다!";
	   }
	   if(coment.equals("")||coment==null){
		   coment = "설명이입력되지않았습니다!";
	   }%>
	   
	   <%@ include file="header.jsp" %>
	   <%@ include file="nav.jsp" %>
	   
	   <h1>메뉴등록</h1>
	   <table>
	   		<tr>
	   			<td>메뉴명</td><td><%=menu%></td>
	   		</tr>
	   		<tr>
	   			<td>분류</td><td><%=type%></td>
	   		</tr>
	   		<tr>
	   			<td>가격</td><td><%=price%></td>
	   		</tr>
	   		<tr>
	   			<td>판매상태</td><td><%=status%></td>
	   		</tr>
	   		<tr>
	   			<td>설명</td><td><%=coment%></td>
	   		</tr>
	   </table>
	   <%@ include file="footer.jsp" %>
</body>
</html>
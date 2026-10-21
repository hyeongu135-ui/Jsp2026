<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/main.css">

</head>
<body>
	<% request.setCharacterEncoding("utf-8");
	   String contentpage = "index.jsp";
	   String pagName = request.getParameter("page");
	   
	   if("carList.jsp".equals(pagName)){
		   contentpage = "carList.jsp";
	   }else if("driveForm.jsp".equals(pagName)){
		   contentpage = "driveForm.jsp";
	   }else if("driveList.jsp".equals(pagName)){
		   contentpage = "driveList.jsp";
	   }else if("deptStat.jsp".equals(pagName)){
		   contentpage = "deptStat.jsp";
	   }else if("index.jsp".equals(pagName)){
		   contentpage = "index.jsp";
	   }
	   
	
	%>
	<%@ include file = "header.jsp" %>
	
	<section>
		<jsp:include page="<%=contentpage %>"></jsp:include>
	</section>
	<%@ include file = "footer.jsp" %>
</body>
</html>
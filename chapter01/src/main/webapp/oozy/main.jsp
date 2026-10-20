<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OOZY커피</title>
  <link rel="stylesheet" href="css/coffee.css">
</head>
<body>

	<%@ include file="header.jsp"%>

	<%@ include file="nav.jsp"%>
	
	<%
		String out_page = request.getParameter("page");
		String contentPage = "home.jsp";
	
		if ("menuInsert.jsp".equals(out_page)) {
			contentPage = "menuInsert.jsp";
		} else if ("menuList.jsp".equals(out_page)) {
			contentPage = "menuList.jsp";
		}
	%>

	<section>
		<jsp:include page="<%=contentPage%>"></jsp:include>
	</section>

	<%@ include file="footer.jsp"%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰회원관리 프로그램</title>
<link rel = "stylesheet" href="css/main.css"> 
</head>
<body>
 <% request.setCharacterEncoding("utf-8"); 
 	String pageName = request.getParameter("page");
 	String contentpage = "";
 	
 	if("joinForm".equals(pageName)){ //이거 헷갈림
 		contentpage = "joinForm.jsp";
 	}else if("memberForm".equals(pageName)){
 		contentpage = "memberForm.jsp";
 	}else if("saleForm".equals(pageName)){
 		contentpage = "saleForm.jsp";
 	}else if("index".equals(pageName)){
 		contentpage = "";
 	}
 %>
 <jsp:include page="header.jsp"></jsp:include>
 
 
 <section>
	<% if(!contentpage.equals("")){%>
		<jsp:include page = "<%=contentpage%>"></jsp:include>
	<%}else{ %>
	 <h2>쇼핑몰회원관리 프로그램</h2>
	 <p align="center">쇼핑몰 회원정보와 회원매출 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.
	 프로그램 작성 순서
	 1. 회원정보 테이블을 생성한다.
	 2. 매출정보 테이블을 생성한다.
	 3. 회원정보, 매출정보 테이블에 제시된 문제의 참조데이터를 추가 생성한다.
	 4. 회원정보 입력 화면 프로그램을 작성한다.
	 5. 회원정보 조회프로그램을 작성한다.
	 6. 회원매출정보 조회 프로그램을 작성한다.</p>
	 <%}%>
	 </section>
 <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
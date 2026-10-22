<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/main_info.css">

</head>
<body>
	<% request.setCharacterEncoding("utf-8");
		// 현재 pageName = null이다.
		// page은 반드시 Null처리한다.
	   String contentpage = "";
	   String pagName = request.getParameter("page");
	   String index = request.getParameter("car");
		String driver = "com.mysql.cj.jdbc.Driver"; //JDBC드라이버
		// DB URL(스키마 이름 : jspdb)
		String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
		String user = "root"; //DB계정 아이디
		String password = "1234";//DB계정 비밀번호
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
	   
	   if("carList.jsp".equals(pagName)){
		   contentpage = "carList.jsp";
	   }else if("driveForm.jsp".equals(pagName)){
		   contentpage = "driveForm.jsp";
	   }else if("driveList.jsp".equals(pagName)){
		   contentpage = "driveList.jsp";
	   }else if("deptStat.jsp".equals(pagName)){
		   contentpage = "deptStat.jsp";
	   }else if("index.jsp".equals(pagName)){
		   contentpage = "";
	   }else if("carDrive.jsp".equals(pagName)){
		   contentpage = "carDrive.jsp";
	   }else if("companyStat.jsp".equals(pagName)){
		   contentpage = "companyStat.jsp";
	   }
	   	
	   
	
	%>
	<div id="wrap">
		<%@ include file="header.jsp"%>

		<% if(index.equals("")||index == null){ %>
		<% if(contentpage.equals("")||contentpage == null) {%>
		<section>
			<!-- ★ 섹션에 홈화면 넣는 방법  -->
			<p>국가직무능력표준(NCS:National Compertercy Standards)으로 설게된 교육·훈련과정을
				충실히 이수한 후 , 내부·외부 평가를 거쳐 일정 합격 기준을 충족하는 교육·훈련생에게 국가기술자격을 부여하는 제도</p>
			<p class="bold">산업현장 주심의 교육평가로 더 커지는 능력!</p>
			<p class="bold">알고있는 것에 할 수 있는 것을 더하는</p>
			<p class="bold">과정평가형 자격은</p>
			<p class="bold">현장 중심형 인재육성을 지원합니다.</p>
		</section>
		<%}else{%>
		<section>
			<jsp:include page="<%=contentpage %>"></jsp:include>
		</section>
		<%}}else{
		try{
		Class.forName(driver);
		con=DriverManager.getConnection(url, user, password);
		if(index == "0001"){%>
			<section>
			
			</section>
		}
		}
		
		
		catch(Exception e){e.printStackTrace();}finally{
			try{if(rs != null){rs.close();}}catch(Exception e){e.printStackTrace();}
			try{if(pstmt != null){pstmt.close();}}catch(Exception e){e.printStackTrace();}
			try{if(con != null){con.close();}}catch(Exception e){e.printStackTrace();}
		} %>
		<%@ include file="footer.jsp"%>
	</div>
</body>
</html>
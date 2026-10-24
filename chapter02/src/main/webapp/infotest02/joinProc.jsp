<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.ParseException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
	<%@ page import ="java.sql.*" %>   
	<%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰 회원등록</title>
</head>
<body>	
	<%
	DecimalFormat df = new DecimalFormat("######");
    String num = request.getParameter("num");
    String names = request.getParameter("names");
    String tel = request.getParameter("tel");
    String ac = request.getParameter("ac");
    String day = request.getParameter("day");
    String grade = request.getParameter("grade");
    String city = request.getParameter("city");
    String msg = "";
    if(names == null || names.trim().isEmpty()){
    	msg = "회원성명이입력되지않았습니다!";
    }else if(tel == null || tel.trim().isEmpty()){
    	msg = "회원전화가입력되지않았습니다!";
    }else if(ac == null || ac.trim().isEmpty()){
    	msg = "회원주소가입력되지않았습니다!";
    }else if(day == null || day.trim().isEmpty()){
    	msg = "가입일자가입력되지않았습니다!";
    }else if(grade == null || grade.trim().isEmpty()){
    	msg = "고객등급이선택되지않았습니다!";
    }else if(city == null || city.trim().isEmpty()){
    	msg = "도시코드가입력되지않았습니다!";
    }else{
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
    String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?);";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, df.format(num));
    pstmt.setString(2, names);
    pstmt.setString(3, tel);
    pstmt.setString(4, ac);
    pstmt.setString(5, day);
    pstmt.setString(6, grade);
    pstmt.setString(7, city);
    pstmt.executeUpdate();
		msg="성공";
    	
	} catch (Exception e) {
    e.printStackTrace();
  } finally {
    try {
      if (rs != null) rs.close();
      if (pstmt != null) pstmt.close();
      if (con != null) con.close();
    } catch (Exception e) { e.printStackTrace(); }
  }
    }
  %>
	<script type="text/javascript">
		alert('<%=msg%>');
		history.go(-1);
	</script>  
</body>
</html>
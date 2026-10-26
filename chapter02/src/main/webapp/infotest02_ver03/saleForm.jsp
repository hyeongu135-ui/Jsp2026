<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
	<%@ page import ="java.sql.*" %>   
	<%@ include file = "db_conn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
</head>
<body>
  	<jsp:include page="header.jsp"></jsp:include>

  <%
  	DecimalFormat df = new DecimalFormat("#,##0");
  	DecimalFormat df02 = new DecimalFormat("￦#,##0");
  
  try{
	  Class.forName(driver);
	  con = DriverManager.getConnection(url, user, password);
	  String sql = "select t.custno, custname, grade, sum(price) from money_tbl_02 m "
			  + "inner join member_tbl_02 t on m.custno = t.custno "
			  + "group by t.custno "
			  + "order by sum(price) desc";
	 pstmt = con.prepareStatement(sql);
	 rs = pstmt.executeQuery();%>
	 <section>
	 	<table>
			<tr>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>고객등급</th>
				<th>매출</th>
			</tr>
	 <%while(rs.next()){%>
	 
			<tr>
				<td><%=rs.getInt("t.custno") %></td>
				<td><%=rs.getString("custname") %></td>
				<td><%if(rs.getString("grade").equals("A")){%>
					<%= "VIP" %>
				<%}else if(rs.getString("grade").equals("B")){%>
					<%= "일반" %>
				<%}else if(rs.getString("grade").equals("C")){%>
					<%= "직원" %>
				<%}%>
				</td>
				<td><%=df02.format(df.parse(rs.getString("sum(price)"))) %></td>
			</tr>	
	 	
	  
	 
  <%}%></table> 
  </section>
  <%}catch (Exception e) {
    e.printStackTrace();
  } finally {
    try {
      if (rs != null) rs.close();
      if (pstmt != null) pstmt.close();
      if (con != null) con.close();
    } catch (Exception e) { e.printStackTrace(); }
  }%>
    	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
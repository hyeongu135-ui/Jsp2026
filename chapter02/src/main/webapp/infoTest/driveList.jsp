<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량조회</title>
</head>
<body>
<h3>주행내역조회</h3>
	<% 
	DecimalFormat dec = new DecimalFormat("#,##0");
	DecimalFormat dec2 = new DecimalFormat("₩#,##0");
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt = null;
	Connection con = null;
	ResultSet rs = null;
	//id를 체크하는 체크키

	// DB 접속 정보 설정
	String driver = "com.mysql.cj.jdbc.Driver"; //JDBC드라이버
	// DB URL(스키마 이름 : jspdb)
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root"; //DB계정 아이디
	String password = "1234";//DB계정 비밀번호
	
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		String sql = 
				"SELECT d.DRV_DATE,d.CAR_NO,c.CAR_MODEL,d.DRV_START,d.DRV_END,t.DEPT_NAME,d.DRV_MONEY "
				 +"FROM tbl_drive d "
				 +"inner join tbl_car c on d.CAR_NO = c.CAR_NO "
				 +"inner join tbl_dept t on d.DEPT_CODE = t.DEPT_CODE;";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();%>
		<table class="list">
			<tr>
				<th>주행일자</th>
				<th>차량번호</th>
				<th>모델</th>
				<th>출발Km</th>
				<th>도착Km</th>
				<th>부서명</th>
				<th>주유금액</th>
			</tr>
			
			<%while(rs.next()){
			String date = rs.getString("DRV_DATE");
			String format = date.substring(0,4)+"년"
							+date.substring(4,6)+"월"
							+date.substring(6,8)+"일";%>
			
			<tr>
				<td class="form"><%= format %></td>
				<td class="form"><%= rs.getString("CAR_NO") %></td>
				<td class="form"><%= rs.getString("CAR_MODEL") %></td>
				<td class="form"><%= dec.format(rs.getInt("DRV_START"))  %></td>
				<td class="form"><%= dec.format(rs.getInt("DRV_END")) %></td>
				<td class="form"><%= rs.getString("DEPT_NAME") %></td>
				<td class="form"><%= dec2.format(rs.getInt("DRV_MONEY")) %></td>
			</tr>
		<%}%>
		</table>
		
			<% }catch(Exception e){
				e.printStackTrace();
			}finally{
				try{
				if(rs != null){
					rs.close();
				}if(pstmt != null){
					pstmt.close();
				}if(con != null){
					con.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
				}%>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="db_conn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈쇼핑 회원 정보 수정</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<%
	request.setCharacterEncoding("utf-8");
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		String id = request.getParameter("id");
		String sql = "select * from member_tbl_02 where custno=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();

		if (rs.next()) {
	%>
	<section>
		<form action="modProc.jsp" method="post">
			<table class="form">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="num" value=" <%=rs.getString("custno")%>"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text"  name="name" value=<%=rs.getString("custname")%>></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="tel" value="<%=rs.getString("phone")%>"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="add" value="<%=rs.getString("address")%>"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="day" value="<%=rs.getString("joindate")%>"></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td>
						<select name ="grade" >
							<option value="A">[A]VIP</option>
							<option value="B">[B]일반</option>
							<option value="C">[C]직원</option>
						</select>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name = "city"value="<%=rs.getString("city")%>"></td>
				</tr>
				<tr>
					<td colspan ="2" class="btn">
						<button type="submit" >수정</button>
						<button type="button" onclick = "location.href='memberForm.jsp'">조회</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

	<%
	}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	try {
	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (con != null)
		con.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	}
	%>
</body>
</html>
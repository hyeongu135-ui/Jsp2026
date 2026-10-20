<%@page import="org.apache.catalina.filters.SetCharacterEncodingFilter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	request.setCharacterEncoding("utf-8");
	String drvDate = request.getParameter("drvDate");
	String drvStart = request.getParameter("drvStart");
	String carNo = request.getParameter("carNo");
	String drvEnd = request.getParameter("drvEnd");
	String deptCode = request.getParameter("deptCode");
	String drvMoney = request.getParameter("drvMoney");

	if (drvDate.equals("") || drvDate == null) {
		drvDate = "주행일자가입력되지않았습니다!";
	} 
	
	if (drvStart.equals("") || drvStart == null) {
		drvStart = "출발Km가입력되지않았습니다!!";
	}else{
		drvStart = drvStart+"km";
	} 
	
	if (carNo.equals("") || carNo == null) {
		carNo = "차량번호가입력되지않았습니다!";
	}  
	
	if (drvEnd.equals("") || drvEnd == null) {
		drvEnd = "도착km가입력되지않았습니다!";
	}else{
		 drvEnd = drvEnd+"km";
	}  
	
	if (deptCode.equals("") || deptCode == null) {
		deptCode = "부서코드가선택되지않았습니다!";
	} 
	
	if (drvMoney.equals("") || drvMoney == null) {
		drvDate = "주유금액이입력되지않았습니다!";
	}
	%>


	<table border = "1">
	<tr>
		<th>항목</th>
		<th>입력 형태</th>

	</tr>
	<tr>
		<td>주행일자</td>
		<td><%=drvDate%></td>
	</tr>
	<tr>
		<td>차량번호</td>
		<td><%=carNo%></td>
	</tr>
	<tr>
		<td>출발Km</td>
		<td><%=drvStart%></td>
	</tr>
	<tr>
		<td>도착Km</td>
		<td><%=drvEnd%></td>
	</tr>
	<tr>
		<td>부서코드</td>
		<td><%=deptCode%></td>
	</tr>
	<tr>
		<td>주유금액</td>
		<td><%=drvDate%></td>

	</tr>
	</table>
</body>
</html>
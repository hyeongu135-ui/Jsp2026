<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*"%>
    <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주행내역등록</title>
</head>
<body>
<h3>주행내역등록</h3>
				<form action="driveProc.jsp" method="post">
		<TABLE class="form">
			<TR>
				<td ><label for = "day">주행일자</label></td>
				<td ><input type ="text" name = "DRV_DATE" id="day"><span class="hint">2023년 01월01일 예)20230101</span></td>
			</tr>
			<tr>
				<td ><label for = "num">차량번호</label></td>
				<td ><input type ="text" name = "CAR_NO" id=num><span class="hint">예)10가0001</span></td>
			</tr>
			<tr>
				<td ><label for = "st">출발Km</label></td>
				<td ><input type ="text" name = "DRV_START" id=st><span class="hint">Km</span></td>
			</tr>
			<tr>
				<td ><label for = "end">도착Km</label></td>
				<td ><input type ="text" name = "DRV_END" id=end><span class="hint">Km</span></td>
			</tr>
			<tr>
				<td >부서코드</td>
				<td >
					<select name="DEPT_CODE" >
						<option value = 10>김영업</option>
						<option value = 20>이총무</option>
						<option value = 30>박구매</option>
						<option value = 40>조개발</option>
					</select>
				</td>
			</tr>
			<tr>
				<td ><label for = "money">주유금액</label></td>
				<td ><input type ="text" name = "DRV_MONEY" id="money">원</td>
			</TR>
			<tr>
				<td colspan="2" class="btn"><button type = "submit">주행내역등록</button><button type = "reset">다시쓰기</button></td>
			</tr>
		</TABLE>
		</form>

		
</body>
</html>
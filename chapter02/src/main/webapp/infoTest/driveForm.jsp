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
		<form name = "driveFrm" action="driveProc2.jsp" method="post">
		<table class="form">
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
						<option value = 10>[10]영업부</option>
						<option value = 20>[20]총무부</option>
						<option value = 30>[30]구매부</option>
						<option value = 40>[40]개발부</option>
					</select>
				</td>
			</tr>
			<tr>
				<td ><label for = "money">주유금액</label></td>
				<td ><input type ="text" name = "DRV_MONEY" id="money">원</td>
			</TR>
			<tr>
				<td colspan="2" class="btn">
				<input type = "button" value ="주행내역등록" onclick="chkform()">
				<input type = "button" value ="다시쓰기" onclick="resetform()">
			</tr>
		</table>
		</form>
		<!-- 자바스크립트 이용해서 유효성검사 하기 -->
		<script type="text/javascript">
			function chkform() {
				let f = document.driveFrm;
				if (f.DRV_DATE.value == ""){
					alert("주행입력 안됨");
					/* 주행입력에 포커스(커서 이동)하는 방법 */
					f.DRV_DATE.focus();
					return;
				}
				if (f.CAR_NO.value == ""){
					alert("차번호입력 안됨");
					/* 주행입력에 포커스(커서 이동)하는 방법 */
					f.CAR_NO.focus();
					return;
				}
				if (f.DRV_START.value == ""){
					alert("주행시작입력 안됨");
					/* 주행입력에 포커스(커서 이동)하는 방법 */
					f.DRV_START.focus();
					return;
				}
				if (f.DRV_END.value == ""){
					alert("주행끝입력 안됨");
					/* 주행입력에 포커스(커서 이동)하는 방법 */
					f.DRV_END.focus();
					return;
				}
				if (f.DEPT_CODE.value == ""){
					alert("부서코드 입력 안됨");
					/* 주행입력에 포커스(커서 이동)하는 방법 */
					f.DEPT_CODE.focus();
					return;
				}
				if (f.DRV_MONEY.value == ""){
					alert("주유금액 입력 안됨");
					/* 주행입력에 포커스(커서 이동)하는 방법 */
					f.DRV_MONEY.focus();
					return;
				}
				f.submit();
			}\
			
			function reset() {
				let f = document.driveFrm;
				alert("정보를 지우고 다시 입력");
				f.reset();
				f.drvDate.focus();
			}
		</script>
		
</body>
</html>
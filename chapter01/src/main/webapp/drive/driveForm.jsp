<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	button, select, option {
	width: 240px;
	text-align:center;
	
}
</style>
</head>
<body>
	<h1>주행내역등록</h1>
	<form action="driveProc.jsp" method="post">
		<label for="day">주행일자</label>
		<input type="text" name = "drvDate" id ="day"><br>
		<label for="num">차량번호</label>
		<input type="text" name = "carNo" id ="num"><br>
		<label for="st">출발Km</label>
		<input type="text" name = "drvStart" id ="st"><br>
		<label for="end">도착Km</label>
		<input type="text" name = "drvEnd" id ="end"><br>
		<select name = "deptCode">
			<option value="10">[10영업부]
			<option value="20">[20영업부]
			<option value="30">[30영업부]
			<option value="40">[40영업부]
		</select><br>
		<label for="pri">주유금액</label>
		<input type="text" name = "drvMoney" id ="pri"><br>
		<button type="submit">주행내역등록</button>
		<button type="reset">다시쓰기</button>
	</form>
</body>
</html>

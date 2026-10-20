<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>커피메뉴</h1>
	<form action="CoffeeProc.jsp" method="post">
		<input type="radio" name="coffee" value="아메리카노" id="americano">
		<label for="americano">아메리카노(3000원)</label><br> 
		<input type="radio"name="coffee" value="카페라떼" id="cafelatte"> 
		<label for="cafelatte">카페라떼(3300원)</label><br>
		<input type="radio"name="coffee" value="에스프레소" id="espresso"> 
		<label for="espresso">에스프레소(2500원)</label><br> 
		<input type="radio"name="coffee" value="얼그레이티" id="ergraytea"> 
		<label for="ergraytea">얼그레이티(3500원)</label><br> 
		<label for="pro">수량:</label> 
		<input type="text" name="count" id="pro"><br> 
		<label for="pri">입금액:</label>
		<input type="number" name="price" id="pri">
		<button type="submit">주문처리</button>
	</form>
</body>
</html>
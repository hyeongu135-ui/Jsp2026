<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	request.setCharacterEncoding("utf-8");
	String coffee = request.getParameter("coffee");
	int pr = Integer.parseInt(request.getParameter("price")); //입력금액
	int cnt = Integer.parseInt(request.getParameter("count"));
	int menu_p = 0;
	//세자리 마다 콤마 출력하는 DecimalFormat 객체
	DecimalFormat de = new DecimalFormat("#,##0");
	
	
	if(coffee.equals("아메리카노")){
		menu_p = 3000;
	} else if(coffee.equals("카페라떼")){
		menu_p = 3300;
	} else if(coffee.equals("에스프레소")){
		menu_p = 2500;
	} else if(coffee.equals("얼그레이티")){
		menu_p = 3500;
	}
	
	int sum = menu_p*cnt;
	%>
	

	<h1>주문계산 결과</h1>
		<ul>
			<li>커피종류 : <%= de.format(pr) %></li>
			<li>1개 가격 : <%= de.format(cnt) %></li>
			<li>수량 : <%= cnt %></li>
			<li>총금액 : <%= de.format(sum) %></li>
			<li>입금액 : <%= de.format(pr) %></li>
			<li>거스름돈 : <%= de.format(pr-sum) %></li>
		</ul>
		
</body>
</html>
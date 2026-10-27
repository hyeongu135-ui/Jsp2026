<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Test</title>
</head>
<body>
	<%-- ★<c:if(조건 한번만 사용 가능) --%>
	<c:if test="${4 > 3 }">
		<p>YES</p>
	</c:if>
	
	<c:set var="name">홍길동</c:set>
	<c:set var="age" value = "25"/>
	<!-- EL표현식 이용하여 화면에 name변수를 출력할 수 있음 -->
	나의 이름은 ${name}
	<c:out value="${age}"/>
	<h2>변수삭제</h2>
	<c:remove var="name"/>
	<%-- 나의 이름은 <c:out value="${name }"> --%>
	<!-- ★c:forEach => 자바의 확장for문과 쓰임새가 같다. -->
	<c:forEach var="i" begin="1" end ="10" step="1">
		${i }
		<c:set var="sum" value="${sum+i}"/><br>
	</c:forEach>
	<p>1~10까지 합 : ${sum }</p>
	
	<h2>문자열 분리</h2>
	<c:forTokens var="car" items="소나타-그랜저-아우디" delims="-">
		${car }
	</c:forTokens>
	
	<h2>다중 if문</h2>
	<c:set var="color" value="red,green,black,yellow,white"/>
	<c:forEach var="arr" items="${color}">
		<c:choose>
			<c:when test="${arr=='red' }">빨강</c:when>
			<c:when test="${arr=='green' }">초록</c:when>
			<c:when test="${arr=='black' }">검정</c:when>
			<c:when test="${arr=='yellow' }">노랑</c:when>
				<c:otherwise>파랑</c:otherwise>
		</c:choose>
	</c:forEach>
</body>
</html>
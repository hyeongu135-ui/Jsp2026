<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<h1>메뉴등록</h1>
<form action="menuInsertProc.jsp" method="post">
	<table>
		<tr>
			<td><label for="me">메뉴명</label></td>
			<td><input type="text" name="menu" id="me">예)콜드브루 라떼</td>
		</tr>
		<tr>
			<td>분류</td>
			<td><select name="type">
			<option value="10">COFFEE</option>
			<option value="20">COLD BREW</option>
			<option value="30">BEVERAGE</option>
			<option value="40">DESSERT</option>
			</select></td>

		</tr>
		<tr>
			<td><label for="pri">가격</label></td>
			<td><input type="text" name="price" id="pri">예)콜드브루 라떼</td>
		</tr>
		<tr>
			<td><label for="stat">판매상태</label></td>
			<td><input type="radio" name="status" value="10" id="stat" checked="checked">판매중
			<input type="radio" name="status" value="20" id="stat">SEASON OUT</td>

		</tr>
		<tr>
			<td><label for="come">설명</label></td>
			<td><input type="text" name="coment" id="come">예)콜드브루 라떼</td>
		</tr>
	</table>
	<button type="submit">메뉴등록</button>
	<button type="reset">다시쓰기</button>

</form>
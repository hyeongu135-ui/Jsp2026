<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page import = "java.sql.*" %>
	<c:if test="${param.result == 'ok' }">
		<script>
			alert('회원정보 수정 되었음')
		</script>
	</c:if>

	<div class="joinwrap">
		<h2 align="center">마이페이지</h2>
		<form action="MypageUpdate.do" method="post" name="jform">
			<table class="data" width="500" border="1">
				<tr height="50">
					<td align="center" width="150">아이디</td>
					<%-- <input type="hidden" value="${mdto.id }" name="id"/> --%>
					<td width="350"><input type="text" name="id"
						readonly value="${mdto.id }"></td>
				</tr>
				<tr height="50">
					<td align="center" width="150">비밀번호</td>
					<td width="350"><input type="password" name="pass"
						value="${mdto.pass }"></td>
				</tr>
				<tr height="50">
					<td align="center" width="150">비밀번호</td>
					<td width="350"><input type="password" name="passchk"
						placeholder="비밀번호를 한번 더 입력하세요"></td>
				</tr>
				<tr height="50">
					<td align="center" width="150">Email</td>
					<td width="350"><input type="email" name="email"
						placeholder="@를 포함하여 입력하세요" value="${mdto.email }"></td>
				</tr>
				<tr height="50">
					<td align="center" width="150">전화번호</td>
					<td width="350"><input type="tel" name="tel"
						placeholder="010-0000-0000 형식으로 입력하세요" value="${mdto.tel }"></td>
				</tr>
				<tr height="50">
					<td align="center" width="150">관심분야</td>
					<td width="350">
						<c:forTokens items="캠핑 등산 영화 독서 " delims=" " var="item">
							<input type ="checkbox" name ="hobby" value="${item }" id="hobby_${item }"
							<c:if test ="${mdto.hobby.contains(item) }">checked</c:if>>
							<label for = "hobby_${item }">${item }</label>&nbsp;&nbsp;
						</c:forTokens>
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">직업</td>
					<td width="350" align="center">
						<select name="job">
								<option value="교사" ${mdto.job == '교사'?'selected':''}>교사</option>
								<option value="변호사" ${mdto.job == '변호사'?'selected':''}>변호사</option>
								<option value="의사" ${mdto.job == '의사'?'selected':''}>의사</option>
								<option value="기술사" ${mdto.job == '기술사'?'selected':''}>기술사</option>
						</select><!-- 안됨 -->
					</td>
				</tr>
				<tr height="50">
					<td align="center" width="150">연령</td>
					<td width="350">
					<input type="radio" name="age" value="10대" id="teenage" ${mdto.age=='10대'?'checked':''}> 
					<label for="teenage">10대</label>&nbsp;&nbsp;
					<input type="radio" name="age" value="20대" id="twenty" ${mdto.age=='20대'?'checked':''}>
					<label for="twenty">20대</label>&nbsp;&nbsp; 
					<input type="radio" name="age" value="30대" id="thirty" ${mdto.age=='30대'?'checked':''}> 
					<label for="thirty">30대</label>&nbsp;&nbsp;
					<input type="radio" name="age" value="40대" id="forty" ${mdto.age=='40대'?'checked':''}> 
					<label for="forty">40대</label>&nbsp;&nbsp;
					</td>
				</tr>
				<tr height="50">
					<td align="center" width="150" >남기는말</td>
					<td width="350">
						<textarea rows="5" cols="40" name="info" >${mdto.info} </textarea>
					</td>
				</tr>
				<tr height="50">
					<td colspan="2" align="center" width="150">
						<input type="button" value="수정" onclick="checkForm()">
						<input type="reset" value="취소" >
					</td>

				</tr>
			</table>
		</form>
	</div>
	
<script>
	function checkForm(){
		
		let f = document.jform;
		
		if(f.id.value==""){
			// 커서를 회원성명으로 이동해라
		alert("아이디 입력안됨");
			f.id.focus();
			return;
		}
		if(f.pass.value==""){
			alert("비밀번호 입력안됨");
			// 커서를 회원성명으로 이동해라
			f.pass.focus();
			return;
		}
		if(f.passchk.value==""){
			alert("비밀번호 재입력안됨");
			// 커서를 회원성명으로 이동해라
			f.passchk.focus();
			return;
		}
			// 커서를 회원성명으로 이동해라
		let hobCheck =false;
		for(let i = 0; i < f.hobby.length; i++){
				if(f.hobby[i].checked){
					hobCheck=true;
					break;
				}
			}
		if(!hobCheck){
			alert("관심분야 선택해주셈");
			f.hobby[0].checked='checked';
			return;
		}
		
	
		if(f.age.value==""){
			alert("나이 입력안됨");
			// 커서를 회원성명으로 이동해라
			f.age.focus();
			return;
		}
		if(f.tel.value==""){
			alert("전화번호 입력안됨");
			// 커서를 회원성명으로 이동해라
			f.tel.focus();
			return;
		}
		if(f.job.value==""){
			alert("직업 입력안됨");
			// 커서를 회원성명으로 이동해라
			f.job.focus();
			return;
		}
		
		//submit
		f.submit();
		
	}
</script>

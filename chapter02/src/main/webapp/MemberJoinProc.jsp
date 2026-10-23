<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원 가입하기</h1>
	<%
	// 스크립트릿은 자바 코드만 가능함
	request.setCharacterEncoding("utf-8");

	// RequestJoin.jsp의 입력값 전부 받아올것 Request 객체를 통해
	// 정보를 꺼내오세요.
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String passchk = request.getParameter("passchk");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");

	String[] hobby = request.getParameterValues("hobby");
	String hobbyOne = ""; // 하나의 관심분야 담는 변수
	for (int i = 0; i < hobby.length; i++) {
		hobbyOne += hobby[i] + " ";
	}

	String job = request.getParameter("job");
	String age = request.getParameter("age");
	String info = request.getParameter("info");

	//DB 연동 시작 - ------------------------------------------

	Connection con = null;
	PreparedStatement pstmt = null;

	ResultSet rs = null;
	//id를 체크하는 체크키
	boolean idChk = false;

	// DB 접속 정보 설정
	String driver = "com.mysql.cj.jdbc.Driver"; //JDBC드라이버
	// DB URL(스키마 이름 : jspdb)
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root"; //DB계정 아이디
	String password = "1234";//DB계정 비밀번호

	// DB는 네트워크의 톰캣서버를 통해 데이터가 전달되므로 개발자가 
	// 오류를 찾기 어렵다. 고로 try(){}catch()문을 이용해 작성함이 원칙이다.
	try {

		//드라이버 로딩
		Class.forName(driver);
		//DB 연결
		con = DriverManager.getConnection(url, user, password);
		// insert 쿼리문작성

		String chkSql = "select id from member where id=?";
		pstmt = con.prepareStatement(chkSql);
		pstmt.setString(1, id);
		// select문은 반드시 Resultset객체에 담는다.
		rs = pstmt.executeQuery();
		// 현재 rs로 받은 값이 존재하는지 유무 if로 비교
		if (rs.next()) {
			//rs.next()rk true이면 이미 같은 id가 존재한다라는 의미임
			idChk = true;
		} else {
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			// preparaStatement 객체에 setString(), setInt()메소드가 존재
			// set~()메소드는 sql문을 저장하겠다는 의미이다.
			// pstst.setString(1,id) => 1번은=id입력 ...
			// 단, 반드시 1부터 시작함.
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			pstmt.setString(3, email);
			pstmt.setString(4, tel);
			pstmt.setString(5, hobbyOne);
			pstmt.setString(6, job);
			pstmt.setString(7, age);
			pstmt.setString(8, info);

			//insert는 ExecuteUpdate()메소드를 이용하여 실행
			//insert, delete, update쿼리는 executeUpdate()메소드를 이용하여 실행한다
			//select => excuteQuery()메소드를 이용하여 실행함
			// 			단, select문의 결과는 ResultSet객체에 담는다.
			pstmt.executeUpdate(); // insert를 성공하면 1을 반환

		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		//자원 해제
		if (pstmt != null) {
			try {
		pstmt.close();
			} catch (Exception e) {
			}
		}
		if (con != null) {
			try {
		con.close();
			} catch (Exception e) {
			}
			if (rs != null) {
				try {
			rs.close();
				} catch (Exception e) {
				}
		}
	}
	}
	// DB 연동 종료 --------------------------------------------
	%>



	<%-- <% if(passchk.equals("")){%>
	<script type="text/javascript">
		alert("비밀번호를 입력해주세요.");
		history.go(-1);
	</script>
	
	<%}else if(id.equals("")){%>
	<script type="text/javascript">
		alert("아이디를 입력해주세요.");
		history.go(-1);
	</script>
	
	<%}else if(email.equals("")){%>
	<script type="text/javascript">
		alert("이메일을 입력해주세요.");
		history.go(-1);
	</script>
	
	<%}else if(tel.equals("")){%>
	<script type="text/javascript">
		alert("전화번호를 입력해주세요.");
		history.go(-1);
	</script>
	<%}else{%> --%>

	<%
	String msg = "";
		if (id == null || id.isEmpty()) {
			msg = "아이디를 입력하세요";
		} else if (pass == null || pass.isEmpty()) {
			msg = "비밀번호를 입력하세요";
		} else if (email == null || email.isEmpty()) {
			msg = "이메일을 입력하세요";
		} else if (tel == null || tel.isEmpty()) {
			msg = "휴대폰 번호를 입력하세요";
		} else if (hobby.length == 0 || hobby == null) {
			msg = "취미를 입력하세요";
		} else if (age == null || age.isEmpty()) {
			msg = "나이를 입력하세요";
		} else if (info == null || info.isEmpty()) {
			msg = "남기는 말을 입력하세요";
		}else if(idChk){
			msg = "이미 존재하는 아이디 입니다";
		}
			
	%>
	<%
	if(!pass.equals(passchk))
		{
			msg = "비밀번호가 틀렸습니다";

		}
	%>
	<!-- 자바스크립트 객체 종류
		1. 코어객체
		2. DOM객체
		3. BOM객체 ==> 브라우저에서 사용하는 객체
			= history객체는 브라우저가 현재 탭이나 창에서 방문했던 웹페이지들의
			  기록(Session History)을 관리하고 제어하는 객체이다.
			  *history.back() : 바로 이전 페이지로 이동(뒤로 가기)
			  *history.forward() : 바로 다음 페이지로 이동(앞으로 가기)
			  *history.go(n) : 지정한 상대적 위치만큼 이동(앞으로 가기)
			   	-history.go(1) : 앞으로 가기
			   	-history.go(0) : 현재페이지 
			   	-history.go(-1) : 뒤로 가기
	 -->
	<%
	if(!msg.equals("")){
	%>
	<script type="text/javascript">
		alert("<%=msg%>");
		location.href = "main.jsp?page=main.jsp"
	</script>
	<%}%>
</body>
</html>
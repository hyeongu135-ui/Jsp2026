<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
</head>
<body>
	<%
	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String email = request.getParameter("email");
	String tel = request.getParameter("tel");
	String pass2 = request.getParameter("pass2");
	
	String msg = null;

	/* 아이디 일치 여부 체크키 */
	boolean idchk = false;
	
	

	Connection con = null;
	PreparedStatement pstmt = null;
	
	ResultSet rs = null;
	//id를 체크하는 체크키
	
	// DB 접속 정보 설정
	String driver = "com.mysql.cj.jdbc.Driver"; //JDBC드라이버
	// DB URL(스키마 이름 : jspdb)
	String url = "jdbc:mysql://localhost:3306/jspdb?serverTimezone=UTC&useSSL=false";
	String user = "root"; //DB계정 아이디
	String password = "1234";//DB계정 비밀번호
	
	//비밀번호 일치유무를 판단한다
	if( pass2.trim().isEmpty()||pass2 == null){
		msg = "비밀번호를 입력하시오";	
	}else{
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			String sql = "select id,email,tel from member where id = ? and pass=?;";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.setString(2,pass2);
			rs = pstmt.executeQuery();
			if(rs.next()){
				// 자원반납 위의 조회떄 사용한 pstmt를 반납해야한다.
				pstmt.close();
				rs.close();
				
				
				// 2)비밀번호 확인이 종료되면 수정하기
				// update 테이블명 set 수식(a=b) where 조건
			String sql2 = "update member set email=?,tel=? where id=?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setString(1, email);
			pstmt.setString(2, tel);
			pstmt.setString(3, id);
			
			//update, insert, delete 쿼리문은 결과값으로 int를 반환받는다.
			//update가 실행되면 1인된다. 실행되지 않으면 0이된다
			
			int result = pstmt.executeUpdate();
			if(result > 0 ){
				msg ="업데이트 성공";
			}else{
				msg ="업데이트 실패";
			}
			}else{
				msg="비밀번호를 확인하세요";


	}}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null){
			try{
				rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(pstmt != null){
			try{
				pstmt.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		if(con != null){
			try{
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	}%>
	
		<script type="text/javascript">
		alert('<%=msg%>');
	<%if(msg.equals("비밀번호를 확인하세요")){%>
			history.go(-1);
	<%}else{%>
		/* history.go(-2); */
			location.href = "main.jsp?page=MemberList";
	<%}%>
		</script>
</body>
</html>
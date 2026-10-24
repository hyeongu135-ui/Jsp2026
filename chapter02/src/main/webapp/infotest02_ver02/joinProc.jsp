<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import = "java.util.*"%>
	<%@ page import ="java.sql.*" %>   
	<%@ include file = "db_conn.jsp" %>
	
<%
	request.setCharacterEncoding("utf-8");
	boolean msgChk = false; // 회원등록이 될때 메시지 체크 변수
	
	try{
		Class.forName(driver);
		con = DriverManager.getConnection(url, user, password);
		
		// sql문을 작성하여 sql문자 변수에 담는다. sql은 혼자선 아무것도 못함
		// 등록할때 회원번호 자동으로 1씩 증가되어 생성 : 100006
		// ifnull(값, 값이 null일때 출력할 값)
		String sql = "insert into member_tbl_02 values(null,?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("custname"));
		pstmt.setString(2, request.getParameter("phone"));
		pstmt.setString(3, request.getParameter("address"));
		pstmt.setString(4, request.getParameter("joindate"));
		pstmt.setString(5, request.getParameter("grade"));
		pstmt.setString(6, request.getParameter("city"));
		
		// msgChk를 위해서 insert, update, delete 실행후 int = 1
		msgChk = pstmt.executeUpdate() > 0;
		// rs가 존재하는 값보다 커서 위에 존재한다.

		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs != null) rs.close();
			if(con != null) con.close();
			if(pstmt != null) pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	} %>
	
	<script type="text/javascript">
		<% if(msgChk){ %>
			alert("회원등록이 완료됨");
			location.href = "memberForm.jsp"
		<%}else{%>
			alert("회원등록이 실패");
			history.go(-1);
		<%}%>	
	</script>

package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBPKG.Util;

public class BoardDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//------- board데이터 시작행~끝행의 개수를 리턴하는 메소드
	public ArrayList<BoardDTO> getAllboard(int startRow ,int pageSize) {
		ArrayList<BoardDTO> a = new ArrayList<BoardDTO>();
		try {
			con = Util.getConnection();
			//쿼리문
			String sql = "select * from board where chkDel= 0 order by ref desc limit ?,?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,startRow);
			pstmt.setInt(2,pageSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				bdto.setNum(rs.getInt(1));
				bdto.setWriter(rs.getString(2));
				bdto.setEmail(rs.getString(3));
				bdto.setSubject(rs.getString(4));
				bdto.setPassword(rs.getString(5));
				bdto.setReg_date(rs.getString(6));
				bdto.setRef(rs.getInt(7));
				bdto.setRe_step(rs.getInt(8));
				bdto.setReadcount(rs.getInt(9));
				bdto.setContent(rs.getString(10));
				bdto.setId(rs.getString(11));
				
				a.add(bdto);
				
			}
		}
		catch(Exception e) {e.printStackTrace();}finally {
			try {if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close();}
			}catch(Exception e) {e.printStackTrace();}
		}
		return a;
	}
	
	// board 전체 개수 리턴하는 메소드 작성
	public int getAllCount() {
		int boardCount = 0;
		try {
			con = Util.getConnection();
			//쿼리문
			String sql = "select count(num) from board where chkDel = 0";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardCount = rs.getInt(1);
			}
			
		}
		catch(Exception e) {e.printStackTrace();}finally {
			try {if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close();}
			}catch(Exception e) {e.printStackTrace();}
		}
		return boardCount;
	}
	//-----게시글 insert
	//하나의 게시글을 삽입하는 메소드 작성 = 메소드이름 : inserBoard()
	
	public void inserBoard(BoardDTO bdto) {
		
		BoardDTO b = new BoardDTO();
		int ref = 0;
		int re_step = 0;
		
		
		try {
			con = Util.getConnection();
			//첫쿼리문 = ref의 최대값을 검색해서 +1을 하는 select문 필요
			String sql = "select max(ref) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ref = rs.getInt(1)+1; // 가장 큰값에 더하기 1한다.
			}
			pstmt.close();
			
			//insert하는 쿼리문 작성
			String sql02 ="insert into board values(null,?,?,?,?,current_date(),?,?,0,?,?)";
			pstmt = con.prepareStatement(sql02);
			// ? 대입
			pstmt.setString(1, bdto.getWriter());
			pstmt.setString(2, bdto.getEmail());
			pstmt.setString(3, bdto.getSubject());
			pstmt.setString(4, bdto.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setString(7, bdto.getContent());
			pstmt.setString(8, bdto.getId());
			pstmt.executeUpdate();
			
		}catch(Exception e) {e.printStackTrace();}finally {
			try {if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close();}
			}catch(Exception e) {e.printStackTrace();}
		}
	}
	
	//-----게시물 보기
	public BoardDTO getOneBoard(int num) {
		BoardDTO d = new BoardDTO();
		
		try {
			con = Util.getConnection();
			String sql = "select * from Board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				d.setNum(rs.getInt(1));
				d.setWriter(rs.getString(2));
				d.setEmail(rs.getString(3));
				d.setSubject(rs.getString(4));
				d.setPassword(rs.getString(5));
				d.setReg_date(rs.getString(6));
				d.setRef(rs.getInt(7));
				d.setRe_step(rs.getInt(8));
				d.setReadcount(rs.getInt(9));
				d.setContent(rs.getString(10));
				d.setId(rs.getString(11));
				
			}
			
			pstmt.close();
			rs.close();
			
			String sql2 ="update board set readcount = readcount+1 where num=?";
			pstmt = con.prepareStatement(sql2);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		}catch(Exception e) {e.printStackTrace();}finally {
			try {if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close();}
			}catch(Exception e) {e.printStackTrace();}
			
		}
		return d;
		
	}
	
	
	// ---- 2026년 11월 02일 답글달기
	// 답글 삽입하는 메소드 작성
	// 메소드 이름 : reinsertBoard(BoarddDTO bdto)
	// BoardInfo.jsp에서 get방식으로 num, ref, re_step 떠넘김
		
	public void reinsertBoard(BoardDTO bdto) {
		int ref = bdto.getRef();
		//1:1 문의이므로 답변의 re_step은 무조건 1로 고정한다
		int re_step = 1;
		//콘솔에서 번호를 확인한다.
		System.out.println("ref -> DB"+ref);
		System.out.println("re_step -> DB"+re_step);
		
		try {
			con = Util.getConnection();
			String sql = "insert into board values(null,?,?,?,?,current_date(),?,?,0,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bdto.getWriter());
			pstmt.setString(2, bdto.getEmail());
			pstmt.setString(3, bdto.getSubject());
			pstmt.setString(4, bdto.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setString(7, bdto.getContent());
			pstmt.setString(8, bdto.getId());
			pstmt.executeUpdate();
				
			
			

			
		}catch(Exception e) {e.printStackTrace();}finally {
			try {if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close();}
			}catch(Exception e) {e.printStackTrace();}
			
		}
		
	}
	
	//--게시물 수정
	public BoardDTO getOneUpdateBoard(int num) {
		BoardDTO d = new BoardDTO();
		
		try {
			con = Util.getConnection();
			String sql = "select * from Board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				d.setNum(rs.getInt(1));
				d.setWriter(rs.getString(2));
				d.setEmail(rs.getString(3));
				d.setSubject(rs.getString(4));
				d.setPassword(rs.getString(5));
				d.setReg_date(rs.getString(6));
				d.setRef(rs.getInt(7));
				d.setRe_step(rs.getInt(8));
				d.setReadcount(rs.getInt(9));
				d.setContent(rs.getString(10));
				d.setId(rs.getString(11));
				
			}
			
		}catch(Exception e) {e.printStackTrace();}finally {
			try {if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close();}
			}catch(Exception e) {e.printStackTrace();}
			
		}
		return d;
		
	}
	
	
	//-------
	//업데이트 관리
	//메소드 이름 : updateBoard(int num, String subject, String content)
	public void updateBoard(int num, String subject, String content) {
		try {
			con = Util.getConnection();
			//하나의 게시물 업데이트하는 쿼리문 작성
			String sql = "update board set subject = ?, content =? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, subject);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			pstmt.executeUpdate();
			
			
		}catch(Exception e) {e.printStackTrace();}finally {
			try {if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close();}
			}catch(Exception e) {e.printStackTrace();}
			
		}
	}
	
	// 소프트 삭제하는 메소드 작성
	// 삭제 버튼을 클릭하면 chkDel을 1로 업데이트함
	// chkDel이 1인 데이터는 화면에 출력하지 않는다.
	public void delete(int num) {
		try {
			con = Util.getConnection();
			//데이터를 지우지 않고 chkDel을 1로 업데이트함
			String sql = "update board set chkDel=1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception e) {e.printStackTrace();}finally {
			try {if(rs != null) {rs.close();}
				if(pstmt != null) {pstmt.close();}
				if(con != null) {con.close();}
			}catch(Exception e) {e.printStackTrace();}
			
		}
	}
	
		
	}
	
	
		
		
		
	


package model.member;
import java.sql.*;
import java.util.ArrayList;

import DBPKG.Util;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//---- 아래부분은 sql문작성 메소드들의 모임이다.
	// id만 추출하는 메소드를 작성한다.
	// 메소드이름 : getId()	


public String getId(String id) {
	String chkid = "";
	
	try {
		con = Util.getConnection();
		String sql = "select id from member where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		// 현저 커서는 앞에 존저하므로 next()fh ekdma epdlxjfmf ckwdkrksek
		if(rs.next()) {
			chkid = rs.getString(1);
		}
		}catch(Exception e){e.printStackTrace();}finally {
	try {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}catch(Exception e) {
		e.printStackTrace();
	}
	}
	System.out.println("___"+chkid);
	return chkid;
	
}

public void JoinId(MemberDTO mdto) {
	
	try {
		con = Util.getConnection();
		String sql = "insert into member values(?,?,?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, mdto.getId());
		pstmt.setString(2, mdto.getPass());
		pstmt.setString(3, mdto.getEmail());
		pstmt.setString(4, mdto.getTel());
		pstmt.setString(5, mdto.getHobby());
		pstmt.setString(6, mdto.getJob());
		pstmt.setString(7, mdto.getAge());
		pstmt.setString(8, mdto.getInfo());
		int result = pstmt.executeUpdate();
		

		
		}catch(Exception e){
			e.printStackTrace();
			System.out.println(mdto.getId()+"업데이트 성공");
		
		}finally {
	try {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(con != null) con.close();
	}catch(Exception e) {
		e.printStackTrace();
	}
	}
	
}

	// 회원의 전체 정보 추출하는 메소드 생성
	public ArrayList<MemberDTO> getAllmember(){
		ArrayList<MemberDTO> m = new ArrayList<MemberDTO>();
		try {
			
		con = Util.getConnection();
		String sql = "select * from member";
		pstmt = con.prepareStatement(sql);
		//쿼리실행
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			MemberDTO mdto = new MemberDTO();
			mdto.setId(rs.getString(1));
			mdto.setPass(rs.getString(2));
			mdto.setEmail(rs.getString(3));
			mdto.setTel(rs.getString(4));
			mdto.setHobby(rs.getString(5));
			mdto.setJob(rs.getString(6));
			mdto.setAge(rs.getString(7));
			mdto.setInfo(rs.getString(8));
			
			//ArrayList에 추가하기
			m.add(mdto);
		}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {if(rs ==null) rs.close();
				 if(pstmt == null) pstmt.close();
				 if(con == null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return m;
	}
	
	//--2026.10.28 DB쿼리 업데이트
	// 메소드이름 loginCheck(),
	// id, pass select 쿼리문 작성
	
	public boolean loginCheck(String id, String pass) {
		boolean logchk = false;
		try {
			con = Util.getConnection();
			String sql = "select id from member where id=? and pass=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
			logchk = true;}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(con != null) {
					con.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return logchk;
		
	}
	
	public ArrayList<MemberDTO> idlist(String searchType, String keyword){
		ArrayList<MemberDTO> i = new ArrayList<MemberDTO>();
		//트라이캐치파이널리 까먹음
		
		try {
		con = Util.getConnection();
		String sql = "select * from member where "+ searchType +" like '%"+ (keyword) +"%'";
		System.out.println(sql);
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		
			while(rs.next()) {
				MemberDTO mdto = new MemberDTO();
				mdto.setId(rs.getString(1));
				mdto.setPass(rs.getString(2));
				mdto.setEmail(rs.getString(3));
				mdto.setTel(rs.getString(4));
				mdto.setHobby(rs.getString(5));
				mdto.setJob(rs.getString(6));
				mdto.setAge(rs.getString(7));
				mdto.setInfo(rs.getString(8));
				
				i.add(mdto);
				
			}
			return i;
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try{if(rs!=null) {rs.close();}
				if(pstmt!=null) {pstmt.close();}
				if(con != null) {con.close();}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return i;
	}
	
	
	public MemberDTO getonemember(String id){
		MemberDTO mdto = new MemberDTO();
		
		try {
			con = Util.getConnection();
			String sql = "select * from member where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				mdto.setId(rs.getString(1));
				mdto.setPass(rs.getString(2));
				mdto.setEmail(rs.getString(3));
				mdto.setTel(rs.getString(4));;
				mdto.setHobby(rs.getString(5));
				mdto.setJob(rs.getString(6));
				mdto.setAge(rs.getString(7));
				mdto.setInfo(rs.getString(8));
				
				
			}
			System.out.println("dao:"+ rs.getString(1));
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(rs != null)rs.close();
			if(pstmt != null)pstmt.close();
			if(con != null)con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return mdto;
	}
	
	
	public void update(MemberDTO mdto) {
		
		
		try {
			con = Util.getConnection();
			String sql = "update member set pass=?, email=?, tel=?, hobby=?, job=?, age=?, info=? where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mdto.getPass());
			pstmt.setString(2, mdto.getEmail());
			pstmt.setString(3, mdto.getTel());
			pstmt.setString(4, mdto.getHobby());
			pstmt.setString(5, mdto.getJob());
			pstmt.setString(6, mdto.getAge());
			pstmt.setString(7, mdto.getInfo());
			pstmt.setString(8, mdto.getId());
			
		}catch(Exception e) {
			
		}finally {
			try {
				if(rs !=null) {rs.close();}
				if(pstmt !=null) {pstmt.close();}
				if(con !=null) {con.close();}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
}
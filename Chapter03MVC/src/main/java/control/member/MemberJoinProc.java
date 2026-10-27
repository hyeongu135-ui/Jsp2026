package control.member;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberDTO;


@WebServlet("/MProc.do")
public class MemberJoinProc extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 서블릿 작성순서
		// 1) 인코딩 하기
		request.setCharacterEncoding("utf-8");

		// 2) MemberDTO 인스턴스하기
		MemberDTO mdto = new MemberDTO();
		// 3) MemberDAO 인스턴스하기
		MemberDAO mdao = new MemberDAO();
		// 4) input 입력받은 값들 request.getParametr()가져오기
		String id = request.getParameter("id");
		mdto.setId(id);
		String chkid = mdao.getId(id);
		
		
		mdto.setPass(request.getParameter("pass"));
		mdto.setPasschk(request.getParameter("passchk"));
		String pass = request.getParameter("pass");
		String passchk = request.getParameter("passchk");

		System.out.println("입아:"+id +"입비"+chkid);
		
//		mdto.setId(id);
		mdto.setEmail(request.getParameter("email"));
		mdto.setTel(request.getParameter("tel"));
		mdto.setAge(request.getParameter("age"));
		mdto.setJob(request.getParameter("job"));
		mdto.setInfo(request.getParameter("info"));
		
		String[] arr = request.getParameterValues("hobby");
		String oneHobby ="";
		for(String hob:arr){
			oneHobby += hob = " " ;
		}
		mdto.setHobby(oneHobby);
		mdto.setJob(request.getParameter("job"));
		mdto.setAge(request.getParameter("age"));
		mdto.setInfo(request.getParameter("info"));
		// 5) 예외처리하기 (중복아이디 체크, pass=passchk..)
			// 예외처리 중복아이디 체크 => 현재 체크 불가능 = 이유는 DB id가 없음
			// pass = passchk가 같으면 membe테이블에 insert해야함
			// pass가 틀리면 비밀번호를 확인하세요
		// 6) request.setAttribute("",값)저장
		// 7) requestDispatcher객체로 jsp파일로 forward하기
		// 패스워드가 같을때만 데이터 베이스에 저장 => insert 
			String jspAddress = "";
			if(id.equals(chkid)) {
				request.setAttribute("msg", "이미존재하는 아이디입니다.");
				jspAddress = "/member/joinderr.jsp";
				
			}else if(pass.equals(passchk)) { //패스워드 pass=passchk
				mdao.JoinId(mdto);
				
				// 회원전체 목록을 출력하는 MemberList생성 예정
				// MemberJoinProc에서 다른 컨드롤러 MemberListCon.do 컨트롤러로 이동
				jspAddress = "MemberListCon.do";
				System.out.println("gd");
				
			}else {
				request.setAttribute("msg", "비밀번호를 확인하세요.");
				jspAddress = "/member/joinerr.jsp";
			}
			
			RequestDispatcher rd = request.getRequestDispatcher(jspAddress);
			rd.forward(request, response);
			
	
	}
	

}

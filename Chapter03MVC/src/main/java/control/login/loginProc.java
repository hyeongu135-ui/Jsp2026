package control.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.member.MemberDAO;
import model.member.MemberDTO;

@WebServlet("/loginProc.do")
public class loginProc extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rePro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rePro(request, response);
	}
	
	protected void rePro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8"); //인코딩 제발 잊지 않기
		
		MemberDAO mdao = new MemberDAO();
		MemberDTO mdto = new MemberDTO();
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		boolean chk = mdao.loginCheck(id,pass);
		
		if(chk) {
			// 로그인 성공한 상태 => 세션에 id를 저장해야한다.
			// jsp페이지에서는 세션을 인스턴스 없이 사용하지만
			// servlet은 세션을 인스턴스로 꺼내와야 사용가능 
			HttpSession session = request.getSession(); // 세션 새로 생성 하는것
			// session.setAttribute("작명이름",값) : 저장
			// session.getAttribute(값) : 출력
			session.setAttribute("id", id);
			//세션 유지 시간 : 30분
			session.setMaxInactiveInterval(60*30);
			response.sendRedirect("index.jsp");
		}else{
			// 로그인 실패 : 아이디와 패스워드가 다른 경우
			request.setAttribute("msg", "아이디와 패스워드를 확인하시오");
			RequestDispatcher rd = request.getRequestDispatcher("/login/loginErr.jsp");
			rd.forward(request, response);
		};
		
		
		
	}
	
}

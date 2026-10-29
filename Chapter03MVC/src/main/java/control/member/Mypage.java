package control.member;

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

/**
 * Servlet implementation class Mypage
 */
@WebServlet("/Mypage.do")
public class Mypage extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rePro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rePro(request, response);
	}
	protected void rePro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDTO mdto ;
		MemberDAO mdao = new MemberDAO();
		
		// getSession(false) : 만약 세션이 존재하면 가져오고, 없으면 null로 리턴
		HttpSession session_2 = request.getSession(false); //??
		if(session_2 != null) {
			String chkid = (String)session_2.getAttribute("id");
			System.out.println("서블릿"+chkid);
			mdto = mdao.getonemember(chkid);
			request.setAttribute("mdto", mdto); //if 안과 밖의 차이
		}
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=member/Mypage.jsp");
		rd.forward(request, response); 
		// select 문을 제외한 나머지 쿼리문 작성시 F5로 새로고침하면 화면이 재요청되는 현상 발생
		// select문을 제외한 나머지는 sendRedirect 사용 쪽이 좋음.
		// sendRedirect , forward 차이
	}
	}


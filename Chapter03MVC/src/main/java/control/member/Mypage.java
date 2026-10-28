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
		MemberDTO mdto ;
		MemberDAO mdao = new MemberDAO();
		
		HttpSession session_2 = request.getSession();
		if(session_2 != null) {
			String chkid = (String)session_2.getAttribute("id");
			System.out.println("¼­ºí¸´"+chkid);
			mdto = mdao.getonemember(chkid);
			request.setAttribute("mdto", mdto);
		}
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=member/Mypage.jsp");
		rd.forward(request, response);
	}
	}


package control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.board.BoardDAO;
import model.board.BoardDTO;


@WebServlet("/BoardWriteProcCon.do")
public class BoardWriteProcCon extends HttpServlet {
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	rePro(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rePro(request, response);
	}
	protected void rePro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//httpSession 인스턴스하기
		//1:1문의 게시판은 로그인된 회원만 사용 가능하므로
		HttpSession session = request.getSession(false);
		String loginId = (String) session.getAttribute("id");
		
		// 로그인 안되면 알림창을 띄우고 로그인 페이지로 이동
		// 삽입,삭제,수정 => 처리하는 서블릿에서 넘길때 sendRedirect()로 넘김

		
		// 로그인된 상태인 경우 => board DB 자료삽입하기
		BoardDTO bdto = new BoardDTO();
		BoardDAO bdao = new BoardDAO();
		bdto.setWriter(request.getParameter("writer"));
		bdto.setEmail(request.getParameter("email"));
		bdto.setSubject(request.getParameter("subject"));
		bdto.setPassword(request.getParameter("password"));
		bdto.setContent(request.getParameter("content"));
		bdto.setId(loginId);
		
		bdao.inserBoard(bdto);
		
		// 페이지 넘김
		response.sendRedirect("BoardListCon.do");
	}

}

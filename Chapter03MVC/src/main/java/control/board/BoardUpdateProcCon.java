package control.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;


@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rePro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rePro(request, response);
	}
	protected void rePro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//수정 처리 부분
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num")) ;
		String userPw = request.getParameter("userPw");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String dbPw = request.getParameter("dbPw");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(userPw.equals(dbPw)) {
			//db의 비밀번호와 내가 입력한 비밀번호가 같으면 수정
			BoardDAO bdao =new BoardDAO();
			bdao.updateBoard(num, subject, content);
			
			response.sendRedirect("BoardListCon.do");
			
		}else {
			//비밀번호가 일치하지 않으면 메시지창 띄우고 이전페이지로 이동
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush(); // script/alert 종료문 
			
		}
		
		
	}

}

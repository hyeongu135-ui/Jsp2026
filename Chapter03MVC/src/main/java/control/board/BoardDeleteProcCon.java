package control.board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.board.BoardDAO;
import model.board.BoardDTO;

/**
 * Servlet implementation class BoardDeleteProcCon
 */
@WebServlet("/BoardDeleteProcCon.do")
public class BoardDeleteProcCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rePro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rePro(request, response);
	}
	protected void rePro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		BoardDTO bdto = new BoardDTO();
		int num = Integer.parseInt(request.getParameter("num"));
		String dbPw = request.getParameter("dbPw");
		String userPw = request.getParameter("userPw");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(userPw.equals(dbPw) && userPw != null) {
			//비밀번호 같다.
			BoardDAO bdao = new BoardDAO();
			bdao.delete(num);
			
			//소프트 삭제가 되면 BoardListCon.do로 보내기
			response.sendRedirect("BoardListCon.do");
			}else {
			//비밀번호가 틀리면 alert창 띄우기
				out.println("<script>");
				out.println("alert('비밀번호 불일치');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.flush();
		}
		}

}

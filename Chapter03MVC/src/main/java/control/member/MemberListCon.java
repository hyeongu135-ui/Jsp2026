package control.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.member.MemberDAO;
import model.member.MemberDTO;


@WebServlet("/MemberListCon.do")
public class MemberListCon extends HttpServlet {

  

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rePro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	rePro(request, response);
	}
	
	protected void rePro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 데이터베이스에 연결하여 전체회원의 모든 정보를 리턴해준다.
		// 회원 여러명의 자료를 화면에 출력하기 위해 DB에서 select 꺼내온다.
		// ArrayList<>이용하여 select으로 추출한 모든 회원의 정보를 담는다.
		
		request.setCharacterEncoding("utf-8");
		MemberDAO mdao = new MemberDAO();
		//ArrayList<MemberDTO> allMember ;
		
		
		String searchType = request.getParameter("searchType");
		String keyword = request.getParameter("keyword");
		ArrayList<MemberDTO> all; 
		/**/
		
		
		// request.setAttribute()객체에 담아 디스패쳐할 예정

		if(keyword !=null) {
			all = mdao.idlist(searchType, keyword);
			
		}else {
			all = mdao.getAllmember();
		}
		
			request.setAttribute("allist", all);
			request.setAttribute("keyword", keyword);
			request.setAttribute("searchType", searchType);
			
		
		RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=/member/MemberList.jsp");
		rd.forward(request, response);
		
		
		
	}

}

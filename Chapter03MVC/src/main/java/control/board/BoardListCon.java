package control.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.board.BoardDAO;
import model.board.BoardDTO;

@WebServlet("/BoardListCon.do") //header.jsp의 게시판 메뉴 클릭하면 목록이 출력되도록 작성
public class BoardListCon extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		rePro(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	rePro(request, response);
	}
	protected void rePro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//header.jsp로 넘어갈때 페이징할 변수를 담아서 떠넘겨주어야 함
	//아래 부분은 페이징을 하기위한 기본 변수와 연산식을 작성할 예정임
	//board테이블의 모든 레코드가 넘겨져야함
	// DAO가 필요함 => getAllboard() 메소드
		
	// 전체 게시글 리턴하여 담을 변수 설정
	int count = 0;
	// 한 화면에 보ㅕ질 행의 개수를 담을 변수
	int pageSize = 5;
	// 현재 보고있는 페이지 넘버 [1][2][3] ==> 현재 1페이지에 있음
	// pageNum = 1;
	// 반드시 null처리한다.
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null) {
		pageNum = "1";
	}
	// 게시글의 번호를 최신글순으로 출력되도록 번호를 지정하기위해
	// 각자 기호에 맞추어 개발한다.
	int number = 0;
	// 현재 보여지고 있는 페이지 문자를 숫자로 변환
	// 현재 pageNum = "1"; => currentPage = 1;
	int currentPage = Integer.parseInt(pageNum);
	// 전체 게시글의 개수를 데이터 베이스에서 가져오기 위해 BoradDAO를 인스턴스한다.
	BoardDAO bdao = new BoardDAO();
	count = bdao.getAllCount(); //현재 count = 10;
	
	// 시작행 출력을 위해 StartRow를 계산
	// limit 시작위치, 개수 
	// currentPage=1, 한페이지에 출력할 개수는 pageSize=5;
	int startRow = (currentPage-1)*pageSize;
	
	//최신글 5개를 가져오는 DAO메소드를 이용해 리턴
	// ArratList<BoardDTO>
	ArrayList<BoardDTO> blist = bdao.getAllboard(startRow, pageSize);
	BoardDTO bdto = new BoardDTO();
	// jsp 화면에 [번호]부분에 들어갈 number 값을 계산하는 부분
	// 단, 최신글 순서대로 번호가 출력된다.
	// count = 10, currentPage=1
	// => 현재 보고 있는 [1]페이지 첫 번쟤 글 번호 10이어야한다.
	// => 현재 보고 있는 [1]페이지 마지막 글 번호가 6이어야함
	
	
	
	number = count-startRow;
	//-------------------------------------------------
	//페이징 처리하는 계산로직
	int pageCount = 0; // 전체페이지 넘버수를 담는 변수
	int pageBlock = 3; // 한 화면에 페이징하고 싶은 개수 예)[1][2][3]
	int startpage = 1; // 한 화면 처음에 페이징하고 싶은 수 예)[1]
	int endpage = 0; // 한 화면 마지막에 페이징하고 싶은 수 예)[3]
	
	if(count > 0) {
		
		// 10/5 => 2+0
		// 11/5 => 2+1
		// 11개 => [1][2][3]
		pageCount = count/pageSize + (count % pageSize == 0 ? 0:1);
	
	if(currentPage%pageBlock != 0) {
		startpage = (currentPage / pageBlock)*pageBlock+1;
	}else {
		startpage =((currentPage/pageBlock)-1)*pageBlock+1;
	}	
	
	endpage = startpage + pageBlock -1;
	
	//페이징의 번호가 [1][2][3]이 출력되는 경우는 count의 데이터값이 10개 이상일 경우이어야함
	//count가 10개면 페이징번호는 [1][2]만 존재해야함
	
		if(endpage > pageCount) {
			endpage = pageCount;
		}
	}
	
	//----------------------------------------------
	// boardList.jsp View단으로 Dispatcher이용하여 떠넘기기
	request.setAttribute("blist", blist); //페이징한 5개의 행이 담겨있다.

	// 페이징을 그림그릴 변수 넘기기 
	request.setAttribute("number", number);
	request.setAttribute("pageSize", pageSize);
	request.setAttribute("count", count);
	request.setAttribute("currentPage", currentPage);
	
	request.setAttribute("pageCount", pageCount);
	request.setAttribute("pageBlock", pageBlock);
	request.setAttribute("startpage", startpage);
	request.setAttribute("endpage", endpage);
	
	RequestDispatcher rd = request.getRequestDispatcher("/index.jsp?section=board/BoardList.jsp");
	rd.forward(request, response);
	
	
	
	}

}

package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Poolentarier;
import service.PoolentarierService;
import service.PoolentarierServiceImpl;

/**
 * Servlet implementation class Poolentarier
 */
@WebServlet("/goPoolentarier")
public class PoolentarierList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PoolentarierList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("jspName", "poolentarier");
		String page = request.getParameter("page");
		String paramSortOption = request.getParameter("sortOption");
		
		int curPage = 1;
		
		// 만일, 페이지 값이 존재한다면
		if(page!=null) {
			curPage = Integer.parseInt(page);
		}
		
		// 기본 최신순 정렬
		String sortOption = "new";
		if(paramSortOption != null) {
			sortOption = paramSortOption;
		}
		
		String searchOption = request.getParameter("searchOption");
		String searchText = request.getParameter("searchText");

		// 검색 옵션이 선택되지 않거나, 검색 입력값이 입력되어있지 않은 경우 (두 경우 중 하나라도)
		// 전부 null 초기화
		// null 값은 mapper에서 분기를 통해 처리
// 		if(searchOption == null || searchText == null) {
//			searchOption = null;
//			searchText = null;
//		}

		try {
			// 서비스 객체 생성
			PoolentarierService poolentarierService = new PoolentarierServiceImpl();
			// 서비스 객체에서 게시판 리스트업 메서드 호출하여 res로 받아옴
			Map<String, Object> res = poolentarierService.poolentarierListByPage(curPage, sortOption, searchOption, searchText);
			// res 세팅
			request.setAttribute("sortOption", sortOption);
			request.setAttribute("res", res);
			request.setAttribute("searchOption", searchOption);
			request.setAttribute("searchText", searchText);
			request.getRequestDispatcher("WEB-INF/views/poolentarier/poolentarierList.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	
	}

}
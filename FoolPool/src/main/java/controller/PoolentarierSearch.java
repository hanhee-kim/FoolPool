package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PoolentarierService;
import service.PoolentarierServiceImpl;

/**
 * Servlet implementation class PoolentarierSearch
 */
@WebServlet("/poolentarierSearch")
public class PoolentarierSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PoolentarierSearch() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("jspName", "poolentarier");
		
		String searchOption = request.getParameter("searchOption");
		String searchText = request.getParameter("searchText");
		
		String paramSortOption = request.getParameter("sortOption");
		// 검색 폼 제출시 기존 정렬 및 페이징 값은 new / 1로 초기화 (해제) 
		String sortOption = "new";
		if(paramSortOption!=null) {
			sortOption = paramSortOption;
		}
		
		String page = request.getParameter("page");
		int curPage = 1;
		
		// 만일, 페이지 값이 존재한다면
		if(page!=null) {
			curPage = Integer.parseInt(page);
		}
		
		if(searchOption.equals("unselected")) {
			response.sendRedirect("goPoolentarier?page="+curPage);
			return;
		}
		
		try {
			PoolentarierService poolentarierService = new PoolentarierServiceImpl();
			Map<String, Object> res = poolentarierService.poolentarierSearch(curPage, sortOption, searchOption, searchText);
			request.setAttribute("res", res);
//			response.sendRedirect("goPoolentarier?sortOption=" + sortOption + "&page=1");
			request.getRequestDispatcher("WEB-INF/views/poolentarier/poolentarierList.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

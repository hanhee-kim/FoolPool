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
		String page = request.getParameter("page");
		int curPage = 1;
		
		// 만일, 페이지 값이 존재한다면
		if(page!=null) {
			curPage = Integer.parseInt(page);
		}
		
		request.setAttribute("jspName", "poolentarier");
		try {
			// 서비스 객체 생성
			PoolentarierService poolentarierService = new PoolentarierServiceImpl();
			// 서비스 객체에서 게시판 리스트업 메서드 호출하여 res로 받아옴
			Map<String, Object> res = poolentarierService.poolentarierListByPage(curPage);
			// res 세팅
			request.setAttribute("res", res);
			
			request.getRequestDispatcher("WEB-INF/views/poolentarier/poolentarierList.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

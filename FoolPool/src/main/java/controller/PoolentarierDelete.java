package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.PoolentarierService;
import service.PoolentarierServiceImpl;

/**
 * Servlet implementation class PoolentarierDel
 */
@WebServlet("/poolentarierDelete")
public class PoolentarierDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PoolentarierDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("jspName", "poolentarier");
		
		Integer no = Integer.parseInt(request.getParameter("no"));
		String page = request.getParameter("page");
		int curPage = 1; 
		if(page!=null) curPage = Integer.parseInt(page);
		
		try {
			PoolentarierService poolentarierService = new PoolentarierServiceImpl();
			poolentarierService.poolentarierDelete(no);
			response.sendRedirect("goPoolentarier?page="+curPage);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "풀풀박사 게시글 삭제 오류");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
}

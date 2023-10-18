package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DrFoolPoolService;
import service.DrFoolPoolServiceImpl;

/**
 * Servlet implementation class DrFoolPoolDelete
 */
@WebServlet("/drFoolPoolDelete")
public class DrFoolPoolDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrFoolPoolDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/drFoolPoolDelete doGet 호출");
		
		request.setCharacterEncoding("utf-8");
		Integer no = Integer.parseInt(request.getParameter("no"));
		String page = request.getParameter("prevpage");
		int curPage = 1;
		if(page!=null) curPage = Integer.parseInt(page);
		String filter = request.getParameter("filter");
		String sOption = request.getParameter("sOption");
		String sValue = request.getParameter("sValue");
		System.out.println("no:" + no + ",prevpage" + page + ",filter:" + filter + ",sOption:" + sOption + ",sValue:" + sValue);
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			drFoolPoolService.drFoolPoolRemove(no);
			response.sendRedirect("goDrFoolPool?page="+curPage+"&filter="+filter+"&sOption="+sOption+"&sValue="+sValue);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "풀풀박사 게시글 삭제 오류");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

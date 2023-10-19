package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		System.out.println("-----/drFoolPoolDelete doGet 호출-----");
		
		// 뷰의 버튼이 아니라 사용자가 직접 url로 요청하여 들어왔을때도 비로그인 상태일때는 로그인페이지로 이동하게함
		HttpSession session = request.getSession();
		if(session.getAttribute("member")==null) request.getRequestDispatcher("login.jsp").forward(request, response);
		
		request.setCharacterEncoding("utf-8");
		Integer no = Integer.parseInt(request.getParameter("no"));
		
		// 이전 목록페이지의 값
		String prevpage = request.getParameter("page");
		String prevfilter = request.getParameter("filter");
		int page = 1;
		if(prevpage!=null) page = Integer.parseInt(prevpage);
		String filter = "all";
		if(prevfilter!=null) filter = prevfilter;
		String sOption = request.getParameter("sOption");
		String sValue = request.getParameter("sValue");
		System.out.println("no:" + no + ",prevpage: " + page + ",filter:" + filter + ",sOption:" + sOption + ",sValue:" + sValue);
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			drFoolPoolService.drFoolPoolRemove(no);
			
			if(sOption==null || sValue==null || sOption.equals("") || sValue.equals("")) {
				response.sendRedirect("goDrFoolPool?page="+page+"&filter="+filter);
			} else {
				response.sendRedirect("goDrFoolPool?page="+page+"&filter="+filter+"&sOption="+sOption+"&sValue="+sValue);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "풀풀박사 게시글 삭제 오류");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

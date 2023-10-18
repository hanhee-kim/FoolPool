package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeService;
import service.NoticeServiceImpl;

/**
 * Servlet implementation class NoticeDelete
 */
@WebServlet("/noticedelete")
public class NoticeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//*boardlist.jsp에서는 <a href="boarddelete?num=${board.num}"삭제 </a>에 의한 get요청이였음.
		request.setAttribute("jspName", "notice");
		request.setCharacterEncoding("utf-8");
		
		
		Integer no = Integer.parseInt(request.getParameter("no"));
		//Integer page = Integer.parseInt(request.getParameter("page"));

		try {
			NoticeService noticeService = new NoticeServiceImpl();
			noticeService.noticeDelete(no);
			//request.getRequestDispatcher("WEB-INF/views/notice/noticeList.jsp").forward(request, response); 이거쓰면 아무것도 안뜸
			//response.sendRedirect("noticelist");오류
			response.getWriter().print("success");
			response.sendRedirect(request.getContextPath() + "/notice");
			return;
		} catch (Exception e) {
			e.printStackTrace();
			//request.setAttribute("err", "게시글 삭제오류");
			request.getRequestDispatcher("WEB-INF/views/notice/error.jsp");
		}
	}

}

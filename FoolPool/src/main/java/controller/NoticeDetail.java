package controller;

import java.io.IOException;
import java.lang.reflect.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Notice;
import service.NoticeService;
import service.NoticeServiceImpl;

/**
 * Servlet implementation class NoticeDetail
 */
@WebServlet("/noticedetail")
public class NoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("member")==null) {
			response.sendRedirect("login");
		}else {
			request.setCharacterEncoding("utf-8");
			Integer no = Integer.parseInt(request.getParameter("no"));
			
			
			try {
				NoticeService noticeService = new NoticeServiceImpl();
				Notice notice = noticeService.noticeDetail(no);
				//noticeService.noticeViewCountPlus(no);
				request.setAttribute("notice", notice);
				request.setAttribute("jspName", "notice");
				request.getRequestDispatcher("WEB-INF/views/notice/noticeDetail.jsp").forward(request, response);
			} catch (Exception e) {
				//request.setAttribute("err", "notice 상세페이지 조회 실패 ");
				request.getRequestDispatcher("WEB-INF/views/error.jsp").forward(request, response);
			}
			
			
			
		}
		
		
		
		

	}
	
	
}
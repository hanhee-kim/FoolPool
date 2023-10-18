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
 * Servlet implementation class NoticeList
 */
@WebServlet("/notice")
public class NoticeList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		String page = request.getParameter("page");
		
		int curpage = 1;
		if(page!=null)curpage = Integer.parseInt(page);

		
		try {
			NoticeService noticeService = new NoticeServiceImpl();
			Map<String, Object> res = noticeService.noticeListByPage(curpage);
			request.setAttribute("res", res);
			request.setAttribute("jspName", "notice");
			request.getRequestDispatcher("WEB-INF/views/notice/noticeList.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			//request.setAttribute("err", "공지사항 조회에 에러가 발생했습니다");
			request.getRequestDispatcher("WEB-INF/views/notice/error.jsp").forward(request, response);
		}		
	}
}
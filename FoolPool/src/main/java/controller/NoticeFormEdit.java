package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Notice;
import service.NoticeService;
import service.NoticeServiceImpl;

/**
 * Servlet implementation class NoticeFormEdit
 */
@WebServlet("/noticeformedit")
public class NoticeFormEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeFormEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * noticedetail.jsp 에서 수정버튼 눌렀을때 get요청 수정할 수 있게 noticeFormEdit.jsp로 가준다. 		 */
		
		
		request.setAttribute("jspName", "notice");
		request.setCharacterEncoding("utf-8");
		Integer no = Integer.parseInt(request.getParameter("no"));
		
		try {
			NoticeService noticeService = new NoticeServiceImpl();
			Notice notice = noticeService.noticeDetail(no);
			request.setAttribute("notice", notice);
			request.getRequestDispatcher("WEB-INF/views/notice/noticeFormEdit.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("err", "notice 상세페이지 조회 실패 ");
			request.getRequestDispatcher("WEB-INF/views/notice/noticeEdit.jsp").forward(request, response);
		}
		
	}	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * noticeFormEdit.jsp 에서 내용수정하고 수정완료 버튼 누르면은 수정내용이 뿌려짐. 	form이 제출되었을때 post요청.
		 *  noticedateil로 감.
		 * 
		 * 	 */
		
		request.setCharacterEncoding("utf-8");
		 
		
		Integer no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
			
		Notice notice = new Notice();
		notice.setNo(no);
		notice.setTitle(title);
		notice.setContent(content);
		try {
			NoticeService noticeService = new NoticeServiceImpl();
			noticeService.noticeModify(notice);
		//	request.getRequestDispatcher("WEB-INF/views/notice/noticeDetail.jsp").forward(request, response);
			response.sendRedirect("noticedetail?no="+notice.getNo());
		} catch (Exception e) {
			e.printStackTrace();
			//request.setAttribute("err", "게시글 수정 오류");
			request.getRequestDispatcher("WEB-INF/views/error.jsp").forward(request, response);
		}
		
	}
}
		
		
		
		
		
		
		
		
		
		
		
	


package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Member;
import bean.Notice;
import service.NoticeService;
import service.NoticeServiceImpl;

/**
 * Servlet implementation class NoticeForm
 */
@WebServlet("/noticeform")
public class NoticeForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeForm() {
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
//			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			
		
		request.setCharacterEncoding("utf-8");
		request.setAttribute("jspName", "notice");
		request.getRequestDispatcher("WEB-INF/views/notice/noticeForm.jsp").forward(request, response);
		
		}
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//Member logged = (Member)request.getSession().getAttribute("login");
		
		//로그인된 유저 정보가져오기 
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		String writer_id = member.getId();
		
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
	
		//객체에 값 세팅 
		Notice notice = new Notice();
		notice.setWriter_id(writer_id);
		notice.setTitle(title);
		notice.setContent(content);
		
		
		try {
			NoticeService noticeService =  new NoticeServiceImpl();
			noticeService.noticeWrite(notice);
			//response.sendRedirect("noticedetail?no="+notice.getNo()); //글 작성완료후 목록페이지말고 상세 페이지로 가기 
			response.sendRedirect("noticedetail?no="+notice.getNo());
		} catch (Exception e) {
			e.printStackTrace();
			//request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("WEB-INF/views/error.jsp").forward(request, response);

			
			
			
		}
	}
	}


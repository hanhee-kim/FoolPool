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
		request.setCharacterEncoding("utf-8");
		Integer no = Integer.parseInt(request.getParameter("no"));
		
		request.setCharacterEncoding("utf-8");
		request.getRequestDispatcher("WEB-INF/views/notice/noticeDetail.jsp").forward(request, response);
	}
		
	}

	
	



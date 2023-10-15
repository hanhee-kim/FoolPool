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
 * Servlet implementation class NoticeSearch
 */
@WebServlet("/noticesearch")
public class NoticeSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 
		 * noticeList.jsp의 <form action="./noticesearch" method="post">로 인한 post요청 
		 * 검색바 
		 * 서비스의 메소드를 호출 할때 전달 인자, 검색옵션 type, 사용자가 입력한keyword, 현재 페이지 번호page가 담겨있어야함.
		 */
		
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		String keyword = request.getParameter("keyword");
		String page = request.getParameter("page");
		
		System.out.println("--------NoticeSearch서블릿-------");
		System.out.println("keyword: " + keyword + "\ntype: " + type + "\npage: " + page);
		
		
		int curpage = 1;
		if(page!=null) curpage = Integer.parseInt(page);
		
		if(type.equals("all")) {response.sendRedirect("notice");return;}
		
		
		try {
			NoticeService noticeService = new NoticeServiceImpl();
			Map<String, Object> res = noticeService.noticeSearch(type, keyword, curpage);
			
			request.setAttribute("res", res);
			request.setAttribute("jspName", "notice");
			request.getRequestDispatcher("WEB-INF/views/notice/noticeList.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("NoticeError.jsp").forward(request, response);
		}
		
		
		
		
		
		
		
		
		
	}

}
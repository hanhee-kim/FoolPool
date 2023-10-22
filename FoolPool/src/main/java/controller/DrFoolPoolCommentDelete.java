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
 * Servlet implementation class DrFoolPoolCommentDelete
 */
@WebServlet("/deldrfoolpoolcomment")
public class DrFoolPoolCommentDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrFoolPoolCommentDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer commentNo = Integer.parseInt(request.getParameter("commentNo"));
		Integer postNo = Integer.parseInt(request.getParameter("postNo"));
		
		// 이전 목록페이지의 값
		String prevpage = request.getParameter("page");
		String prevfilter = request.getParameter("filter");
		int page = 1;
		if(prevpage!=null) page = Integer.parseInt(prevpage);
		String filter = "all";
		if(prevfilter!=null) filter = prevfilter;
		String sOption = request.getParameter("sOption");
		String sValue = request.getParameter("sValue");
		// System.out.println("postNo:" + postNo + ", commentNo:" + commentNo + ",prevpage: " + page + ",filter:" + filter + ",sOption:" + sOption + ",sValue:" + sValue);
		
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			drFoolPoolService.drFoolPoolCommentRemove(commentNo);
			// response.sendRedirect("drFoolPoolDetail?no="+postNo);
			
			if(sOption==null || sValue==null || sOption.equals("") || sValue.equals("")) {
				response.sendRedirect("drFoolPoolDetail?no=" + postNo + "&page="+page+"&filter="+filter);
			} else {
				response.sendRedirect("drFoolPoolDetail?no=" + postNo + "&page="+page+"&filter="+filter+"&sOption="+sOption+"&sValue="+sValue);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "풀풀박사 댓글 삭제 오류");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

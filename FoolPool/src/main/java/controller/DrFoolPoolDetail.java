package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DrFoolPool;
import bean.DrFoolPoolComment;
import service.DrFoolPoolService;
import service.DrFoolPoolServiceImpl;

/**
 * Servlet implementation class DrFoolPoolDetail
 */
@WebServlet("/drFoolPoolDetail")
public class DrFoolPoolDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrFoolPoolDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("-----/drFoolPoolDetail doGet호출-----");
		
		request.setCharacterEncoding("utf-8");
		request.setAttribute("jspName", "drFoolPool");
		
		Integer no = Integer.parseInt(request.getParameter("no"));
		String prevpage = request.getParameter("page");
		String prevfilter = request.getParameter("filter");
		int page = 1;
		if(prevpage!=null) page = Integer.parseInt(prevpage);
		String filter = "all";
		if(prevfilter!=null) filter = prevfilter;
		String sOption = request.getParameter("sOption");
		String sValue = request.getParameter("sValue");

		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			DrFoolPool drFoolPool = drFoolPoolService.drFoolPoolDetail(no);
			List<DrFoolPoolComment> commentList = drFoolPoolService.drFoolPoolCommentList(no); 
			
			request.setAttribute("page", page);
			request.setAttribute("filter", filter);
			request.setAttribute("sOption", sOption);
			request.setAttribute("sValue", sValue);
			request.setAttribute("drFoolPool", drFoolPool);
			request.setAttribute("commentList", commentList);
			request.setAttribute("commentCnt", commentList.size());
			request.getRequestDispatcher("WEB-INF/views/drFoolPool/drFoolPoolDetail.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

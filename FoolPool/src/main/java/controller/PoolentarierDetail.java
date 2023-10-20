package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Poolentarier;
import bean.PoolentarierComment;
import service.PoolentarierService;
import service.PoolentarierServiceImpl;

/**
 * Servlet implementation class poolentarierDetail
 */
@WebServlet("/poolentarierDetail")
public class PoolentarierDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PoolentarierDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer no = Integer.parseInt(request.getParameter("no"));
		
		request.setAttribute("jspName", "poolentarier");
		try {
			// 서비스 객체 생성
			PoolentarierService poolentarierService = new PoolentarierServiceImpl();
			Poolentarier poolentarier = poolentarierService.poolentarierDetail(no);
			request.setAttribute("poolentarier", poolentarier);
			
			// 키워드 분리
			String keyword = poolentarier.getKeyword();
			if(keyword != null) {
				String[] keywords = keyword.split(",");
				for(int i = 0;i < keywords.length;i++) {
					keywords[i] = "#" + keywords[i];
				}
				request.setAttribute("keywords", keywords);
			}
			
			// 전체 댓글 조회
			List<PoolentarierComment> poolentarierCommentList = poolentarierService.poolentarierCommentList(no);
			request.setAttribute("poolentarierCommentList", poolentarierCommentList);
			// 댓글 개수 조회
			request.setAttribute("commentCount", poolentarierCommentList.size());
			
			request.getRequestDispatcher("WEB-INF/views/poolentarier/poolentarierDetail.jsp").forward(request, response);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

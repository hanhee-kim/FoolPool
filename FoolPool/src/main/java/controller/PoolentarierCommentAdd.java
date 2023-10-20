package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Member;
import bean.PoolentarierComment;
import service.PoolentarierService;
import service.PoolentarierServiceImpl;

/**
 * Servlet implementation class PoolentarierCommentAdd
 */
@WebServlet("/poolentarierCommentAdd")
public class PoolentarierCommentAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PoolentarierCommentAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("jspName", "poolentarier");
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String writerId = member.getId();
		String writerNickname = member.getNickname();
		Integer postNo = Integer.parseInt(request.getParameter("postNo"));
		
		String commentContent = request.getParameter("commentContent");
		PoolentarierComment poolentarierCommnet = new PoolentarierComment();
		poolentarierCommnet.setCommentContent(commentContent);
		poolentarierCommnet.setWriterId(writerId);
		poolentarierCommnet.setWriterNickname(writerNickname);
		poolentarierCommnet.setPostNo(postNo);
		
		try {
			PoolentarierService poolentarierService = new PoolentarierServiceImpl();
			poolentarierService.poolentarierWriteComment(poolentarierCommnet);
			response.sendRedirect("poolentarierDetail?no=" + postNo);
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	
	}

}

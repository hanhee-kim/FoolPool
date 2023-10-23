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
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			drFoolPoolService.drFoolPoolCommentRemove(commentNo);
			
			String res = "success";
			response.getWriter().print(res);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "풀풀박사 댓글 삭제 오류");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

package controller;

import java.io.IOException;
import java.util.Iterator;
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
		System.out.println("-----/drFoolPoolDetail doGet호출-----");
		
		// 요청uri: drFoolPoolDetail?no=해당게시글번호
		
		request.setCharacterEncoding("utf-8");
		request.setAttribute("jspName", "drFoolPool");
		
		Integer no = Integer.parseInt(request.getParameter("no"));

		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			DrFoolPool drFoolPool = drFoolPoolService.drFoolPoolDetail(no);
			List<DrFoolPoolComment> commentList = drFoolPoolService.drFoolPoolCommentList(no); 
			
			System.out.println(drFoolPool.toString());
			System.out.println("댓글수: " + commentList.size() + "\n----댓글 목록 출력----");
			Iterator<DrFoolPoolComment> iter = commentList.iterator();
			while(iter.hasNext()){
				System.out.println(iter.next().toString());
			}
			
			request.setAttribute("drFoolPool", drFoolPool);
			request.setAttribute("commentList", commentList);
			request.setAttribute("commentCnt", commentList.size());
			
			// # 로그인처리 후 수정
			// 현재로그인된 사용자와 해당게시글작성자가 일치하는지 여부를 활용하여 게시글수정/삭제, 댓글채택, 댓글삭제 코드 분기처리
//			HttpSession session = request.getSession();
//			Member member = (Member) session.getAttribute("user");
//			if(member!=null) {
//				Boolean isLike = boardService.isBoardLike(member.getId(), num);
//				request.setAttribute("select", isLike);
//			}
			
			request.getRequestDispatcher("WEB-INF/views/drFoolPool/drFoolPoolDetail.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

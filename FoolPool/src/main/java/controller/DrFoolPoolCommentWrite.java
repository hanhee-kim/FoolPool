package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DrFoolPoolComment;
import bean.Member;
import service.DrFoolPoolService;
import service.DrFoolPoolServiceImpl;

/**
 * Servlet implementation class DrFoolPoolCommentWrite
 */
@WebServlet("/addDrFoolPoolComment")
public class DrFoolPoolCommentWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrFoolPoolCommentWrite() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("jspName", "drFoolPool");
		
		// 로그인 정보 가져오기
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String writerId = member.getId();
		String writerNickname = member.getNickname();
		
		// form 입력값 가져오기
		String commentContent = request.getParameter("commentContent");
		Integer postNo = Integer.parseInt(request.getParameter("postNo"));
		System.out.println("commentContent: " + commentContent + ", postNo: " + postNo);
		
		// DrFoolPoolComment 객체 생성
		DrFoolPoolComment comment = new DrFoolPoolComment();
		comment.setCommentContent(commentContent);
		comment.setPostNo(postNo);
		comment.setWriterId(writerId);
		comment.setWriterNickname(writerNickname);
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			drFoolPoolService.drFoolPoolCommentWrite(comment);
			response.sendRedirect("drFoolPoolDetail?no=" + postNo);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	/* cf. DTO의 필드
		private Integer commentNo; // db에서 auto_increment 되는 값
		private Date commentDate;	// 매퍼에서 now()로 넣어줄 값
		private String commentContent;
		private Boolean isPicked;	// db에서 디폴트값0(false) 가짐
		private String writerId;	// 로그인된 유저의 아이디
		private String writerNickname;	// 로그인된 유저의 닉네임
		private Integer postNo;
	*/

}

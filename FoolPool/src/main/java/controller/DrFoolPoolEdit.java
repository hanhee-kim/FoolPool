package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.DrFoolPool;
import bean.Member;
import service.DrFoolPoolService;
import service.DrFoolPoolServiceImpl;

/**
 * Servlet implementation class DrFoolPoolEdit
 */
@WebServlet("/editDrFoolPool")
public class DrFoolPoolEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrFoolPoolEdit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 뷰의 버튼이 아니라 사용자가 직접 url로 요청하여 들어왔을때도 비로그인 상태일때는 로그인페이지로 이동하게함
		HttpSession session = request.getSession();
		if(session.getAttribute("member")==null) request.getRequestDispatcher("login.jsp").forward(request, response);
			
		request.setCharacterEncoding("utf-8");
		Integer no = Integer.parseInt(request.getParameter("no"));
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			DrFoolPool drFoolPool = drFoolPoolService.drFoolPoolDetail(no);
			System.out.println("-----/editDrFoolPool doGet 호출-----\n" + drFoolPool.toString());
			request.setAttribute("drFoolPool", drFoolPool);
			request.setAttribute("jspName", "drFoolPool");
			request.getRequestDispatcher("WEB-INF/views/drFoolPool/drFoolPoolEdit.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", "풀풀박사 게시글 수정 실패");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		request.setAttribute("jspName", "drFoolPool");
		request.getRequestDispatcher("WEB-INF/views/drFoolPool/drFoolPoolEdit.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----/editDrFoolPool doPost호출------");
		request.setCharacterEncoding("utf-8");
		request.setAttribute("jspName", "drFoolPool");
		
		// 로그인 정보 가져오기
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String writerId = member.getId();
		String writerNickname = member.getNickname();
		
		// 파일 업로드 - 파일 업로드 경로를 절대경로로 지정할것 cf. DB에는 파일명만 저장한다
		String uploadPath = "C:\\upload"; 
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
		 
		// form입력값 가져오기
		String fileName = multi.getOriginalFileName("file");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		Integer no = Integer.parseInt(multi.getParameter("no"));
		System.out.println("fileName: " + fileName + ", title: " + title + ", content: " + content + ", no: " + no);
		
		// DrFoolPool객체 생성
		DrFoolPool drFoolPool = new DrFoolPool();
		drFoolPool.setTitle(title);
		drFoolPool.setContent(content);
		drFoolPool.setFileName(fileName);
		drFoolPool.setNo(no);
		drFoolPool.setWriterId(writerId);
		drFoolPool.setWriterNickname(writerNickname);
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			drFoolPoolService.drFoolPoolEdit(drFoolPool);
			response.sendRedirect("drFoolPoolDetail?no=" + drFoolPool.getNo());
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

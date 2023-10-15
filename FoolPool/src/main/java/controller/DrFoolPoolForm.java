package controller;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.DrFoolPool;
import service.DrFoolPoolService;
import service.DrFoolPoolServiceImpl;

/**
 * Servlet implementation class DrFoolPoolForm
 */
@WebServlet("/drFoolpoolForm")
public class DrFoolPoolForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrFoolPoolForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		request.getRequestDispatcher("WEB-INF/views/drFoolPool/drFoolPoolForm.jsp").forward(request, response);
		/*
		// 로그인처리 완료 후 아래 코드로 위의 코드 대체할것
		 
		// 뷰의 버튼이 아니라 사용자가 직접 url로 요청하여 들어왔을때도 비로그인 상태일때는 로그인페이지로 이동하게함
		HttpSession session = request.getSession();
		if(session.getAttribute("user")==null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			request.setAttribute("jspName", "drFoolPool");
			request.getRequestDispatcher("WEB-INF/views/drFoolPool/drFoolPoolForm.jsp").forward(request, response);
		}
		*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----/drFoolpoolForm doPost호출------");
		
		request.setCharacterEncoding("utf-8");
		request.setAttribute("jspName", "drFoolPool");
		
		// 로그인 정보 가져오기
//		HttpSession session = request.getSession();
//		Member member = (Member) session.getAttribute("user");
//		String writerId = member.getId();
		String writerId = "user01";
		String writerNickname = "닉네임01";
		
		// 파일 업로드 - 파일 업로드 경로를 절대경로로 지정할것 cf. DB에는 파일명만 저장한다
//		String uploadPath = "C:\\upload\\" + fileName; 
		String uploadPath = "C:\\upload"; 
		int size = 10*1024*1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
		 
		// form입력값 가져오기
		String fileName = multi.getParameter("file");
		// #### 파일명이 null로 받아와지는 문제 ###
		if (fileName==null) fileName = "drfoolpool_sample1.png";
			
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		System.out.println("fileName: " + fileName + ", title: " + title + ", content: " + content);
		
		// DrFoolPool객체 생성
		DrFoolPool drFoolPool = new DrFoolPool();
		drFoolPool.setTitle(title);
		drFoolPool.setContent(content);
		drFoolPool.setFileName(fileName);
		// 임시코드
		drFoolPool.setWriterId(writerId);
		drFoolPool.setWriterNickname(writerNickname); // 로그인처리후에는 (1) DB에 아이디를 통해 조회한 닉네임을 넣어주거나 (2) 서블릿에서 채우지 않고 매퍼에서 조인/서브쿼리를 이용한다
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			drFoolPoolService.drFoolPoolWrite(drFoolPool);
			response.sendRedirect("drFoolPoolDetail?no=" + drFoolPool.getNo());
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	
	
	/* cf. DTO의 필드
	private Integer no; // db에서 auto_increment 되는 값
	private String title; 
	private Date date; // 매퍼에서 now()로 넣어줄 값
	private Integer view; // db에서 디폴트값0 가짐
	private String content;
	private String fileName;
	private Boolean isSolved; // db에서 디폴트값0(false) 가짐
	private String writerId;	// 로그인된 유저의 아이디
	private String writerNickname; // 로그인된 유저의 닉네임
	*/
	
	
	
}

package controller;

import java.io.IOException;
import java.net.URLEncoder;

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
		
		// System.out.println("/editDrFoolPool doGet 호출");

		// 뷰의 버튼이 아니라 사용자가 직접 url로 요청하여 들어왔을때도 비로그인 상태일때는 로그인페이지로 이동하게함
		HttpSession session = request.getSession();
		if(session.getAttribute("member")==null) {
			// request.getRequestDispatcher("WEB-INF/views/login/login.jsp").forward(request, response);
			response.sendRedirect("login");
		} else {
			request.setCharacterEncoding("utf-8");
			Integer no = Integer.parseInt(request.getParameter("no"));
			
			// 이전 목록페이지의 값
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
				
				// content의 줄바꿈 <br>을 전부 \n으로 변경하여 수정폼 진입시 jsp에 뿌려준다
				String content = drFoolPool.getContent();
				content = content.replaceAll("<br>", "\n");
				drFoolPool.setContent(content);
				
				request.setAttribute("drFoolPool", drFoolPool);
				request.setAttribute("page", page);
				request.setAttribute("filter", filter);
				request.setAttribute("sOption", sOption);
				request.setAttribute("sValue", sValue);
				request.setAttribute("jspName", "drFoolPool");
				request.getRequestDispatcher("WEB-INF/views/drFoolPool/drFoolPoolEdit.jsp").forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("err", "풀풀박사 게시글 수정 실패");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// System.out.println("-----/editDrFoolPool doPost호출------");
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
		Integer no = Integer.parseInt(multi.getParameter("no"));
		String content = multi.getParameter("content");
		// **content의 경우 textarea에 작성된 줄바꿈기호 \n을 <br>로 바꾸어 DB에 저장하고, 글상세, 수정폼진입시에는 도로 <br>을 도로 \n으로 바꾼다.
		content = content.replaceAll("\n", "<br>");
		// System.out.println("fileName: " + fileName + ", title: " + title + ", content: " + content + ", no: " + no);
		
		// DrFoolPool객체 생성
		DrFoolPool drFoolPool = new DrFoolPool();
		drFoolPool.setTitle(title);
		drFoolPool.setContent(content);
		drFoolPool.setFileName(fileName);
		drFoolPool.setNo(no);
		drFoolPool.setWriterId(writerId);
		drFoolPool.setWriterNickname(writerNickname);
		
		// 이전 목록페이지의 값
		String prevpage = multi.getParameter("page");
		String prevfilter = multi.getParameter("filter");
		int page = 1; 
		if(prevpage!=null && prevpage.equals("")==false) page = Integer.parseInt(prevpage);
		String filter = "all";
		if(prevfilter!=null && prevfilter.equals("")==false) filter = prevfilter;
		String sOption = multi.getParameter("sOption");
		String sValue = multi.getParameter("sValue");
		// url에 한글이 될 수 있는 값인 '검색값'만 인코딩
		if(sValue!=null) sValue = URLEncoder.encode(sValue, "UTF-8"); // java.net.URLEncoder;
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			drFoolPoolService.drFoolPoolEdit(drFoolPool);
			
			if(sOption==null || sValue==null || sOption.equals("") || sValue.equals("")) {
				response.sendRedirect("drFoolPoolDetail?no=" + drFoolPool.getNo() + "&page=" + page + "&filter=" + filter);
			} else {
				response.sendRedirect("drFoolPoolDetail?no=" + drFoolPool.getNo() + "&page=" + page + "&filter=" + filter + "&sOption=" + sOption + "&sValue=" + sValue);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

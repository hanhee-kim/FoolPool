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

import bean.Member;
import bean.Poolentarier;
import service.PoolentarierService;
import service.PoolentarierServiceImpl;

/**
 * Servlet implementation class poolentarierEdit
 */
@WebServlet("/poolentarierEdit")
public class PoolentarierEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PoolentarierEdit() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		request.setAttribute("jspName", "poolentarier");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("member")==null) {
		response.sendRedirect("login");
		} else {
			Integer no = Integer.parseInt(request.getParameter("no"));
			request.setAttribute("no", no);

			try {
				// 게시글 조회
				PoolentarierService poolentarierService = new PoolentarierServiceImpl();
				Poolentarier poolentarier = poolentarierService.poolentarierDetail(no);
				
				// content의 줄바꿈 <br>을 전부 \n으로 변경
				String content = poolentarier.getContent();
				content = content.replaceAll("<br>", "\n");
				poolentarier.setContent(content);
				
				// 키워드 구분자 ,로 키워드 뿌려주기
				String keyword = poolentarier.getKeyword();
				if (keyword != null) {
					String[] keywords = keyword.split(",");
					request.setAttribute("keywords", keywords);
				} else {
					request.setAttribute("keywords", null);
				}
				
				request.setAttribute("poolentarier", poolentarier);

				request.getRequestDispatcher("WEB-INF/views/poolentarier/poolentarierEdit.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("err", e.getMessage());
				request.getRequestDispatcher("WEB-INF/views/error.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		if (member == null) { // 로그인을 안한상태로 수정 접근시 에러페이지로
			request.getRequestDispatcher("WEB-INF/views/error.jsp").forward(request, response);
		} else {
			Poolentarier poolentarier = new Poolentarier();

			// 파일 업로드
			String uploadPath = "C:\\upload";
			int size = 10 * 1024 * 1024;
			MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());

			// 작성폼 값 가져오기
			Integer no = Integer.parseInt(multi.getParameter("no"));
			String title = multi.getParameter("title");
			String fileName = multi.getOriginalFileName("fileName");
			String plantsName = multi.getParameter("plantsName");
			String writerId = member.getId();
			String writerNickname = member.getNickname();
			
			// textarea의 줄바꿈 \n을 전부 <br>로 변경
			String content = multi.getParameter("content");
			content = content.replaceAll("\n", "<br>");

			// 키워드 값 설정
			// checkbox 타입의 input 중, name="keywordForSubmit" 값을 모두 가져옴
			String[] keywords = multi.getParameterValues("keywordForSubmit");
			String keyword = null;
			if (keywords != null) {
				keyword = keywords[0];
				for (int i = 1; i < keywords.length; i++) {
					if (keywords[i] != null) {
						keyword += "," + keywords[i];
					}
				}
			}

			// no, date, view는 mapper에서 설정
			poolentarier.setNo(no);
			poolentarier.setTitle(title);
			poolentarier.setContent(content);
			poolentarier.setKeyword(keyword);
			poolentarier.setFileName(fileName);
			poolentarier.setPlantsName(plantsName);
			poolentarier.setWriterId(writerId);
			poolentarier.setWriterNickname(writerNickname);

			// DB
			try {
				PoolentarierService poolentarierService = new PoolentarierServiceImpl();
				poolentarierService.poolentarierEdit(poolentarier);
				response.sendRedirect("poolentarierDetail?no=" + no);
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("err", e.getMessage());
				request.getRequestDispatcher("WEB-INF/views/error.jsp").forward(request, response);
			}
		}
	}
}

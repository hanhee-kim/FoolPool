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
 * Servlet implementation class PoolentarierForm
 */
@WebServlet("/poolentarierForm")
public class PoolentarierForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PoolentarierForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		request.setAttribute("jspName", "poolentarier");
		request.getRequestDispatcher("WEB-INF/views/poolentarier/poolentarierForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 파일 업로드 시작
//		String uploadPath = request.getServletContext().getRealPath("static/img");
		String uploadPath = "C:\\upload";
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "utf-8", new DefaultFileRenamePolicy());
		// 파일 업로드 끝
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
//		String[] keyword = multi.getParameterValues("keyword");
		String fileName = multi.getOriginalFileName("fileName");
		System.out.println("파일명: " + fileName);
		String plantsName = multi.getParameter("plantsName");
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		String writerId = member.getId();
//		String writerId = "fish";
		String writerNickname = member.getNickname();
//		String writerNickname = "물고기";
		
		// 키워드 값 설정
		String[] keyword = new String[5]; // 키워드 배열 초기화
		for(int i = 1;i < 6;i++) {
			String parameterValue = multi.getParameter(i + "");
		    if (parameterValue != null) {
		        keyword[i - 1] = parameterValue;
		    }
		}

		String keywords = keyword[0];;
		// , 구분자로 키워드 값을 하나의 문자열로 통합
		for(int i = 1;i < keyword.length;i++) {
			if(keyword[i] != null) {
				keywords += "," + keyword[i];
			}
		}
		
		// no, date, view는 mapper에서 설정
		Poolentarier poolentarier= new Poolentarier();
		poolentarier.setTitle(title);
		poolentarier.setContent(content);
		poolentarier.setKeyword(keywords);
		poolentarier.setFileName(fileName);
		poolentarier.setPlantsName(plantsName);
		poolentarier.setWriterId(writerId);
		poolentarier.setWriterNickname(writerNickname);
		
		// DB
		try {
			PoolentarierService poolentarierService = new PoolentarierServiceImpl();
			poolentarierService.poolentarierWrite(poolentarier);
			response.sendRedirect("goPoolentarier");
		} catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}

package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import service.MemberServiceImpl;

/**
 * Servlet implementation class NicknameCheck
 */
@WebServlet("/nicknamecheck")
public class JoinNicknameCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinNicknameCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String nickname = request.getParameter("nickname");
		MemberService m_service = new MemberServiceImpl();
		String res;
		try {
			res = m_service.nicknameCheck(nickname);
			response.getWriter().print(res);
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("nickname duplicate check ajax response  error!!");
		}
	}

}

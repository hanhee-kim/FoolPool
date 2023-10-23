package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Flower;
import dao.FlowerDAO;
import dao.FlowerDAOImpl;
import service.FlowerService;
import service.FlowerServiceImpl;

/**
 * Servlet implementation class MenuBar
 */
@WebServlet("/main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Main() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		FlowerService f_service = new FlowerServiceImpl();
		//flower DB에 저장 ( xml파일 DB에 저장할 때 주석 풀고 꼭 다시 주석처리 해놓을 것)
//		try {
//			f_service.xml_parsing_insert();
//			System.out.println("service xml_parsing");
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.getRequestDispatcher("error.jsp").forward(request, response);
//		}
		
		//flower가져오기
		Flower flower = null;
		Date date = new Date();
		Integer fMonth = date.getMonth()+1;
		Integer fDay = date.getDate();
		try {
			flower =  f_service.searchFlowerByDate(fMonth, fDay);
			request.setAttribute("flower", flower);
		} catch (Exception e) {
			e.printStackTrace();
			request.getRequestDispatcher("WEB-INF/views/error.jsp").forward(request, response);
		}
		
		request.setAttribute("flower", flower);
		request.getRequestDispatcher("WEB-INF/views/main.jsp").forward(request, response);
	}

}

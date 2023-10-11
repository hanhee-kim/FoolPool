package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Flower;
import service.FlowerService;
import service.FlowerServiceImpl;

/**
 * Servlet implementation class RandomMain
 */
@WebServlet("/randommain")
public class RandomMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RandomMain() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer randomNum = (int)(Math.random()*365)+1;
		Flower flower = new Flower();
		//randomNum보내서 flower객체 가져오기
		FlowerService f_service = new FlowerServiceImpl();
		try {
			flower = f_service.searchFlowerByNo(randomNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("flower", flower);
		request.getRequestDispatcher("WEB-INF/views/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

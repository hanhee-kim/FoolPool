package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Flower;
import service.FlowerService;
import service.FlowerServiceImpl;

/**
 * Servlet implementation class DetailFlower
 */
@WebServlet("/detailflower")
public class DetailFlower extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailFlower() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer f_num =Integer.parseInt(request.getParameter("flowerNumber"));
		FlowerService f_service = new FlowerServiceImpl();
		Flower flower = new Flower();
		
		try {
			flower = f_service.searchFlowerByNo(f_num);
			request.setAttribute("flower", flower);
			request.setAttribute("jspName", "searchFlower");
			request.getRequestDispatcher("WEB-INF/views/searchFlower/detailflower.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

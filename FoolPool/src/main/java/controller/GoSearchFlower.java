package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Flower;
import service.FlowerService;
import service.FlowerServiceImpl;

/**
 * Servlet implementation class GoSearchFlower
 */
@WebServlet("/gosearchflower")
public class GoSearchFlower extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoSearchFlower() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String option 			= (String) request.getParameter("option");
		System.out.println(option);
		
		FlowerService f_service = new FlowerServiceImpl();
		Flower flower 			= new Flower();
		List<Flower> flowers 	= new ArrayList<>();
		String type = "";
		
		if(option.equals("singleDate")) {
			Integer startMonth 	= Integer.parseInt(request.getParameter("startMonth"));
			Integer startDay 	= Integer.parseInt(request.getParameter("startMonth"));
			try {
				flower = f_service.searchFlowerByDate(startMonth, startDay);
				flowers.add(flower);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(option.equals("periodDate")) {
			Integer startMonth 	= Integer.parseInt(request.getParameter("startMonth"));
			Integer startDay 	= Integer.parseInt(request.getParameter("startMonth"));
			Integer endMonth 	= Integer.parseInt(request.getParameter("startMonth"));
			Integer endDay	 	= Integer.parseInt(request.getParameter("startMonth"));
			try {
				flowers = f_service.searchFlowerByPeriod(startMonth, startDay, endMonth, endDay);
				request.setAttribute("flowers", flowers);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(option.equals("flowerName")) {
			 type = "flow_Nm";
			String flowerName 	= (String) request.getParameter("flowerName");
			try {
				flowers = f_service.searchFlowerByWord(type, flowerName);
				request.setAttribute("flowers", flowers);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(option.equals("flowerLang")) {
			type = "flow_Lang";
			String flowerLang 	= (String) request.getParameter("flowerLang");
			try {
				flowers = f_service.searchFlowerByWord(type, flowerLang);
				request.setAttribute("flowers", flowers);
				request.setAttribute("jspName", "searchFlower");
				response.sendRedirect("searchflower");
			} catch (Exception e) {
				e.printStackTrace();
			}			
		}
		
		request.setAttribute("flowers", flowers);
		request.setAttribute("jspName", "searchFlower");
		response.sendRedirect("searchflower");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Flower;
import service.FlowerService;
import service.FlowerServiceImpl;

/**
 * Servlet implementation class SearchFlower
 */
@WebServlet("/searchflower")
public class SearchFlower extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchFlower() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String option = request.getParameter("option");
		FlowerService f_service = new FlowerServiceImpl();
		Flower flower = new Flower();
		List<Flower> flowers = new ArrayList<>();
		String type = "";
		Map<String,Object> res = new HashMap<>();
		if (option != null ) {

			if (option.equals("singleDate")) {
				Integer startMonth = Integer.parseInt(request.getParameter("startMonth"));
				Integer startDay = Integer.parseInt(request.getParameter("startDay"));
				res.put("startMonth", startMonth);
				res.put("startDay", startDay);
				
				try {
					flower = f_service.searchFlowerByDate(startMonth, startDay);
					flowers.add(flower);
				} catch (Exception e) {
					e.printStackTrace();
					request.getRequestDispatcher("WEB-INF/views/error.jsp").forward(request, response);
				}

			} else if (option.equals("periodDate")) {
				Integer startMonth = Integer.parseInt(request.getParameter("startMonth"));
				Integer startDay = Integer.parseInt(request.getParameter("startDay"));
				Integer endMonth = Integer.parseInt(request.getParameter("endMonth"));
				Integer endDay = Integer.parseInt(request.getParameter("endDay"));
			
				res.put("startMonth", startMonth);
				res.put("startDay", startDay);
				res.put("endMonth", endMonth);
				res.put("endDay", endDay);
				try {
					flowers = f_service.searchFlowerByPeriod(startMonth, startDay, endMonth, endDay);
				} catch (Exception e) {
					e.printStackTrace();
					request.getRequestDispatcher("WEB-INF/views/error.jsp").forward(request, response);
				}
			} else if (option.equals("flowerName")) {
				type = "flow_Nm";
				String flowerName = (String) request.getParameter("byName");
//				System.out.println("flowerName : "+flowerName);
				res.put("flowerName", flowerName);
				if(flowerName.length() == 0) {
					res.put("word", "no_data");
				} else {
				try {
					flowers = f_service.searchFlowerByWord(type, flowerName);
//					if(flowers.size() == 0) {
//						res.put("word", "no_data");
//					}
				} catch (Exception e) {
					e.printStackTrace();
					request.getRequestDispatcher("WEB-INF/views/error.jsp").forward(request, response);
				 }
				}
			} else if (option.equals("flowerLang")) {
				type = "flow_Lang";
				String flowerLang = request.getParameter("byLang");
//				System.out.println("Lang : "+flowerLang);
				res.put("flowerLang", flowerLang);
				if(flowerLang.length() == 0) {
					res.put("word", "no_data");
				} else {
				try {
					flowers = f_service.searchFlowerByWord(type, flowerLang);
//					if(flowers.size() == 0) {
//						res.put("word", "no_data");
//					}
				} catch (Exception e) {
					e.printStackTrace();
					request.getRequestDispatcher("WEB-INF/views/error.jsp").forward(request, response);
				 }
				}
			}
			res.put("option", option);
		}	
			res.put("size", flowers.size());
			res.put("flowers", flowers);
			request.setAttribute("res", res);
			request.setAttribute("jspName", "searchFlower");
			request.getRequestDispatcher("WEB-INF/views/searchFlower/searchflower.jsp").forward(request, response);

	}

}

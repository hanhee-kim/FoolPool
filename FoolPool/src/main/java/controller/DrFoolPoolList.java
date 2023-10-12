package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.DrFoolPool;
import service.DrFoolPoolService;
import service.DrFoolPoolServiceImpl;

/**
 * Servlet implementation class DrFoolPoolList
 */
@WebServlet("/goDrFoolPool")
public class DrFoolPoolList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DrFoolPoolList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String page = request.getParameter("page");
		
		int curpage = 1; 
		if(page!=null) curpage = Integer.parseInt(page);
		
		System.out.println("-----/goDrFoolPool doGet호출----");
		System.out.println("page: " + page + ", curpage: " + curpage);
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			Map<String,Object> resMap = drFoolPoolService.drFoolPoolListByPage(curpage); // PageInfo와 List<DrFoolPool>가 담긴 맵을 서비스로부터 반환받음
			
			List<DrFoolPool> list = (List<DrFoolPool>) resMap.get("drFoolPoolList");
			System.out.println("서블릿-----\n0번째 게시글: " + list.get(0).toString());
			
			request.setAttribute("resMap", resMap);
			request.getRequestDispatcher("WEB-INF/views/drFoolPool/drFoolPoolList.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
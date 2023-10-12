package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		// 파라미터로 ?page를 가져오지 않았을때는 curpage를 1페이지로, 갖고왔을때는 가져온 값을 세팅한다
		int curpage = 1; 
		if(page!=null) curpage = Integer.parseInt(page);
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			Map<String,Object> resMap = drFoolPoolService.drFoolPoolListByPage(curpage); // PageInfo와 List<DrFoolPool>가 담긴 맵을 서비스로부터 반환받음
			request.setAttribute("resMap", resMap);
			request.getRequestDispatcher("WEB-INF/views/drFoolPool/drFoolPoolList.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

}

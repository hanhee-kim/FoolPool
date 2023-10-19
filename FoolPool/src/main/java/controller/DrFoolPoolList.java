package controller;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.DrFoolPool;
import bean.Member;
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
		request.setAttribute("jspName", "drFoolPool"); // 해당 메뉴에 들어와있다면 인클루드되는 menubar.jsp의 해당 메뉴 버튼색을 짙게 바꾸어두기 위해 뷰로 넘기는 문자열
		String prevpage = request.getParameter("page");
		String prevfilter = request.getParameter("filter");
		int page = 1; 
		if(prevpage!=null) page = Integer.parseInt(prevpage);
		String filter = "all";
		if(prevfilter!=null) filter = prevfilter;
		String sOption = request.getParameter("sOption");
		String sValue = request.getParameter("sValue");

		System.out.println("-----/goDrFoolPool doGet호출----");
		System.out.println("page: " + page + ", prevpage: " + page + ", prevfilter: " + prevfilter + ", filter: " + filter + "\nsOption: " + sOption + ", sValue: " + sValue);
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			Map<String,Object> resMap = drFoolPoolService.drFoolPoolListByPage(page, filter, sOption, sValue);
			
			request.setAttribute("page", page);
			request.setAttribute("filter", filter);
			request.setAttribute("resMap", resMap); // 맵에 담긴 벨류: PageInfo, List<DrFoolPool>
			request.setAttribute("sOption", sOption);
			request.setAttribute("sValue", sValue);
			request.getRequestDispatcher("WEB-INF/views/drFoolPool/drFoolPoolList.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	

}

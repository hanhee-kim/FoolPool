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

import org.apache.jasper.tagplugins.jstl.core.ForEach;

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
		String paramFilter = request.getParameter("filter");
		
		int curPage = 1; 
		if(page!=null) curPage = Integer.parseInt(page);
		String filter = "all";
		if(paramFilter!=null) filter = paramFilter;
		
		System.out.println("-----/goDrFoolPool doGet호출----");
		System.out.println("page: " + page + ", curPage: " + curPage + ", paramFilter: " + paramFilter + ", filter: " + filter);
		
		String sOption = null;
		String sValue = null;
			
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			Map<String,Object> resMap = drFoolPoolService.drFoolPoolListByPage(curPage, filter, sOption, sValue); // PageInfo와 List<DrFoolPool>가 담긴 맵을 서비스로부터 반환받음
			request.setAttribute("filter", filter);
			request.setAttribute("resMap", resMap);
			request.setAttribute("jspName", "drFoolPool"); // 해당 메뉴에 들어와있다면 인클루드되는 menubar.jsp의 해당 메뉴 버튼색을 짙게 바꾸어두기 위해 뷰로 넘기는 문자열
			request.getRequestDispatcher("WEB-INF/views/drFoolPool/drFoolPoolList.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String page = request.getParameter("page");
		String paramFilter = request.getParameter("filter");
		
		String filter = "all";
		if(paramFilter!=null) filter = paramFilter;
		int curPage = 1; 
		if(page!=null) curPage = Integer.parseInt(page);
		
		System.out.println("-----/goDrFoolPool doPost호출----");
		System.out.println("page: " + page + ", curPage: " + curPage + ", filter: " + filter);
		
		String sOption = request.getParameter("sOption");
		String sValue = request.getParameter("sValue");
		
		System.out.println("sOption: " + sOption + ", sValue: " + sValue);
		
		
		// 검색옵션 선택하지 않고 제출시 발생하는 예외처리 할것
		if(sOption.equals("unselected")) { 
			return;
		}
		
		try {
			DrFoolPoolService drFoolPoolService = new DrFoolPoolServiceImpl();
			Map<String,Object> resMap = drFoolPoolService.drFoolPoolListByPage(curPage, filter, sOption, sValue);
			
			System.out.println("----검색된 게시글 출력-----");
			List<DrFoolPool> resList = (List<DrFoolPool>) resMap.get("drFoolPoolList");
			Iterator<DrFoolPool> iter = resList.iterator();
			while(iter.hasNext()){
				System.out.println(iter.next().toString());
			}
			System.out.println("검색결과 수 : " + resList.size());
			
			request.setAttribute("filter", filter);
			request.setAttribute("resMap", resMap);
			request.setAttribute("jspName", "drFoolPool");
			request.getRequestDispatcher("WEB-INF/views/drFoolPool/drFoolPoolList.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("err", e.getMessage());
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

}

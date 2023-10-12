package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImagePrint
 */
@WebServlet("/image")
public class ImagePrint extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImagePrint() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 뷰에서의 요청코드: 
		 <img src="image?file=${DB에질의한파일명}"/>
		 
		 DB에서 받은 파일명을 파라미터로 하여 요청받아서, 파일명을 통해 파일이 위치한 실제경로를 생성하여 파일을 읽어들인뒤, 요청한 곳에 출력한다
		 */
		
		request.setCharacterEncoding("utf-8");
		
		// 파일명을 포함한 풀경로(절대경로) 생성
		String fileName = request.getParameter("file");
		String filePath = "C:\\upload\\" + fileName; 
		
		FileInputStream fis = new FileInputStream(filePath);
		OutputStream out = response.getOutputStream();
		byte[] buff = new byte[1024];
		int len = 0;
		while((len=fis.read(buff))>0) {
			out.write(buff, 0, len);
		}
		
		fis.close();
		out.close();
	}

}

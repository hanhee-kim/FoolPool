package controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ImageView
 */
@WebServlet("/imageview")
public class ImageView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			String fileName = request.getParameter("file");
			// upload 폴더 경로에서 fileName에 해당하는 파일명으로 filePath 지정
			String filePath = request.getServletContext().getRealPath("upload") + "\\" + fileName;
			
			FileInputStream fis = new FileInputStream(filePath);
			OutputStream out = response.getOutputStream();
			byte[] buff = new byte[1024];
			
			int len = 0;
			while((len=fis.read(buff)) > 0) {
				out.write(buff, 0, len);
			}
			fis.close();
			out.close();
	}

}

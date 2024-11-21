package fileupload;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


//서블릿 매핑
@WebServlet("/13FileUpload/MultipleProcess.do")
@MultipartConfig(
//업로드 용량 제한
		maxFileSize = 1024*1024*1,
		maxRequestSize = 1024*1024*10
		)


public class MultipleProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
					throws ServletException, IOException {
		try {
			//파일이 저장될 디렉토리의 물리적 경로를 얻어온다.
			String saveDirectory = getServletContext().getRealPath("/Uploads");
			//파일 업로드를 위한 함수 호출
			ArrayList<String> listFileName = FileUtil.multipleFIle(req, saveDirectory);
			//업로드한 파일의 갯수만큼 반복하여 파일명 변경
			for(String originalFileName : listFileName) {
				String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
			}
			
			//파일목록으로 이동
			resp.sendRedirect("FileList.jsp");
			
			
		}
		catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMessage", "파일업로드오류");
			req.getRequestDispatcher("FileUploadMain.jsp").forward(req,resp);
		}
	}
	
	
}
	



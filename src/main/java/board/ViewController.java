package board;

import java.io.IOException;
import java.util.List;
import java.util.Arrays;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/board/view.do")
public class ViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 게시물 일련번호 받기
        String idx = req.getParameter("idx");
        
        // DAO를 통해 게시물 가져오기
        BoardDAO dao = new BoardDAO();
        BoardDTO dto = dao.selectView(idx);
        dao.close();

        // 다운로드 수 증가
        dao.downCountPlus(idx);
        
        // 파일 확장자에 따른 처리
        String ofile = dto.getOfile();
        if (ofile != null && !ofile.isEmpty()) {
            String fileExtension = getFileExtension(ofile).toLowerCase();
            List<String> imageExtensions = Arrays.asList("png", "jpg", "jpeg", "gif");
            List<String> videoExtensions = Arrays.asList("mp4", "avi");
            List<String> audioExtensions = Arrays.asList("mp3");

            String fileTag = "";
            if (imageExtensions.contains(fileExtension)) {
                fileTag = String.format("<img src=\"../Uploads/%s\" alt=\"첨부 이미지\" style=\"max-width:100%%;\">", dto.getSfile());
            } else if (videoExtensions.contains(fileExtension)) {
                fileTag = String.format("<video controls style=\"max-width:100%%;\"><source src=\"../Uploads/%s\" type=\"video/%s\"></video>", dto.getSfile(), fileExtension);
            } else if (audioExtensions.contains(fileExtension)) {
                fileTag = String.format("<audio controls><source src=\"../Uploads/%s\" type=\"audio/%s\"></audio>", dto.getSfile(), fileExtension);
            } else {
                fileTag = String.format("<a href=\"download.do?ofile=%s&sfile=%s&idx=%s\">%s 다운로드</a>", dto.getOfile(), dto.getSfile(), dto.getIdx(), dto.getOfile());
            }
            req.setAttribute("fileTag", fileTag);
        }

        // JSP 페이지에 전달
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/board/View.jsp").forward(req, resp);
    }

    // 파일 확장자를 추출하는 메서드
    private String getFileExtension(String fileName) {
        int lastIndexOfDot = fileName.lastIndexOf('.');
        if (lastIndexOfDot == -1) {
            return ""; // 확장자가 없을 경우
        }
        return fileName.substring(lastIndexOfDot + 1);
    }
}

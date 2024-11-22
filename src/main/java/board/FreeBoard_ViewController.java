package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/board/freeboardview.do")
public class FreeBoard_ViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 게시물 불러오기
        FreeBoard_DAO dao = new FreeBoard_DAO();
        String idx = req.getParameter("idx");        
        dao.updateVisitCount(idx);  // 조회수 1 증가
        FreeBoard_DTO dto = dao.selectView(idx);
        dao.close();

        // 줄바꿈 처리
        dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));

        // 게시물(dto) 저장 후 뷰로 포워드
        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/board/FreeBoard_View.jsp").forward(req, resp);
    }
}

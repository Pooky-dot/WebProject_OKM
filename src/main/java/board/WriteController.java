package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

public class WriteController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, 
            HttpServletResponse resp) 
                    throws ServletException, IOException {        
        // 로그인 확인
        HttpSession session = req.getSession();
        if (session.getAttribute("UserId") == null) {
            JSFunction.alertLocation(resp, "로그인 후 이용해주세요.", 
                    "../login/login.jsp");
            return;
        }
        
        req.getRequestDispatcher("/Board/Write.jsp")
            .forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, 
            HttpServletResponse resp) 
                    throws ServletException, IOException {
        // 로그인 확인
        HttpSession session = req.getSession();
        if (session.getAttribute("UserId") == null) {
            JSFunction.alertLocation(resp, "로그인 후 이용해주세요.", 
                    "../login/login.jsp");
            return;
        }

        // 폼값을 DTO에 저장
        BoardDTO dto = new BoardDTO(); 
        dto.setUsername(session.getAttribute("UserId").toString());
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));

        // DAO를 통해 DB에 게시 내용 저장
        BoardDAO dao = new BoardDAO();
        int result = dao.insertWrite(dto);
        dao.close();

        // 성공 or 실패?
        if (result == 1) {  // 글쓰기 성공
            resp.sendRedirect("../board/list.do");
        } else {  // 글쓰기 실패
            JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", 
                    "../board/write.do");
        }
    }
}
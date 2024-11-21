package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/board/freeboardedit.do")
public class FreeBoard_EditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 로그인 확인
        HttpSession session = req.getSession();
        if (session.getAttribute("UserId") == null) {
            JSFunction.alertLocation(resp, "로그인 후 이용해주세요.", "../login/login.jsp");
            return;
        }

        // 게시물 얻어오기
        String idx = req.getParameter("idx");
        FreeBoard_DAO dao = new FreeBoard_DAO();
        FreeBoard_DTO dto = dao.selectView(idx);

        // 작성자 본인 확인
        if (!dto.getUsername().equals(session.getAttribute("UserId").toString())) {
            JSFunction.alertBack(resp, "작성자 본인만 수정할 수 있습니다.");
            return;
        }

        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/board/FreeBoardEdit.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 로그인 확인
        HttpSession session = req.getSession();
        if (session.getAttribute("UserId") == null) {
            JSFunction.alertLocation(resp, "로그인 후 이용해주세요.", "../login/login.jsp");
            return;
        }

        // 작성자 본인 확인
        if (!req.getParameter("id").equals(session.getAttribute("UserId").toString())) {
            JSFunction.alertBack(resp, "작성자 본인만 수정할 수 있습니다.");
            return;
        }

        // 수정 내용을 매개변수에서 얻어옴
        String idx = req.getParameter("idx");
        String title = req.getParameter("title");
        String content = req.getParameter("content");

        // DTO에 저장
        FreeBoard_DTO dto = new FreeBoard_DTO();
        dto.setIdx(idx);
        dto.setUsername(session.getAttribute("UserId").toString());
        dto.setTitle(title);
        dto.setContent(content);

        // DB에 수정 내용 반영
        FreeBoard_DAO dao = new FreeBoard_DAO();
        int result = dao.updatePost(dto);
        dao.close();

        // 성공 or 실패?
        if (result == 1) {  // 수정 성공
            resp.sendRedirect("../board/freeboardview.do?idx=" + idx);
        } else {  // 수정 실패
            JSFunction.alertLocation(resp, "수정에 실패했습니다.", "../board/freeboardedit.do?idx=" + idx);
        }
    }
}

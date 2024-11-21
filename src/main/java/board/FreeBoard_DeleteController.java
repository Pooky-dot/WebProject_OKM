package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/board/freeboarddelete.do")
public class FreeBoard_DeleteController extends HttpServlet {
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
            JSFunction.alertBack(resp, "작성자 본인만 삭제할 수 있습니다.");
            return;
        }

        // 게시물 삭제
        int result = dao.deletePost(idx);
        dao.close();

        if (result == 1) {
            JSFunction.alertLocation(resp, "삭제되었습니다.", "../board/freeboard.do");
        } else {
            JSFunction.alertBack(resp, "게시물 삭제에 실패했습니다. 다시 시도해주세요.");
        }
    }
}

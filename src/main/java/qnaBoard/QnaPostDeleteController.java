package qnaBoard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/qnaBoard/qnaPostDelete.do")
public class QnaPostDeleteController extends HttpServlet {
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

        // 게시물 얻어오기 (String -> int 변환)
        String idxParam = req.getParameter("idx");
        int idx = 0;

        try {
            idx = Integer.parseInt(idxParam); // String을 int로 변환
        } catch (NumberFormatException e) {
            System.out.println("일련번호 변환 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
            JSFunction.alertBack(resp, "잘못된 접근입니다.");
            return;
        }

        QnaPostDAO dao = new QnaPostDAO();
        QnaPostDTO dto = dao.selectView(idx);

        // 게시물이 존재하지 않을 경우 처리
        if (dto == null) {
            JSFunction.alertBack(resp, "존재하지 않는 게시물입니다.");
            return;
        }

        // 작성자 본인 확인
        if (!dto.getUsername().equals(session.getAttribute("UserId").toString())) {
            JSFunction.alertBack(resp, "작성자 본인만 삭제할 수 있습니다.");
            return;
        }

        // 게시물 삭제
        int result = dao.deletePost(idx);
        dao.close();

        if (result == 1) {
            JSFunction.alertLocation(resp, "삭제되었습니다.", "../qnaBoard/qnaPostList.do");
        } else {
            JSFunction.alertBack(resp, "게시물 삭제에 실패했습니다. 다시 시도해주세요.");
        }
    }
}

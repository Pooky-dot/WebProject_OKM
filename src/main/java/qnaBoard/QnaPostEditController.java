package qnaBoard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import utils.JSFunction;

@WebServlet("/qnaBoard/qnaPostEdit.do")
public class QnaPostEditController extends HttpServlet {
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

        // 작성자 본인 확인
        if (!dto.getUsername().equals(session.getAttribute("UserId").toString())) {
            JSFunction.alertBack(resp, "작성자 본인만 수정할 수 있습니다.");
            return;
        }

        req.setAttribute("dto", dto);
        req.getRequestDispatcher("/qnaBoard/QnaPostEdit.jsp").forward(req, resp);
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
        if (!req.getParameter("username").equals(session.getAttribute("UserId").toString())) {
            JSFunction.alertBack(resp, "작성자 본인만 수정할 수 있습니다.");
            return;
        }

        // 수정 내용을 매개변수에서 얻어옴 (String -> int 변환)
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

        String title = req.getParameter("title");
        String content = req.getParameter("content");

        // DTO에 저장
        QnaPostDTO dto = new QnaPostDTO();
        dto.setIdx(idx);
        dto.setUsername(session.getAttribute("UserId").toString());
        dto.setTitle(title);
        dto.setContent(content);

        // DB에 수정 내용 반영
        QnaPostDAO dao = new QnaPostDAO();
        int result = dao.updatePost(dto);
        dao.close();

        // 성공 or 실패?
        if (result == 1) {
            resp.sendRedirect("../qnaBoard/qnaPostView.do?idx=" + idx);
        } else {
            JSFunction.alertLocation(resp, "수정에 실패했습니다.", "../qnaBoard/qnaPostEdit.do?idx=" + idx);
        }
    }
}

package qnaBoard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/qnaBoard/qnaPostView.do")
public class QnaPostViewController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // 게시물 일련번호 파라미터 받기 (String -> int 변환)
        String idxParam = req.getParameter("idx");
        int idx = 0;

        try {
            idx = Integer.parseInt(idxParam); // String을 int로 변환
        } catch (NumberFormatException e) {
            System.out.println("일련번호 변환 중 예외 발생: " + e.getMessage());
            e.printStackTrace();
            // 유효하지 않은 경우 에러 페이지로 리다이렉트 또는 오류 처리
            resp.sendRedirect("../qnaBoard/qnaPostList.do");
            return;
        }

        // DAO를 이용하여 조회수 1 증가
        QnaPostDAO dao = new QnaPostDAO();
        dao.updateVisitCount(idx);  // 조회수 1 증가

        // 게시물 상세 조회
        QnaPostDTO dto = dao.selectView(idx);
        dao.close();

        // 조회된 DTO 객체를 JSP로 전달
        if (dto != null) {
            // 줄바꿈 처리
            dto.setContent(dto.getContent().replaceAll("\r\n", "<br/>"));

            req.setAttribute("dto", dto);
            req.getRequestDispatcher("/qnaBoard/QnaPostView.jsp").forward(req, resp);
        } else {
            // 유효하지 않은 게시물의 경우 리스트로 리다이렉트
            resp.sendRedirect("../qnaBoard/qnaPostList.do");
        }
    }
}

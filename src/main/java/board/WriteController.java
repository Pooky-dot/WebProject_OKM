package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;


public class WriteController extends HttpServlet {
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

        // 게시판 타입 확인 (자유게시판, Q&A, 자료실 등)
        String boardType = req.getParameter("board_type"); // 게시판 유형을 폼에서 가져옴

        // 시퀀스를 통해 고유 번호 생성
        int nextId = getNextIdForBoard(boardType); // 각 게시판별로 고유한 숫자 생성 로직
        String postId = boardType + "-" + String.format("%03d", nextId); // 예: "FB-001"

        // 폼값을 DTO에 저장
        BoardDTO dto = new BoardDTO();
        dto.setPost_Id(postId);
        dto.setBoard_Type(boardType);
        dto.setUsername(session.getAttribute("UserId").toString());
        dto.setTitle(req.getParameter("title"));
        dto.setContent(req.getParameter("content"));

        // DAO를 통해 DB에 게시 내용 저장
        BoardDAO dao = new BoardDAO();
        int result = dao.insertWrite(dto);
        dao.close();

        // 성공 여부 확인
        if (result == 1) {  // 글쓰기 성공
            resp.sendRedirect("../board/list.do");
        } else {  // 글쓰기 실패
            JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "../board/write.do");
        }
    }

    // 게시판별 고유 번호 생성하는 메서드 (예시)
    private int getNextIdForBoard(String boardType) {
        // 데이터베이스에서 해당 boardType의 마지막 post_id를 조회하여 다음 번호를 계산
        // 여기서는 간단히 임의의 숫자를 반환하는 예시로 작성합니다.
        return 1; // 실제 구현 시 SQL로 현재 가장 큰 번호를 조회 후 +1
    }
}

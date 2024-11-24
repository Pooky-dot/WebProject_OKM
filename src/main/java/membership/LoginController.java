package membership;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

import java.io.IOException;

@WebServlet("/login/LoginController.do")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // DAO를 통해 로그인 정보 확인
        MemberDAO dao = new MemberDAO(getServletContext());
        MemberDTO member = dao.getMemberDTO(username, password);

        if (member != null) {
            // 로그인 성공 시 세션에 member 객체 저장
            HttpSession session = req.getSession();
            session.setAttribute("UserId", member.getUsername());
            session.setAttribute("member", member);
            // 마이페이지로 리다이렉트
            resp.sendRedirect("../memberEdit/MemberDetail.jsp");
        } else {
            // 로그인 실패 시 경고 메시지 출력
            JSFunction.alertLocation(resp, "아이디 또는 비밀번호가 잘못되었습니다.", "../login/login.jsp");
        }
    }
}

package membership;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

import java.io.IOException;
import java.io.PrintWriter;


public class MemberEditController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 로그인 여부 확인
        HttpSession session = req.getSession();
        if (session.getAttribute("UserId") == null) {
            JSFunction.alertLocation(resp, "로그인 후 이용해주세요.", "../login/login.jsp");
            return;
        }

        // 로그인 확인 후 회원정보 수정 처리
        req.setCharacterEncoding("UTF-8");

        // 폼 데이터 받기
        String username = (String) session.getAttribute("UserId");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");

        // DTO에 데이터 담기
        MemberDTO member = new MemberDTO();
        member.setUsername(username);
        member.setPassword(password);
        member.setName(name);
        member.setEmail(email);
        member.setPhone(phone);

        // DAO를 통해 업데이트 실행
        MemberDAO dao = new MemberDAO(getServletContext());
        int result = dao.updateMember(member);

        // 업데이트 성공 시 데이터베이스에서 최신 회원 정보 가져와 세션에 저장
        if (result > 0) {
            // 업데이트 성공 후 데이터베이스에서 최신 정보 가져오기
            MemberDTO updatedMember = dao.getMemberDTO(username);
            if (updatedMember != null) {
                session.setAttribute("member", updatedMember); // 최신 정보 세션에 저장
            }
        }

        // PrintWriter를 사용해 자바스크립트로 응답
        resp.setContentType("text/html; charset=UTF-8");
        PrintWriter out = resp.getWriter();

        if (result > 0) {
            out.println("<script>");
            out.println("alert('회원 정보가 성공적으로 수정되었습니다!');");
            out.println("location.href='../memberEdit/MemberDetail.jsp';");
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('회원 정보 수정에 실패했습니다. 다시 시도해주세요.');");
            out.println("history.back();");
            out.println("</script>");
        }
        out.close();
    }
}

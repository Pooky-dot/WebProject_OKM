<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// 로그인 폼에서 전송(Submit)한 폼값을 받는다.
String userId = request.getParameter("user_id");
String userPwd = request.getParameter("user_pw");

// application 내장객체를 이용해서 web.xml에 등록된 접속정보를 읽어온다.
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

// 위 4개의 정보를 인수로 DAO 인스턴스를 생성한다. 여기서 DB연결이 완료된다.
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
// 입력받은 아이디, 패스워드를 인수로 인증을 위한 메서드를 호출한다.
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
// DB 연결 종료
dao.close();

// 만약 DTO객체에 아이디가 저장되어 있다면 로그인에 성공한 것으로 판단.
if (memberDTO.getUsername() != null) {
    // 세션 영역에 아이디와 이름을 저장한다.
    session.setAttribute("UserId", memberDTO.getUsername());
    session.setAttribute("UserName", memberDTO.getName());
    // 로그인 성공 시 index.jsp로 이동
    response.sendRedirect("../index.jsp");
} else {
    // 로그인에 실패한 경우에는 request영역에 에러메세지를 저장한 후 로그인 페이지로 포워드한다.
    request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
    request.getRequestDispatcher("login.jsp").forward(request, response);
}
%>

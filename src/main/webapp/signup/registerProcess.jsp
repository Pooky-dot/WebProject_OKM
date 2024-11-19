<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 회원가입 폼에서 전송(Submit)한 폼값을 받는다. 
String username = request.getParameter("username"); 
String password = request.getParameter("password");
String name = request.getParameter("name");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

// application 내장객체를 이용해서 web.xml에 등록된 접속정보를 읽어온다. 
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

// DAO 인스턴스를 생성하고 DB 연결
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);

// 입력받은 정보를 바탕으로 MemberDTO 객체 생성
MemberDTO member = new MemberDTO();
member.setUsername(username);
member.setPassword(password);
member.setName(name);
member.setEmail(email);
member.setPhone(phone);

// 회원 정보 삽입
int result = dao.insertMember(member);
dao.close();

// 삽입 결과에 따른 처리
if (result > 0) {
    // 회원가입 성공 시 로그인 페이지로 이동
    response.sendRedirect("../login/login.jsp");
} else {
    // 회원가입 실패 시 에러메시지 설정 후 회원가입 페이지로 포워드
    request.setAttribute("RegisterErrMsg", "회원가입에 실패했습니다. 다시 시도해주세요.");
    request.getRequestDispatcher("signup.jsp").forward(request, response);
}
%>

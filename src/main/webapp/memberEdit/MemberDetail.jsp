<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="membership.MemberDTO" %>
<%@ page import="membership.MemberDAO" %>

<%
    // 세션에서 사용자 이름을 가져옴 (로그인 상태에서 사용한다고 가정)
    String username = (String) session.getAttribute("UserId");

    if (username == null || username.isEmpty()) {
        // 로그인되지 않은 상태라면 로그인 페이지로 이동
        response.sendRedirect("../login/login.jsp");
        return;
    }

    // DAO를 통해 사용자 정보를 가져옴
    MemberDAO dao = new MemberDAO(application);
    MemberDTO member = dao.getMemberDTO(username); // 비밀번호 없이 사용자 정보 가져오기

    if (member == null || member.getUsername() == null) {
        out.println("<script>alert('사용자 정보를 불러올 수 없습니다.'); location.href='../index.jsp';</script>");
        return;
    }
%>

<html>
<head>
    <title>회원 정보 상세 보기</title>
</head>
<body>
    <h2>회원 정보 상세</h2>
    <p>아이디: <%= member.getUsername() %></p>
    <p>이름: <%= member.getName() %></p>
    <p>이메일: <%= member.getEmail() %></p>
    <p>전화번호: <%= member.getPhone() %></p>
    <p>가입일: <%= member.getCreated_at() %></p>
    <p>최근 수정일: <%= member.getUpdated_at() %></p>

    <a href="MemberEdit.jsp">회원 정보 수정</a>
    <a href="../index.jsp">메인 페이지로 돌아가기</a>
</body>
</html>

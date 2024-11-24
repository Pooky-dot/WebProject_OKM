<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="membership.MemberDTO" %>
<%@ page import="membership.MemberDAO" %>

<%
    // 세션에서 member 객체 가져오기
    MemberDTO member = (MemberDTO) session.getAttribute("member");

    if (member == null) {
        // 세션에 member가 없는 경우 데이터베이스에서 가져오기
        String username = (String) session.getAttribute("UserId");
        if (username != null) {
            MemberDAO dao = new MemberDAO(application);
            member = dao.getMemberDTO(username);
            if (member != null) {
                session.setAttribute("member", member);
            } else {
                out.println("<script>alert('회원 정보를 불러올 수 없습니다. 다시 로그인해주세요.'); location.href='../login/login.jsp';</script>");
                return;
            }
        } else {
            out.println("<script>alert('로그인 정보가 없습니다. 다시 로그인해주세요.'); location.href='../login/login.jsp';</script>");
            return;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>마이페이지 - 회원 정보 상세 보기</title>
    <!-- CSS 및 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet" />
    <style>
        .member-detail-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        .member-detail-title {
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.8em;
            font-weight: bold;
            color: #333;
        }
        .member-detail-info {
            padding: 10px 0;
        }
        .member-detail-info label {
            font-weight: bold;
            margin-right: 10px;
        }
        .action-buttons {
            text-align: center;
            margin-top: 30px;
        }
        .action-buttons .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
            margin: 10px;
        }
        .btn-edit {
            background-color: #007bff;
        }
        .btn-edit:hover {
            background-color: #0056b3;
        }
        .btn-main {
            background-color: #28a745;
        }
        .btn-main:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

  <!-- 회원 정보 상세 섹션 -->
  <div class="container member-detail-container">
    <h2 class="member-detail-title">마이페이지</h2>

    <div class="member-detail-info">
        <label>아이디:</label> <span><%= member.getUsername() %></span>
    </div>
    <div class="member-detail-info">
        <label>이름:</label> <span><%= member.getName() %></span>
    </div>
    <div class="member-detail-info">
        <label>이메일:</label> <span><%= member.getEmail() %></span>
    </div>
    <div class="member-detail-info">
        <label>전화번호:</label> <span><%= member.getPhone() %></span>
    </div>
    <div class="member-detail-info">
        <label>가입일:</label> <span><%= member.getCreated_at() %></span>
    </div>
    <div class="member-detail-info">
        <label>최근 수정일:</label> <span><%= member.getUpdated_at() %></span>
    </div>

    <div class="action-buttons">
        <a href="MemberEdit.jsp" class="btn btn-edit">회원 정보 수정</a>
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-main">메인 페이지로 돌아가기</a>
    </div>
  </div>

  <!-- jQuery -->
  <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <!-- Bootstrap JavaScript -->
  <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

</body>
</html>

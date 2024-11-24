<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="membership.MemberDTO" %>
<html>
<head>
    <title>회원 정보 수정</title>
    <!-- CSS 및 스타일 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet" />
    <style>
        .edit-container {
            max-width: 600px;
            margin: 50px auto;
        }
        .edit-card {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .edit-title {
            text-align: center;
            font-size: 1.8em;
            margin-bottom: 20px;
            color: #333;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-control[readonly] {
            background-color: #e9ecef;
        }
        .btn-container {
            text-align: center;
            margin-top: 20px;
        }
        .btn-container .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .btn-submit {
            background-color: #007bff;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
        .btn-cancel {
            background-color: #dc3545;
            margin-left: 10px;
        }
        .btn-cancel:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="${pageContext.request.contextPath}/images/hero-bg.jpg" alt="">
    </div>
    <!-- header section starts -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
            <span>어딜강</span>
          </a>
          <!-- 네비게이션 코드 생략 -->
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>

  <!-- 회원 정보 수정 섹션 -->
  <div class="container edit-container">
    <div class="card edit-card">
      <h2 class="edit-title">회원 정보 수정</h2>
      
      <%
          // 세션에서 member 객체를 가져오기
          MemberDTO member = (MemberDTO) session.getAttribute("member");

          if (member == null) {
              out.println("<script>alert('회원 정보를 불러올 수 없습니다. 다시 로그인해주세요.'); location.href='../login/login.jsp';</script>");
              return;
          }
      %>
      
      <form action="${pageContext.request.contextPath}/membership/MemberEditController.do" method="post">
          
          <div class="form-group">
              <label for="username">아이디</label>
              <input type="text" class="form-control" id="username" name="username" value="<%= member.getUsername() %>" readonly>
          </div>

          <div class="form-group">
              <label for="created_at">가입일</label>
              <input type="text" class="form-control" id="created_at" name="created_at" value="<%= member.getCreated_at() %>" readonly>
          </div>

          <div class="form-group">
              <label for="password">비밀번호</label>
              <input type="password" class="form-control" id="password" name="password" value="<%= member.getPassword() %>" required>
          </div>

          <div class="form-group">
              <label for="name">이름</label>
              <input type="text" class="form-control" id="name" name="name" value="<%= member.getName() %>" required>
          </div>

          <div class="form-group">
              <label for="email">이메일</label>
              <input type="email" class="form-control" id="email" name="email" value="<%= member.getEmail() %>" required>
          </div>

          <div class="form-group">
              <label for="phone">전화번호</label>
              <input type="text" class="form-control" id="phone" name="phone" value="<%= member.getPhone() %>" required>
          </div>
          
          <div class="btn-container">
              <button type="submit" class="btn btn-submit">수정하기</button>
              <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-cancel">취소</a>
          </div>
      </form>
    </div>
  </div>

  <!-- footer section -->
  <footer class="footer_section">
    <div class="container">
      <div class="row">
        <!-- 푸터 내용 생략 -->
      </div>
    </div>
  </footer>

  <!-- jQuery -->
  <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <!-- Bootstrap JavaScript -->
  <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

</body>
</html>

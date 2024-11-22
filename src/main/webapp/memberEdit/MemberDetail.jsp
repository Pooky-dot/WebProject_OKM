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

<!DOCTYPE html>
<html>
<head>
    <title>회원 정보 상세 보기</title>
    <!-- CSS 및 스타일 -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/responsive.css" rel="stylesheet" />
    <style>
        .member-detail-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .member-detail-title {
            text-align: center;
            font-size: 1.8em;
            margin-bottom: 20px;
            color: #333;
        }
        .member-info p {
            font-size: 16px;
            color: #555;
            line-height: 1.6;
        }
        .member-info p strong {
            display: inline-block;
            width: 100px;
            font-weight: 600;
        }
        .actions {
            text-align: center;
            margin-top: 30px;
        }
        .actions a {
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            padding: 10px 20px;
            margin: 5px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .actions a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body class="sub_page">

  <div class="hero_area">
    <div class="bg-box">
      <img src="../images/hero-bg.jpg" alt="">
    </div>
     <!-- header section starts -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="../index.jsp">
            <span>어딜강</span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">
              <li class="nav-item active">
                <a class="nav-link" href="../index.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../menu.jsp">Menu</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../about.jsp">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../book.jsp">Book Table</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="boardDropdown" data-toggle="dropdown">게시판</a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="../board/listPage.do">자유게시판</a>
                  <a class="dropdown-item" href="../board/qnaBoard.jsp">Q&A게시판</a>
                  <a class="dropdown-item" href="../board/listPage.do">자료게시판</a>
                </div>
              </li>
            </ul>

            <% 
              // 로그인 여부를 확인하는 코드 추가
              String loggedInUser = (String) session.getAttribute("UserId");
            %>

            <!-- 로그인 상태에 따라 버튼 표시 -->
            <div class="user_option">
              <% if (loggedInUser != null) { %>
                <a href="../login/logout.jsp" class="order_online" style="margin-right: 15px;">
                    로그아웃
                </a>
              <% } else { %>
                <a href="../login/login.jsp" class="order_online" style="margin-right: 15px;">
                    로그인
                </a>
                <a href="../signup/signup.jsp" class="order_online">
                    회원가입
                </a>
              <% } %>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>

  <!-- 회원 정보 상세 보기 섹션 -->
  <div class="container member-detail-container">
      <h2 class="member-detail-title">회원 정보 상세</h2>
      <div class="member-info">
          <p><strong>아이디:</strong> <%= member.getUsername() %></p>
          <p><strong>이름:</strong> <%= member.getName() %></p>
          <p><strong>이메일:</strong> <%= member.getEmail() %></p>
          <p><strong>전화번호:</strong> <%= member.getPhone() %></p>
          <p><strong>가입일:</strong> <%= member.getCreated_at() %></p>
          <p><strong>최근 수정일:</strong> <%= member.getUpdated_at() %></p>
      </div>
      <div class="actions">
          <a href="MemberEdit.jsp">회원 정보 수정</a>
          <a href="../index.jsp">메인 페이지로 돌아가기</a>
      </div>
  </div>

  <!-- footer section -->
  <footer class="footer_section">
    <div class="container">
      <div class="row">
        <div class="col-md-4 footer-col">
          <div class="footer_contact">
            <h4>Contact Us</h4>
            <div class="contact_link_box">
              <a href="">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <span>Location</span>
              </a>
              <a href="">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>Call +01 1234567890</span>
              </a>
              <a href="">
                <i class="fa fa-envelope" aria-hidden="true"></i>
                <span>demo@gmail.com</span>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <div class="footer_detail">
            <a href="" class="footer-logo">Feane</a>
            <p>Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with</p>
            <div class="footer_social">
              <a href="">
                <i class="fa fa-facebook" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-twitter" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-linkedin" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-instagram" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-pinterest" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <h4>Opening Hours</h4>
          <p>Everyday</p>
          <p>10.00 Am - 10.00 Pm</p>
        </div>
      </div>
      <div class="footer-info">
        <p>
          &copy; <span id="displayYear"></span> All Rights Reserved By
          <a href="https://html.design/">Free Html Templates</a><br><br>
          &copy; <span id="displayYear"></span> Distributed By
          <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
        </p>
      </div>
    </div>
  </footer>
  <!-- footer section -->

  <!-- jQuery -->
  <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
  <!-- Popper JS (Bootstrap Dropdown에 필요) -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <!-- Bootstrap JavaScript -->
  <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <!-- CSS 및 스타일 -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/responsive.css" rel="stylesheet" />
    <style>
        .login-container {
            max-width: 25%; /* 화면의 25% 크기로 설정 */
            margin: 50px auto; /* 가운데 정렬 및 여백 */
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .login-title {
            text-align: center; /* 제목 가운데 정렬 */
            margin-bottom: 30px;
            font-weight: bold;
            font-size: 1.8em;
        }
    </style>
    <script>
        // 로그인 폼의 입력값을 서버로 전송하기 전에 검증하기 위한 함수
        function validateForm(form) {
            if (!form.username.value) {
                alert("아이디를 입력하세요.");
                form.username.focus();
                return false;
            }
            if (form.password.value == "") {
                alert("비밀번호를 입력하세요.");
                form.password.focus();
                return false;
            }
        }
    </script>
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

  <!-- 로그인 섹션 -->
  <div class="container login-container">
    <h2 class="login-title">로그인</h2>

    <span style="color: red; font-size: 1.2em;">
      <!-- 삼항연산자를 통해 로그인 오류 메시지 출력 -->
      <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
    </span>

    <% 
    // 세션에 사용자 정보가 없는 경우 로그인 폼 출력
    if (session.getAttribute("UserId") == null) { 
    %>
      <form method="post" action="loginProcess.jsp" onsubmit="return validateForm(this);">

        <div class="form-group">
          <input type="text" class="form-control" id="user_id" name="user_id" placeholder="아이디 입력" required>
        </div>
        <div class="form-group">
          <input type="password" class="form-control" id="user_pw" name="user_pw" placeholder="비밀번호 입력" required>
        </div>
        <button type="submit" class="btn btn-primary">로그인</button>
      </form>
    <% 
    } else { 
    %>
      <!-- 로그인된 상태에서 사용자 환영 메시지와 로그아웃 링크 출력 -->
      <p><%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.</p>
      <a href="logout.jsp">[로그아웃]</a>
    <% 
    } 
    %>
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

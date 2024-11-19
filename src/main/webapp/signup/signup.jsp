<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <!-- CSS 및 스타일 -->
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
    <link href="../css/style.css" rel="stylesheet" />
    <link href="../css/responsive.css" rel="stylesheet" />
     <style>
        .registration-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .registration-title {
            text-align: center;
            font-size: 1.5em;
            margin-bottom: 20px;
        }
        .error-message {
            color: red;
            font-size: 0.9em;
            margin-bottom: 5px;
        }
        .btn-container {
            text-align: center;
        }
        .btn-container .btn {
            margin: 10px;
        }
    </style>
   <script>
        function validateForm(form) {
            // Form validation logic
            if (!form.user_id.value || form.user_id.value.length < 6 || form.user_id.value.length > 20) {
                alert("아이디는 6~20자 이내로 입력해주세요.");
                form.user_id.focus();
                return false;
            }
            if (form.user_pw.value.length < 8 || form.user_pw.value.length > 20) {
                alert("비밀번호는 8~20자 이내로 입력해주세요.");
                form.user_pw.focus();
                return false;
            }
            if (form.user_pw.value !== form.user_pw_check.value) {
                alert("비밀번호가 일치하지 않습니다.");
                form.user_pw_check.focus();
                return false;
            }
            if (!form.name.value) {
                alert("이름을 입력해주세요.");
                form.name.focus();
                return false;
            }
            if (!form.phone.value || !/^[0-9]{11}$/.test(form.phone.value)) {
                alert("올바른 휴대폰 번호를 입력해주세요.");
                form.phone.focus();
                return false;
            }
            return true;
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
        <nav class="navbar navbar-expand-lg custom_nav-container ">
          <a class="navbar-brand" href="../index.jsp">
            <span>
              Feane
            </span>
          </a>

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">
              <li class="nav-item">
                <a class="nav-link" href="../index.jsp">Home </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../menu.jsp">Menu</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="../about.jsp">About</a>
              </li>
              <li class="nav-item active">
                <a class="nav-link" href="../book.jsp">Book Table <span class="sr-only">(current)</span> </a>
              </li>
            </ul>
            <div class="user_option">
              <a href="" class="user_link">
                <i class="fa fa-user" aria-hidden="true"></i>
              </a>
              <a class="cart_link" href="#">
                <!-- Cart icon SVG remains unchanged -->
                ...
              </a>
              <form class="form-inline">
                <button class="btn my-2 my-sm-0 nav_search-btn" type="submit">
                  <i class="fa fa-search" aria-hidden="true"></i>
                </button>
              </form>
              <a href="" class="order_online">
                Order Online
              </a>
            </div>
          </div>
        </nav>
      </div>
    </header>
    <!-- end header section -->
  </div>

  <!-- 회원가입 섹션 -->
   <div class="container registration-container">
        <h2 class="registration-title">회원가입</h2>
        <p>회원이 되어 다양한 혜택을 경험해 보세요!</p>

        <form method="post" action="registerProcess.jsp" onsubmit="return validateForm(this);">
            <div class="form-group">
                <label for="user_id">아이디</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="아이디 입력 (6~20자)" required>
                <button type="button" class="btn btn-secondary">중복 확인</button>
            </div>

            <div class="form-group">
                <label for="user_pw">비밀번호</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호 입력 (8~20자)" required>
            </div>

            <div class="form-group">
                <label for="user_pw_check">비밀번호 확인</label>
                <input type="password" class="form-control" id="user_pw_check" name="user_pw_check" placeholder="비밀번호 재입력" required>
            </div>

            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요" required>
            </div>

            <div class="form-group">
                <label for="phone">전화번호</label>
                <input type="text" class="form-control" id="phone" name="phone" placeholder="휴대폰 번호 입력" required>
            </div>

            <div class="form-group">
                <label for="email">이메일 주소</label>
                <div class="input-group">
                    <input type="text" class="form-control" id="email" name="email" placeholder="이메일 주소" required>
                    <div class="input-group-append">
                        <span class="input-group-text">@</span>
                        <input type="text" class="form-control" value="naver.com" readonly>
                    </div>
                </div>
            </div>

            

            <div class="btn-container">
                <button type="submit" class="btn btn-primary">가입하기</button>
                <button type="reset" class="btn btn-warning">가입취소</button>
            </div>
        </form>
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

</body>
</html>


<!-- MemberEdit.jsp -->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class=""> </span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">
              <li class="nav-item active">
                <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/menu.jsp">Menu</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/about.jsp">About</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/book.jsp">Book Table</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="boardDropdown" data-toggle="dropdown">게시판</a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/board/listPage.do">자유게시판</a>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/board/qnaBoard.jsp">Q&A게시판</a>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/board/listPage.do">자료게시판</a>
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
                <a href="${pageContext.request.contextPath}/login/logout.jsp" class="order_online" style="margin-right: 15px;">
                    로그아웃
                </a>
              <% } else { %>
                <a href="${pageContext.request.contextPath}/login/login.jsp" class="order_online" style="margin-right: 15px;">
                    로그인
                </a>
                <a href="${pageContext.request.contextPath}/signup/signup.jsp" class="order_online">
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

  <!-- 회원 정보 수정 섹션 -->
  <div class="container edit-container">
    <div class="card edit-card">
      <h2 class="edit-title">회원 정보 수정</h2>
      <form action="${pageContext.request.contextPath}/membership/MemberEditController.do" method="post">

          <div class="form-group">
              <label for="username">아이디</label>
              <input type="text" class="form-control" id="username" name="username" value="${member.username}" readonly>
          </div>

          <div class="form-group">
              <label for="password"><i class="fa fa-key"></i> 비밀번호</label>
              <input type="password" class="form-control" id="password" name="password" value="${member.password}" required>
          </div>

          <div class="form-group">
              <label for="name"><i class="fa fa-user"></i> 이름</label>
              <input type="text" class="form-control" id="name" name="name" value="${member.name}" required>
          </div>

          <div class="form-group">
              <label for="email"><i class="fa fa-envelope"></i> 이메일</label>
              <input type="email" class="form-control" id="email" name="email" value="${member.email}" required>
          </div>

          <div class="form-group">
              <label for="phone"><i class="fa fa-phone"></i> 전화번호</label>
              <input type="text" class="form-control" id="phone" name="phone" value="${member.phone}" required>
          </div>

          <div class="form-group">
              <label for="created_at">가입일</label>
              <input type="text" class="form-control" id="created_at" name="created_at" value="${member.created_at}" readonly>
          </div>

          <div class="form-group">
              <label for="updated_at">최근 수정일</label>
              <input type="text" class="form-control" id="updated_at" name="updated_at" value="${member.updated_at}" readonly>
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

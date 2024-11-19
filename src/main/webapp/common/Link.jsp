<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="shortcut icon" href="../images/favicon.png" type="">
  <title>Feane</title>

  <!-- CSS links -->
  <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/css/nice-select.min.css" integrity="sha512-CruCP+TD3yXzlvvijET8wV5WxxEh5H8P4cmz0RFbKK6FlZ2sYl3AEsKlLPHbniXKSrDdFewhbmBK5skbdsASbQ==" crossorigin="anonymous">
  <link href="../css/font-awesome.min.css" rel="stylesheet">
  <link href="../css/style.css" rel="stylesheet">
  <link href="../css/responsive.css" rel="stylesheet">
</head>

<body class="sub_page">
  <div class="hero_area">
    <div class="bg-box">
      <img src="../images/hero-bg.jpg" alt="">
    </div>
    <!-- 헤더 섹션 -->
    <header class="header_section">
      <div class="container">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="../index.jsp">
            <span>Feane</span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
            <span class=""></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto">
              <li class="nav-item"><a class="nav-link" href="../index.jsp">Home</a></li>
              <li class="nav-item active"><a class="nav-link" href="../menu.jsp">Menu</a></li>
              <li class="nav-item"><a class="nav-link" href="../about.jsp">About</a></li>
              <li class="nav-item"><a class="nav-link" href="../book.jsp">Book Table</a></li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="boardDropdown" data-toggle="dropdown">게시판</a>
                <div class="dropdown-menu">
                  <a class="dropdown-item" href="../board/freeBoard.jsp">자유게시판</a>
                  <a class="dropdown-item" href="../board/qnaBoard.jsp">Q&A게시판</a>
                  <a class="dropdown-item" href="../board/resourceBoard.jsp">자료게시판</a>
                </div>
              </li>
            </ul>
            <div class="user_option">
              <a href="" class="user_link"><i class="fa fa-user"></i></a>
              <a class="cart_link" href="#"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 456.029 456.029"></svg></a>
              <form class="form-inline"><button class="btn nav_search-btn"><i class="fa fa-search"></i></button></form>
              <a href="" class="order_online">Order Online</a>
            </div>
          </div>
        </nav>
      </div>
    </header>
  </div>

  <!-- 메인 콘텐츠 영역 -->
<div class="content_section">
  <c:import url="${contentPage}" />
</div>

  <!-- 푸터 섹션 -->
  <footer class="footer_section">
    <div class="container">
      <div class="row">
        <div class="col-md-4 footer-col">
          <h4>Contact Us</h4>
          <div class="contact_link_box">
            <a href=""><i class="fa fa-map-marker"></i>Location</a>
            <a href=""><i class="fa fa-phone"></i>Call +01 1234567890</a>
            <a href=""><i class="fa fa-envelope"></i>demo@gmail.com</a>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <a href="" class="footer-logo">Feane</a>
          <p>Necessary, making this the first true generator on the Internet.</p>
          <div class="footer_social">
            <a href=""><i class="fa fa-facebook"></i></a>
            <a href=""><i class="fa fa-twitter"></i></a>
            <a href=""><i class="fa fa-linkedin"></i></a>
            <a href=""><i class="fa fa-instagram"></i></a>
            <a href=""><i class="fa fa-pinterest"></i></a>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <h4>Opening Hours</h4>
          <p>Everyday</p>
          <p>10.00 Am - 10.00 Pm</p>
        </div>
      </div>
      <div class="footer-info">
        <p>&copy; <span id="displayYear"></span> All Rights Reserved By Free Html Templates</p>
      </div>
    </div>
  </footer>

  <!-- JS scripts -->
  <script src="../js/jquery-3.4.1.min.js"></script>
  <script src="../js/bootstrap.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <script src="../js/custom.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY&callback=myMap"></script>
</body>
</html>

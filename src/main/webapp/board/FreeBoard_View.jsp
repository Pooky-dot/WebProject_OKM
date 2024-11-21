<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="">

  <title>어딜강 - 자유게시판 상세 보기</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css" />

  <!-- font awesome style -->
  <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" />

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet" />

  <!-- 게시판 스타일 추가 -->
  <style>
      .content_section {
          background-color: #ffffff;
          padding: 30px;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
          margin-bottom: 30px;
          width: 90%;
          margin: auto;
          border-radius: 10px;
      }

      h2 {
          color: #333;
          margin-top: 20px;
          text-align: center;
          font-weight: bold;
          font-size: 1.8em;
      }

      .table-responsive {
          margin-top: 20px;
      }

      table {
          width: 100%;
          border-collapse: collapse;
          background-color: white;
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
          border-radius: 10px;
          overflow: hidden;
      }

      table th, table td {
          border: 1px solid #ddd;
          padding: 15px;
          text-align: center;
      }

      table th {
          background-color: #007bff;
          color: white;
          font-weight: bold;
      }

      table tr:nth-child(even) {
          background-color: #f9f9f9;
      }

      table td {
          text-align: left;
      }

      .bottom-menu {
          display: flex;
          justify-content: center;
          gap: 15px;
          margin-top: 20px;
      }

      .bottom-menu button {
          padding: 10px 20px;
          border: none;
          background-color: #007bff;
          color: white;
          border-radius: 5px;
          cursor: pointer;
          transition: background-color 0.3s;
      }

      .bottom-menu button:hover {
          background-color: #0056b3;
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
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/board/freeboard.do">자유게시판</a>
                  <a class="dropdown-item" href="${pageContext.request.contextPath}/board/qnaboard.jsp">Q&A게시판</a>
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

  <!-- Content Section: 게시판 상세보기 -->
  <div class="content_section container">
    <h2>자유게시판</h2>

    <div class="table-responsive">
      <table>
        <colgroup>
          <col width="20%" />
          <col width="80%" />
        </colgroup>
        <tr>
          <th>번호</th>
          <td>${dto.idx}</td>
        </tr>
        <tr>
          <th>작성자</th>
          <td>${dto.name}</td>
        </tr>
        <tr>
          <th>작성일</th>
          <td>${dto.postdate}</td>
        </tr>
        <tr>
          <th>조회수</th>
          <td>${dto.visitcount}</td>
        </tr>
        <tr>
          <th>제목</th>
          <td>${dto.title}</td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
              <div style="width: 90%; min-height: 150px; padding: 10px; border: 1px solid #ddd; background-color: #f9f9f9;">
                  ${dto.content}
              </div>
          </td>
        </tr>
      </table>
    </div>

    <!-- 하단 메뉴(버튼) -->
    <div class="bottom-menu">
      <button type="button" onclick="location.href='../board/freeboardedit.do?idx=${param.idx}';">
        수정하기
      </button>
      <button type="button" onclick="deleteConfirm(${param.idx});">
        삭제하기
      </button>
      <button type="button" onclick="location.href='../board/freeboard.do';">
        목록 바로가기
      </button>
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
              <a href=""><i class="fa fa-map-marker" aria-hidden="true"></i><span>Location</span></a>
              <a href=""><i class="fa fa-phone" aria-hidden="true"></i><span>Call +01 1234567890</span></a>
              <a href=""><i class="fa fa-envelope" aria-hidden="true"></i><span>demo@gmail.com</span></a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <div class="footer_detail">
            <a href="" class="footer-logo">Feane</a>
            <p>Necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with</p>
            <div class="footer_social">
              <a href=""><i class="fa fa-facebook" aria-hidden="true"></i></a>
              <a href=""><i class="fa fa-twitter" aria-hidden="true"></i></a>
              <a href=""><i class="fa fa-linkedin" aria-hidden="true"></i></a>
              <a href=""><i class="fa fa-instagram" aria-hidden="true"></i></a>
              <a href=""><i class="fa fa-pinterest" aria-hidden="true"></i></a>
            </div>
          </div>
        </div>
        <div class="col-md-4 footer-col">
          <h4>Opening Hours</h4>
          <p>Everyday</p>
          <p>10.00 Am -10.00 Pm</p>
        </div>
      </div>
      <div class="footer-info">
        <p>&copy; <span id="displayYear"></span> All Rights Reserved By <a href="https://html.design/">Free Html Templates</a><br><br>
          &copy; <span id="displayYear"></span> Distributed By <a href="https://themewagon.com/" target="_blank">ThemeWagon</a></p>
      </div>
    </div>
  </footer>
  <!-- footer section -->

  <!-- jQuery -->
  <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
  <!-- popper js -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <!-- bootstrap js -->
  <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
  <!-- owl slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
  <!-- isotope js -->
  <script src="https://unpkg.com/isotope-layout@3.0.4/dist/isotope.pkgd.min.js"></script>
  <!-- nice select -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-nice-select/1.1.0/js/jquery.nice-select.min.js"></script>
  <!-- custom js -->
  <script src="${pageContext.request.contextPath}/js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
  <!-- End Google Map -->

  <script>
    let deleteConfirm = (idx) => {
      if (confirm('삭제하겠습니까?'))
        location.href = '../board/freeboarddelete.do?idx=' + idx;
    }
  </script>

</body>

</html>

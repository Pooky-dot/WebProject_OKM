<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>파일 첨부형 게시판</title>
  <style>
    /* 전체 컨테이너 스타일 */
    .board-container {
      font-family: Arial, sans-serif;
      max-width: 1000px;
      margin: 30px auto;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      background-color: #f9f9f9;
    }
    .board-container h2 {
      text-align: center;
      color: #333;
      margin-bottom: 20px;
    }
    /* 테이블 스타일 */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 10px;
    }
    th, td {
      padding: 10px;
      border: 1px solid #ddd;
      text-align: center;
    }
    th {
      background-color: #f1f1f1;
    }
    tr:nth-child(even) {
      background-color: #f9f9f9;
    }
    /* 페이지 번호와 글쓰기 버튼 스타일 */
    .pagination {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-top: 20px;
    }
    .pagination button {
      background-color: #28a745;
      color: #fff;
      border: none;
      border-radius: 4px;
      padding: 8px 12px;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .pagination button:hover {
      background-color: #218838;
    }
    /* 검색 폼 스타일 */
    .search-form {
      display: flex;
      justify-content: center;
      margin-top: 20px;
    }
    .search-form select,
    .search-form input[type="text"],
    .search-form input[type="submit"] {
      padding: 8px;
      border: 1px solid #ddd;
      border-radius: 4px;
      margin-right: 8px;
    }
    .search-form input[type="submit"] {
      background-color: #007bff;
      color: #fff;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .search-form input[type="submit"]:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="board-container">
    <h2>자유게시판</h2>

    <!-- 목록 테이블 -->
    <table>
      <tr>
        <th width="10%">번호</th>
        <th width="*">제목</th>
        <th width="15%">작성자</th>
        <th width="10%">조회수</th>
        <th width="15%">작성일</th>
        <th width="8%">첨부</th>
      </tr>
      <!-- 게시물이 없을 때 -->
      <tr>
        <td colspan="6">등록된 게시물이 없습니다^^*</td>
      </tr>
      <!-- 출력할 게시물이 있을 때 -->
      <tr>
        <td>100</td>
        <td align="left">제목</td>
        <td>이름</td>
        <td>99</td>
        <td>작성일</td>
        <td>[Down]</td>
      </tr>
    </table>

    <!-- 페이지 번호 및 글쓰기 버튼 -->
    <div class="pagination">
      <div>페이지번호출력</div>
      <button type="button" onclick="location.href='../board/write.do';">글쓰기</button>
    </div>

    <!-- 검색 폼 -->
    <form method="get" class="search-form">
      <select name="searchField">
        <option value="title">제목</option>
        <option value="content">내용</option>
        <option value="name">작성자</option>
      </select>
      <input type="text" name="searchWord" placeholder="검색어 입력" />
      <input type="submit" value="검색" />
    </form>
  </div>
</body>
</html>

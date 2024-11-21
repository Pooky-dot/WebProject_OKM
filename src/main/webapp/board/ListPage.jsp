<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 게시판</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
    h2 {
        color: #333;
        margin-top: 20px;
    }
    .search-form {
        display: flex;
        justify-content: center;
        margin-bottom: 20px;
    }
    .search-form select, .search-form input[type="text"] {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin-right: 10px;
    }
    .search-form input[type="submit"] {
        padding: 10px 20px;
        border: none;
        background-color: #007bff;
        color: white;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .search-form input[type="submit"]:hover {
        background-color: #0056b3;
    }
    table {
        width: 90%;
        border-collapse: collapse;
        margin-bottom: 20px;
        background-color: white;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    table th, table td {
        border: 1px solid #ddd;
        padding: 15px;
        text-align: center;
    }
    table th {
        background-color: #007bff;
        color: white;
    }
    table tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    table a {
        color: #007bff;
        text-decoration: none;
        transition: color 0.3s;
    }
    table a:hover {
        color: #0056b3;
    }
    .bottom-menu {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 90%;
        margin-top: 20px;
    }
    .bottom-menu button {
        padding: 10px 20px;
        border: none;
        background-color: #28a745;
        color: white;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .bottom-menu button:hover {
        background-color: #218838;
    }
    .footer {
        width: 90%;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-top: 20px;
    }
</style>
</head>
<body>
	
    <jsp:include page="../common/Link.jsp" />
	<h2>자료실 게시판</h2>
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
    <c:choose>    
        <c:when test="${ empty boardLists }">
            <tr>
                <td colspan="6" align="center">
                    등록된 게시물이 없습니다^^*
                </td>
            </tr>
        </c:when>
        
        <c:otherwise>
            <c:forEach items="${ boardLists }" var="row" varStatus="loop">    
            <tr>
                <td>
                    ${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}   
                </td>
                <td align="left">
                    <a href="../board/view.do?idx=${ row.idx }">
                        ${ row.title }</a> 
                </td> 
                <td>${ row.username }</td>
                <td>${ row.visitcount }</td>
                <td>${ row.postdate }</td>
                <td>
                <c:if test="${ not empty row.ofile }">
                    <a href="../board/download.do?ofile=${ row.ofile }&sfile=${ row.sfile }&idx=${ row.idx }">[Down]</a>
                </c:if>
                </td>
            </tr>
            </c:forEach>        
        </c:otherwise>    
    </c:choose>
    </table>    
    
    <!-- 하단 메뉴(페이징, 글쓰기) -->
    <div class="bottom-menu">
        <div>
            ${ map.pagingImg }
        </div>
        <button type="button" onclick="location.href='../board/write.do';">
            글쓰기
        </button>
    </div>

    <!-- 제목 및 검색 폼을 하단에 위치 -->
    <div class="footer">
        <!-- 검색 폼 -->
        <form method="get" class="search-form">  
            <select name="searchField">
                <option value="title">제목</option>
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" placeholder="검색어를 입력하세요" />
            <input type="submit" value="검색하기" />
        </form>
    </div>
</body>
</html>

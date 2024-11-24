<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>질문 목록</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <h2>질문 목록</h2>
    <div class="search-box">
        <form action="${pageContext.request.contextPath}/qnaBoard/qnaPostList.do" method="get">
            <select name="searchField">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="username">작성자</option>
            </select>
            <input type="text" name="searchWord" value="${param.searchWord}" placeholder="검색어 입력">
            <input type="submit" value="검색">
        </form>
    </div>

    <table class="table">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="post" items="${postList}">
                <tr>
                    <td>${post.idx}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/qnaBoard/qnaPostView.do?idx=${post.idx}">
                            ${post.title}
                        </a>
                    </td>
                    <td>${post.username}</td>
                    <td>${post.postdate}</td>
                    <td>${post.visitcount}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="buttons">
        <a href="${pageContext.request.contextPath}/qnaBoard/qnaPostWrite.do">
            <button>질문하기</button>
        </a>
    </div>
</body>
</html>

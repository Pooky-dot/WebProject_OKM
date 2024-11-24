<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>질문 보기</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <h2>질문 상세 보기</h2>
    <table class="table">
        <tr>
            <th>제목</th>
            <td>${dto.title}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${dto.username}</td>
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
            <th>내용</th>
            <td>${dto.content}</td>
        </tr>
    </table>

    <div class="buttons">
        <c:if test="${sessionScope.UserId == dto.username}">
            <a href="${pageContext.request.contextPath}/qnaBoard/qnaPostEdit.do?idx=${dto.idx}"><button>수정</button></a>
            <a href="${pageContext.request.contextPath}/qnaBoard/qnaPostDelete.do?idx=${dto.idx}" onclick="return confirm('정말 삭제하시겠습니까?');"><button>삭제</button></a>
        </c:if>
        <a href="${pageContext.request.contextPath}/qnaBoard/qnaPostList.do"><button>목록으로</button></a>
    </div>

    <h3>답변 목록</h3>
    <table class="table">
        <thead>
            <tr>
                <th>작성자</th>
                <th>내용</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="answer" items="${answerList}">
                <tr>
                    <td>${answer.username}</td>
                    <td>${answer.content}</td>
                    <td>${answer.postdate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <h3>답변 작성</h3>
    <form action="${pageContext.request.contextPath}/qnaBoard/qnaAnswerWrite.do" method="post">
        <input type="hidden" name="postId" value="${dto.idx}">
        <textarea name="content" rows="5" style="width: 90%;"></textarea><br>
        <input type="submit" value="답변 등록">
    </form>
</body>
</html>

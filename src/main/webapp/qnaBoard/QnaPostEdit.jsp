<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>질문 수정</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script>
        function validateForm() {
            if (document.editForm.title.value.trim() == "") {
                alert("제목을 입력하세요.");
                document.editForm.title.focus();
                return false;
            }
            if (document.editForm.content.value.trim() == "") {
                alert("내용을 입력하세요.");
                document.editForm.content.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <h2>질문 수정</h2>
    <form name="editForm" action="${pageContext.request.contextPath}/qnaBoard/qnaPostEdit.do" method="post" onsubmit="return validateForm();">
        <input type="hidden" name="idx" value="${dto.idx}">
        <input type="hidden" name="username" value="${dto.username}">
        <table class="table">
            <tr>
                <th>작성자</th>
                <td>${dto.username}</td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" value="${dto.title}" style="width: 90%;"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" rows="10" style="width: 90%;">${dto.content}</textarea></td>
            </tr>
        </table>
        <div class="buttons">
            <input type="submit" value="수정 완료">
            <input type="button" value="취소" onclick="history.back();">
        </div>
    </form>
</body>
</html>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>질문 작성</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
    <script>
        function validateForm() {
            if (document.writeForm.title.value.trim() == "") {
                alert("제목을 입력하세요.");
                document.writeForm.title.focus();
                return false;
            }
            if (document.writeForm.content.value.trim() == "") {
                alert("내용을 입력하세요.");
                document.writeForm.content.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <h2>질문 작성</h2>
    <form name="writeForm" action="${pageContext.request.contextPath}/qnaBoard/qnaPostWrite.do" method="post" onsubmit="return validateForm();">
        <table class="table">
            <tr>
                <th>제목</th>
                <td><input type="text" name="title" style="width: 90%;"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea name="content" rows="10" style="width: 90%;"></textarea></td>
            </tr>
        </table>
        <div class="buttons">
            <input type="submit" value="작성 완료">
            <input type="button" value="취소" onclick="history.back();">
        </div>
    </form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<h2>자유 게시판 - 글쓰기(Write)</h2>
<script type="text/javascript">
    function validateForm(form) {  // 필수 항목 입력 확인
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.content.value == "") {
            alert("내용을 입력하세요.");
            form.content.focus();
            return false;
        }
    }
</script>
<form name="writeFrm" method="post" action="../board/write.do" onsubmit="return validateForm(this);">
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width:90%;" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="content" style="width:90%;height:100px;"></textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">RESET</button>
                <button type="button" onclick="location.href='../board/list.do';">목록 바로가기</button>
            </td>
        </tr>
    </table>
</form>

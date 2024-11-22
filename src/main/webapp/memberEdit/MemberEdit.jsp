<!-- MemberEdit.jsp -->
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>회원 정보 수정</title>
</head>
<body>
    <h2>회원 정보 수정</h2>
    <form action="/membership/MemberEditController.do" method="post">
        <input type="hidden" name="username" value="${sessionScope.username}">
        
        <label>비밀번호: <input type="password" name="password" value="${member.password}" required></label><br>
        <label>이름: <input type="text" name="name" value="${member.name}" required></label><br>
        <label>이메일: <input type="email" name="email" value="${member.email}" required></label><br>
        <label>전화번호: <input type="text" name="phone" value="${member.phone}" required></label><br>
        
        <button type="submit">수정하기</button>
    </form>
</body>
</html>

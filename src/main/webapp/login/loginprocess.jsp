<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="common.DBConnPool" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 처리</title>
</head>
<body>
    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // DB 연결
        DBConnPool db = new DBConnPool();

        try {
            // 사용자 검증 쿼리
            String query = "SELECT * FROM users WHERE username = ? AND password = ?";
            db.psmt = db.con.prepareStatement(query);
            db.psmt.setString(1, username);
            db.psmt.setString(2, password);
            db.rs = db.psmt.executeQuery();

            if (db.rs.next()) {
                out.println("<p>로그인 성공!</p>");
                // 로그인 성공 시 세션 설정 등을 추가할 수 있어
                session.setAttribute("username", username);
                // 메인 페이지로 리다이렉트
                response.sendRedirect("index.jsp");
            } else {
                out.println("<p>로그인 실패! 아이디나 비밀번호를 확인하세요.</p>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>로그인 중 오류 발생: " + e.getMessage() + "</p>");
        } finally {
            db.close();
        }
    %>
</body>
</html>

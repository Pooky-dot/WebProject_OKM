<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="common.DBConnPool" %>

<%
    String username = request.getParameter("username");
    String message = "";

    DBConnPool dbPool = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        dbPool = new DBConnPool(); // DBConnPool 인스턴스를 통해 커넥션 얻기
        String sql = "SELECT COUNT(*) FROM users WHERE username = ?";
        pstmt = dbPool.con.prepareStatement(sql);
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            int count = rs.getInt(1);
            if (count > 0) {
                message = "이미 사용중인 아이디입니다.";
            } else {
                message = "사용 가능한 아이디입니다.";
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        message = "오류가 발생했습니다. 다시 시도해주세요.";
    } finally {
        // DBConnPool의 close() 메서드를 사용해 자원 반납
        if (dbPool != null) {
            dbPool.close();
        }
    }

    // 세션에 메시지를 저장하고 다시 회원가입 페이지로 이동
    session.setAttribute("duplicateMessage", message);
    response.sendRedirect("signup.jsp");
%>

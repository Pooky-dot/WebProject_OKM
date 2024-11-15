package common;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public JDBConnect() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "webproject_db";
			String pwd = "1234";
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(기본 생성자");
			
		}
		catch (Exception e) {
			e.printStackTrace();
	}

}
	public void close() {
		try {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	  }
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, id, pwd);
			//Connection 인스턴스가 반환되면 연결 성공
			System.out.println("DB 연결 성공(인수생성자 1)");
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}

	}
	public JDBConnect(ServletContext application) {
		try {
			/*
			 내장객체를 매개변수를 통해 전달받았으므로 Java클래스 내에서 web,xml을 접근할 수 있다.
			 그러면 JSP에서 DB연결을 위해 반복적으로 사용했던 코드를 줄일 수 있다.
			  */
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			con = DriverManager.getConnection(url, id, pwd);
			
			System.out.println("DB 연결 성공(인수 생성자2)");
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

	}


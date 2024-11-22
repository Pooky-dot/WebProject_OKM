package membership;

import membership.MemberDTO;
import common.JDBConnect;
import jakarta.servlet.ServletContext;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/*
DAO(Data Access Object)
: 실제 데이터베이스에 접근하여 기본적인 CRUD 작업을 하기위한 객체이다. 
DB접속 및 select와 같은 쿼리문을 실행한 후 결과를 반환받아 처리하는
기능을 수행한다. 
 */

// JDBC를 위한 클래스를 상속하여 DB에 연결한다.
public class MemberDAO extends JDBConnect {

    // 생성자1 : 드라이버, 커넥션URL 등 4개의 매개변수로 정의
    public MemberDAO(String drv, String url, String id, String pw) {
        // super()를 통해 부모클래스의 생성자를 호출한다.
        super(drv, url, id, pw);
    }

    // 생성자2 : application 내장객체를 매개변수로 정의
    public MemberDAO(ServletContext application) {
        super(application);
    }

    /*
    사용자가 입력한 아이디, 패스워드를 통해 회원테이블을 select한 후
    존재하는 회원정보인 경우 DTO객체에 레코드를 저장한 후 반환한다.
    */
    public MemberDTO getMemberDTO(String uid, String upass) {
        // 회원인증을 위한 쿼리문 실행 후 회원정보를 저장하기 위한 인스턴스 생성
        MemberDTO dto = new MemberDTO();
        /* 로그인 폼에서 입력한 아이디, 패스워드를 통해 인파라미터를
        설정할 수 있도록 쿼리문을 작성 */
        String query = "SELECT * FROM users WHERE username=? AND password=?";

        try {
            // 쿼리문 실행을 위한 prepared 인스턴스 생성
            psmt = con.prepareStatement(query);
            // 쿼리문의 인파라미터 설정(아이디와 비번)
            psmt.setString(1, uid);
            psmt.setString(2, upass);
            // 쿼리문 실행 및 결과는 ResultSet으로 반환받는다.
            rs = psmt.executeQuery();
            // 반환된 ResultSet객체에 정보가 저장되어 있는지 확인한다.
            if (rs.next()) {
                dto.setUsername(rs.getString("username"));
                dto.setPassword(rs.getString("password"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                dto.setPhone(rs.getString("phone"));
                dto.setCreated_at(rs.getDate("created_at"));
                dto.setUpdated_at(rs.getDate("updated_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (psmt != null) psmt.close();
                if (rs != null) rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        // 회원정보를 저장한 DTO객체를 반환한다.
        return dto;
    }

    // 회원가입을 위한 insert 메서드 추가
    public int insertMember(MemberDTO dto) {
        int result = 0;
        PreparedStatement psmt = null;

        String query = "INSERT INTO users (username, password, name, email, phone, created_at, updated_at) " +
                       "VALUES (?, ?, ?, ?, ?, SYSDATE, SYSDATE)";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getUsername());
            psmt.setString(2, dto.getPassword());
            psmt.setString(3, dto.getName());
            psmt.setString(4, dto.getEmail());
            psmt.setString(5, dto.getPhone());

            result = psmt.executeUpdate(); // 실행 후 삽입된 행 수 반환
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (psmt != null) psmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    // 회원정보 수정을 위한 update 메서드 추가
    public int updateMember(MemberDTO dto) {
        int result = 0;
        PreparedStatement psmt = null;

        String query = "UPDATE users SET password=?, name=?, email=?, phone=?, updated_at=SYSDATE WHERE username=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getPassword());
            psmt.setString(2, dto.getName());
            psmt.setString(3, dto.getEmail());
            psmt.setString(4, dto.getPhone());
            psmt.setString(5, dto.getUsername());

            result = psmt.executeUpdate(); // 실행 후 수정된 행 수 반환
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (psmt != null) psmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
    }
    
    public MemberDTO getMemberDTO(String uid) {
        // 회원 정보를 저장하기 위한 인스턴스 생성
        MemberDTO dto = new MemberDTO();
        
        // 사용자 ID로 회원 정보를 조회하는 쿼리 작성
        String query = "SELECT * FROM users WHERE username=?";

        try {
            // 쿼리문 실행을 위한 prepared 인스턴스 생성
            psmt = con.prepareStatement(query);
            psmt.setString(1, uid);
            
            // 쿼리문 실행 및 결과는 ResultSet으로 반환받는다.
            rs = psmt.executeQuery();
            
            // 반환된 ResultSet객체에 정보가 저장되어 있는지 확인한다.
            if (rs.next()) {
                dto.setUsername(rs.getString("username"));
                dto.setPassword(rs.getString("password"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                dto.setPhone(rs.getString("phone"));
                dto.setCreated_at(rs.getDate("created_at"));
                dto.setUpdated_at(rs.getDate("updated_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (psmt != null) psmt.close();
                if (rs != null) rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        // 회원정보를 저장한 DTO객체를 반환한다.
        return dto;
    }
}

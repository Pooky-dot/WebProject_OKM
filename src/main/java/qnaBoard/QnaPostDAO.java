package qnaBoard;

import java.util.List;
import java.util.Map;
import java.util.Vector;
import common.DBConnPool;

public class QnaPostDAO extends DBConnPool {

    public QnaPostDAO() {
        super();
    }

    // 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM qna_posts";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            rs.next();
            totalCount = rs.getInt(1);
        } catch (Exception e) {
            System.out.println("게시물 카운트 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount;
    }

    // 검색 조건에 맞는 게시물 목록을 반환합니다(페이징 기능 지원).
    public List<QnaPostDTO> selectList(Map<String, Object> map) {
        List<QnaPostDTO> board = new Vector<QnaPostDTO>();
        String query = "SELECT * FROM qna_posts ";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField")
                   + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY idx DESC ";

        try {
            psmt = con.prepareStatement(query);
            rs = psmt.executeQuery();
            while (rs.next()) {
                QnaPostDTO dto = new QnaPostDTO();

                dto.setIdx(rs.getInt(1));
                dto.setUsername(rs.getString(2));
                dto.setTitle(rs.getString(3));
                dto.setContent(rs.getString(4));
                dto.setPostdate(rs.getDate(5));
                dto.setVisitcount(rs.getInt(6));
                dto.setName(rs.getString(7));

                board.add(dto);
            }
        } catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return board;
    }

 // 게시물 작성 메서드
    public int insertPost(QnaPostDTO dto) {
        int result = 0;
        try {
            String query = "INSERT INTO qna_posts ( "
                         + " idx, username, title, content, postdate, visitcount, name) "
                         + " VALUES (qna_post_seq.NEXTVAL, ?, ?, ?, SYSDATE, 0, ?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getUsername());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());
            psmt.setString(4, dto.getName());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }

    // 주어진 일련번호에 해당하는 게시물을 DTO에 담아 반환합니다.
    public QnaPostDTO selectView(int idx) {
        QnaPostDTO dto = new QnaPostDTO();  // DTO 객체 생성
        String query = "SELECT * FROM qna_posts WHERE idx=?";
        try {
            psmt = con.prepareStatement(query);  // 쿼리문 준비
            psmt.setInt(1, idx);  // 인파라미터 설정
            rs = psmt.executeQuery();  // 쿼리문 실행

            if (rs.next()) {  // 결과를 DTO 객체에 저장
                dto.setIdx(rs.getInt(1));
                dto.setUsername(rs.getString(2));
                dto.setTitle(rs.getString(3));
                dto.setContent(rs.getString(4));
                dto.setPostdate(rs.getDate(5));
                dto.setVisitcount(rs.getInt(6));
                dto.setName(rs.getString(7));
            }
        } catch (Exception e) {
            System.out.println("게시물 상세보기 중 예외 발생");
            e.printStackTrace();
        }
        return dto;  // 결과 반환
    }

    // 주어진 일련번호에 해당하는 게시물의 조회수를 1 증가시킵니다.
    public void updateVisitCount(int idx) {
        String query = "UPDATE qna_posts SET visitcount = visitcount + 1 WHERE idx=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setInt(1, idx);
            psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("게시물 조회수 증가 중 예외 발생");
            e.printStackTrace();
        }
    }

    // 지정한 일련번호의 게시물을 삭제합니다.
    public int deletePost(int idx) {
        int result = 0;
        try {
            String query = "DELETE FROM qna_posts WHERE idx=?";
            psmt = con.prepareStatement(query);
            psmt.setInt(1, idx);
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("게시물 삭제 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }

    // 게시글 데이터를 받아 DB에 저장되어 있던 내용을 갱신합니다.
    public int updatePost(QnaPostDTO dto) {
        int result = 0;
        try {
            String query = "UPDATE qna_posts SET title=?, content=? WHERE idx=? AND username=?";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setInt(3, dto.getIdx());
            psmt.setString(4, dto.getUsername());
            result = psmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("게시물 수정 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
}

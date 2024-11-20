package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import board.BoardDTO;

public class BoardDAO extends DBConnPool {
    public BoardDAO() {
        super();
    }

    // 검색 조건에 맞는 게시물의 개수를 반환합니다.
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0;
        String query = "SELECT COUNT(*) FROM posts";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                   + " LIKE '%" + map.get("searchWord") + "%'";
        }
        try {
            stmt = con.createStatement();
            rs = stmt.executeQuery(query);
            if (rs.next()) {
                totalCount = rs.getInt(1);
            }
        }
        catch (Exception e) {
            System.out.println("게시물 카운트 중 예외 발생");
            e.printStackTrace();
        }
        return totalCount;
    }
    
    // 게시물 목록을 조회합니다.
    public List<BoardDTO> selectList(Map<String,Object> map) {
        List<BoardDTO> board = new Vector<BoardDTO>();

        String query = "SELECT * FROM posts";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField")
                    + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY post_id DESC ";  // post_id 기준으로 내림차순 정렬

        try {
            psmt = con.prepareStatement(query);
            rs = psmt.executeQuery();

            while (rs.next()) {
                BoardDTO dto = new BoardDTO();
                dto.setPost_Id(rs.getString("post_id"));
                dto.setUsername(rs.getString("username"));
                dto.setBoard_Type(rs.getString("board_type"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setView_Count(rs.getInt("view_count"));
                dto.setCreated_At(rs.getDate("created_at"));
                dto.setUpdated_At(rs.getDate("updated_at"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setIdx(rs.getLong("idx"));
                dto.setDowncount(rs.getInt("downcount"));

                board.add(dto);
            }
        }
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return board;
    }
    
    // 게시글 데이터를 받아 DB에 추가합니다.
    public int insertWrite(BoardDTO dto) {
        int result = 0;
        try {
            String query = "INSERT INTO posts ( "
                         + " post_id, board_type, username, title, content, created_at) "
                         + " VALUES ( "
                         + " ?, ?, ?, ?, ?, SYSDATE)";
            psmt = con.prepareStatement(query);
            
            // PreparedStatement에 파라미터 설정
            psmt.setString(1, dto.getPost_Id());   // post_id 설정
            psmt.setString(2, dto.getBoard_Type()); // board_type 설정
            psmt.setString(3, dto.getUsername());  // username 설정
            psmt.setString(4, dto.getTitle());     // title 설정
            psmt.setString(5, dto.getContent());   // content 설정

            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
}

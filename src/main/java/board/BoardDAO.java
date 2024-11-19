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
            rs.next();
            totalCount = rs.getInt(1);
        }
        catch (Exception e) {
            System.out.println("게시물 카운트 중 예외 발생");
            e.printStackTrace();
        }

        return totalCount;
    }
    
    public List<BoardDTO> selectList(Map<String,Object> map) {
		//오라클에서 인출한 레코드를 저장하기 위한 List 생성
		List<BoardDTO> board = new Vector<BoardDTO>();
		
		//레코드 인출을 위한 쿼리문 작성
		String query = "SELECT * FROM board";
		//검색어 입력 여부에 따라서 where절은 조건부로 추가됨
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField")
					+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
		//일련번호의 내림차순으로 정렬한 후 인출한다.
		query += " ORDER BY idx DESC ";
				
		try {
			//prepareStatement 인스턴스생성
			psmt = con.prepareStatement(query);
			//쿼리문 실행 및 결과반환(ResultSet)
			rs = psmt.executeQuery();

            while (rs.next()) {
            	BoardDTO dto = new BoardDTO();

                dto.setPost_Id(rs.getLong(1));
                dto.setUsername(rs.getString(2));
                dto.setBoard_Type(rs.getString(3));
                dto.setTitle(rs.getString(4));
                dto.setContent(rs.getString(5));
                dto.setView_Count(rs.getInt(6));
                dto.setCreated_At(rs.getDate(7));
                dto.setUpdated_At(rs.getDate(8));
                dto.setOfile(rs.getString(9));
                dto.setSfile(rs.getString(10));
                dto.setIdx(rs.getLong(11));
                dto.setDowncount(rs.getInt(12));

                board.add(dto);
            }
        }
        catch (Exception e) {
            System.out.println("게시물 조회 중 예외 발생");
            e.printStackTrace();
        }
        return board;
    }
    
    // 게시글 데이터를 받아 DB에 추가합니다(파일 업로드 지원).
    public int insertWrite(BoardDTO dto) {
        int result = 0;
        try {
            String query = "INSERT INTO board ( "
                         + " idx, username, title, content) "
                         + " VALUES ( "
                         + " seq_board_num.NEXTVAL,?,?,?)";
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getUsername());
            psmt.setString(2, dto.getTitle());
            psmt.setString(3, dto.getContent());

            result = psmt.executeUpdate();
        }
        catch (Exception e) {
            System.out.println("게시물 입력 중 예외 발생");
            e.printStackTrace();
        }
        return result;
    }
	
	
}

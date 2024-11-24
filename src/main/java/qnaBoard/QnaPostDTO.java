package qnaBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

// QnaPostDTO 클래스
public class QnaPostDTO {
	 private int idx; // 테이블에서 NUMBER 타입과 매칭
	    private String username; // VARCHAR2와 매칭
	    private String title; // VARCHAR2와 매칭
	    private String content; // CLOB와 매칭
	    private Date postdate; // DATE와 매칭
	    private int visitcount; // NUMBER와 매칭
	    private String name; // VARCHAR2와 매칭
		public int getIdx() {
			return idx;
		}
		public void setIdx(int idx) {
			this.idx = idx;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public Date getPostdate() {
			return postdate;
		}
		public void setPostdate(Date postdate) {
			this.postdate = postdate;
		}
		public int getVisitcount() {
			return visitcount;
		}
		public void setVisitcount(int visitcount) {
			this.visitcount = visitcount;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}

    // Getters and Setters
  
}

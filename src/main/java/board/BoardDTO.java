package board;

import java.util.Date;

public class BoardDTO {
    private Long post_Id;      // 게시글 ID
    private String username;  // 작성자
    private String board_Type; // 게시판 유형 (예: 자유게시판, Q&A 게시판, 자료실 등)
    private String title;     // 게시글 제목
    private String content;   // 게시글 내용
    private int view_Count;    // 조회수
    private Date created_At;   // 작성일
    private Date updated_At;   // 수정일
    private String ofile;     // 원본 파일명
    private String sfile;     // 저장된 파일명
    private long idx;
    private int downcount;
	public Long getPost_Id() {
		return post_Id;
	}
	public void setPost_Id(Long post_Id) {
		this.post_Id = post_Id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBoard_Type() {
		return board_Type;
	}
	public void setBoard_Type(String board_Type) {
		this.board_Type = board_Type;
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
	public int getView_Count() {
		return view_Count;
	}
	public void setView_Count(int view_Count) {
		this.view_Count = view_Count;
	}
	public Date getCreated_At() {
		return created_At;
	}
	public void setCreated_At(Date created_At) {
		this.created_At = created_At;
	}
	public Date getUpdated_At() {
		return updated_At;
	}
	public void setUpdated_At(Date updated_At) {
		this.updated_At = updated_At;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public long getIdx() {
		return idx;
	}
	public void setIdx(long idx) {
		this.idx = idx;
	}
	public int getDowncount() {
		return downcount;
	}
	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}
    
}


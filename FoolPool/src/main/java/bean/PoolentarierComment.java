package bean;

import java.util.Date;

public class PoolentarierComment {
	private Integer commentNo;
	private Date commentDate;
	private String commentContent;
	private String writerId;
	private String writerNickname;
	private Integer postNo;
	
	public PoolentarierComment() {
		
	}
	
	public PoolentarierComment(Integer commentNo, Date commentDate, String commentContent,
			String writerId, String writerNickname, Integer postNo) {
		this.commentNo = commentNo;
		this.commentDate = commentDate;
		this.commentContent = commentContent;
		this.writerId = writerId;
		this.writerNickname = writerNickname;
		this.postNo = postNo;
	}

	public Integer getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(Integer commentNo) {
		this.commentNo = commentNo;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getWriterId() {
		return writerId;
	}

	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}

	public String getWriterNickname() {
		return writerNickname;
	}

	public void setWriterNickname(String writerNickname) {
		this.writerNickname = writerNickname;
	}

	public Integer getPostNo() {
		return postNo;
	}

	public void setPostNo(Integer postNo) {
		this.postNo = postNo;
	}
	
}

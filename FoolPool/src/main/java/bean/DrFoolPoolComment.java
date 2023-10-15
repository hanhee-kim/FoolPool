package bean;

import java.util.Date;

public class DrFoolPoolComment {
	
	// 필드
	private Integer commentNo;
	private Date commentDate;
	private String commentContent;
	private Boolean isPicked;
	private String writerId;
	private String writerNickname;
	private Integer postNo;
	
	// getter, setter
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
	public Boolean getIsPicked() {
		return isPicked;
	}
	public void setIsPicked(Boolean isPicked) {
		this.isPicked = isPicked;
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

	// 메서드
	@Override
	public String toString() {
		return String.format("댓글번호:%d, 댓글작성일: %s, 댓글내용:%s, 채택여부: %s, 댓글작성자아이디: %s, 댓글작성자닉네임: %s, 게시글번호: %d"
				, commentNo, commentDate, commentContent, isPicked==false?"채택안됨":"채택됨", writerId, writerNickname, postNo);
	}
	
	
}

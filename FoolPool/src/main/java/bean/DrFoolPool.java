package bean;

import java.sql.Date;

public class DrFoolPool {
	
	// 필드
	// 필드명 카멜케이스로 작성 후 매퍼xml에서 resultMap사용할것
	private Integer no;
	private String title;
	private Date date;
	private Integer view;
	private String content;
	private String fileName;
	private Boolean isSolved;
	private String writerId;
	private String writerNickname;
	
	// 생성자
//	public DrFoolPool() {}
//	public DrFoolPool(Integer no, String title, Date date, Integer view, String content, String fileName,
//			Boolean isSolved, String writerId, String writerNickname) {
//		this.no = no;
//		this.title = title;
//		this.date = date;
//		this.view = view;
//		this.content = content;
//		this.fileName = fileName;
//		this.isSolved = isSolved;
//		this.writerId = writerId;
//		this.writerNickname = writerNickname;
//	}
	
	// getter, setter
	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Integer getView() {
		return view;
	}
	public void setView(Integer view) {
		this.view = view;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Boolean getIsSolved() {
		return isSolved;
	}
	public void setIsSolved(Boolean isSolved) {
		this.isSolved = isSolved;
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
	
	
	
	@Override
	public String toString() {
		return String.format("글번호:%d, 글제목:%s, 조회수:%d, 파일명: %s, 작성자아이디: %s", no, title, view, fileName, writerId);
	}
	

}

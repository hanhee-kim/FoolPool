package bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
//import java.sql.Date;
import java.util.Date;

public class DrFoolPool {
	
	// 필드
	// 필드명 카멜케이스로 작성 후 매퍼xml에서 resultMap사용할것
	private Integer no;
	private String title;
	private Date date; // java.util.Date
	private Integer view;
	private String content;
	private String fileName;
	private Boolean isSolved;
	private String writerId;
	private String writerNickname;
	
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
	
	// 메서드
	@Override
	public String toString() {
		return String.format("글번호:%d, 글제목:%s, 작성일: %s, 조회수:%d, 내용:%s, 파일명: %s, 작성자아이디: %s, 해결여부: %s", no, title, date, view, content, fileName, writerId, isSolved==false?"미해결":"해결");
	}
	
	
/*
	// Date를 원하는대로 포맷팅된 문자열로 변환하는 메서드
	public Date dateToFormattedString() {
//		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = simpleDateFormat.format(date);
//		return strDate;
		
		Date formattedDate = null;
		try {
			formattedDate = simpleDateFormat.parse(strDate);
		} catch (ParseException e) {
			System.out.println("----DTO의 메서드 에러: String->Date변환 오류");
			e.printStackTrace();
		}
		return formattedDate;
	}
*/	
	
	

}

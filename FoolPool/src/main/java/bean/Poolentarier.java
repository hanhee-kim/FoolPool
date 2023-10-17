package bean;

//import java.sql.Date;
import java.util.Date;

public class Poolentarier {
	private Integer no;
	private String title;
	private Date date;
	private Integer view;
	private String content;
	private String keyword;
	private String fileName;
	private String plantsName;
	private String writerId;
	private String writerNickname;
	
	public Poolentarier() {
		
	}
	
	public Poolentarier(Integer no, String title, Date date, Integer view, String content, String keyword,
			String fileName, String plantsName, String writerId, String writerNickname) {
		this.no = no;
		this.title = title;
		this.date = date;
		this.view = view;
		this.content = content;
		this.keyword = keyword;
		this.fileName = fileName;
		this.plantsName = plantsName;
		this.writerId = writerId;
		this.writerNickname = writerNickname;
	}

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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getPlantsName() {
		return plantsName;
	}

	public void setPlantsName(String plantsName) {
		this.plantsName = plantsName;
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

}

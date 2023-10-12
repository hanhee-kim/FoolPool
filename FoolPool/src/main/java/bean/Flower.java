package bean;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import dao.FlowerDAO;
import dao.FlowerDAOImpl;

public class Flower {

	private Integer dataNo; // 꽃번호
	private Integer fMonth; // 꽃월
	private Integer fDay; // 꽃일
	private String flowNm; // 꽃이름
	private String fSctNm; // 꽃학명
	private String fEngNm; // 꽃영문이름
	private String flowLang; // 꽃말
	private String fContent; // 꽃내용
	private String fUse; // 꽃의 사용
	private String fGrow; // 꽃기르는법
	private String fType; // 꽃 종류
	private String fileName1; // 이미지명 1,
	private String fileName2; // 이미지명 2
	private String fileName3; // 이미지명 3
	private String imgUrl1; // 이미지 URL1
	private String imgUrl2; // 이미지 URL2
	private String imgUrl3; // 이미지 URL3

	public Flower() {};
	public Flower(Integer dataNo,Integer fMonth,Integer fDay,String flowNm,String fSctNm,String fEngNm,String flowLang,String fContent,String fUse,String fGrow,String fType,String fileName1,String fileName2,String fileName3, String imgUrl1,String imgUrl2,String imgUrl3) {
		this.dataNo = dataNo;
		this.fMonth = fMonth;
		this.fDay = fDay;
		this.flowNm = flowNm;
		this.fSctNm = fSctNm;
		this.fEngNm = fEngNm;
		this.flowLang = flowLang;
		this.fContent = fContent;
		this.fUse = fUse;
		this.fGrow = fGrow;
		this.fType = fType;
		this.fileName1 = fileName1;
		this.fileName2 = fileName2;
		this.fileName3 = fileName3;
		this.imgUrl1 = imgUrl1;
		this.imgUrl2 = imgUrl2;
		this.imgUrl3 = imgUrl3;
	}

	@Override
	public String toString() {
		return String.format("%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s", dataNo, fMonth, fDay,
				flowNm, fSctNm, fEngNm, flowLang, fContent, fUse, fGrow, fGrow, fileName1, fileName2, fileName3,
				imgUrl1, imgUrl2, imgUrl3);
	}

	public Integer getDataNo() {
		return dataNo;
	}

	public void setDataNo(Integer dataNo) {
		this.dataNo = dataNo;
	}

	public Integer getfMonth() {
		return fMonth;
	}

	public void setfMonth(Integer fMonth) {
		this.fMonth = fMonth;
	}

	public Integer getfDay() {
		return fDay;
	}

	public void setfDay(Integer fDay) {
		this.fDay = fDay;
	}

	public String getFlowNm() {
		return flowNm;
	}

	public void setFlowNm(String flowNm) {
		this.flowNm = flowNm;
	}

	public String getfSctNm() {
		return fSctNm;
	}

	public void setfSctNm(String fSctNm) {
		this.fSctNm = fSctNm;
	}

	public String getfEngNm() {
		return fEngNm;
	}

	public void setfEngNm(String fEngNm) {
		this.fEngNm = fEngNm;
	}

	public String getFlowLang() {
		return flowLang;
	}

	public void setFlowLang(String flowLang) {
		this.flowLang = flowLang;
	}

	public String getfContent() {
		return fContent;
	}

	public void setfContent(String fContent) {
		this.fContent = fContent;
	}

	public String getfUse() {
		return fUse;
	}

	public void setfUse(String fUse) {
		this.fUse = fUse;
	}

	public String getfGrow() {
		return fGrow;
	}

	public void setfGrow(String fGrow) {
		this.fGrow = fGrow;
	}

	public String getfType() {
		return fType;
	}

	public void setfType(String fType) {
		this.fType = fType;
	}

	public String getFileName1() {
		return fileName1;
	}

	public void setFileName1(String fileName1) {
		this.fileName1 = fileName1;
	}

	public String getFileName2() {
		return fileName2;
	}

	public void setFileName2(String fileName2) {
		this.fileName2 = fileName2;
	}

	public String getFileName3() {
		return fileName3;
	}

	public void setFileName3(String fileName3) {
		this.fileName3 = fileName3;
	}

	public String getImgUrl1() {
		return imgUrl1;
	}

	public void setImgUrl1(String imgUrl1) {
		this.imgUrl1 = imgUrl1;
	}

	public String getImgUrl2() {
		return imgUrl2;
	}

	public void setImgUrl2(String imgUrl2) {
		this.imgUrl2 = imgUrl2;
	}

	public String getImgUrl3() {
		return imgUrl3;
	}

	public void setImgUrl3(String imgUrl3) {
		this.imgUrl3 = imgUrl3;
	}

	

}
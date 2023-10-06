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

	private String dataNo; // 꽃번호
	private String fMonth; // 꽃월
	private String fDay; // 꽃일
	private String flowNm; // 꽃이름
	private String fSctNm; // 꽃학명
	private String fEngNm; // 꽃영문이름
	private String flowLang; // 꽃말
	private String fContent; // 꽃내용
	private String fUse; // 꽃의 사용
	private String fGrow; // 꽃기르는법
	private String fType; // 꽃 종류
	private String fileName1; // 이미지명 1
	private String fileName2; // 이미지명 2
	private String fileName3; // 이미지명 3
	private String imgUrl1; // 이미지 URL1
	private String imgUrl2; // 이미지 URL2
	private String imgUrl3; // 이미지 URL3

	@Override
	public String toString() {
		return String.format("%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s", dataNo, fMonth, fDay,
				flowNm, fSctNm, fEngNm, flowLang, fContent, fUse, fGrow, fGrow, fileName1, fileName2, fileName3,
				imgUrl1, imgUrl2, imgUrl3);
	}

	public String getDataNo() {
		return dataNo;
	}

	public void setDataNo(String dataNo) {
		this.dataNo = dataNo;
	}

	public String getfMonth() {
		return fMonth;
	}

	public void setfMonth(String fMonth) {
		this.fMonth = fMonth;
	}

	public String getfDay() {
		return fDay;
	}

	public void setfDay(String fDay) {
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

	public static void xml_parsing() {
		try {
			File xmlFile = new File(
					"src/main/webapp/static/flower.xml"
					);
//					"C:\\Users\\914gk\\git\\FoolPool\\FoolPool\\src\\main\\webapp\\WEB-INF\\flower.xml"		// XML 파일 경로
//																											// 지정
			// DocumentBuilderFactory 생성
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();

			// XML 파일을 파싱하여 Document 객체 생성
			Document document = builder.parse(xmlFile);

			// <result> 요소 찾기
			Element rootElement = document.getDocumentElement();
			NodeList resultList = rootElement.getElementsByTagName("result");

			List<Flower> flowers = new ArrayList<>();

//			for (int i = 0; i < 3; i++) {	//테스트용으로 3개만 찍어봄
				for (int i = 0; i < resultList.getLength(); i++) {
				Element resultElement = (Element) resultList.item(i);

				// Flower 객체 생성
				Flower flower = new Flower();

				// <result> 요소 안의 모든 하위 태그를 순회하고 데이터를 Flower 객체에 설정
				NodeList childNodes = resultElement.getChildNodes();
//	                -----------------------------------------------

				for (int j = 0; j < childNodes.getLength(); j++) {
					
					org.w3c.dom.Node node = childNodes.item(j);
					if (node.getNodeType() == org.w3c.dom.Node.ELEMENT_NODE) {
						Element element = (Element) node;
						String tagName = element.getTagName();
						String textContent = element.getTextContent();

						// 태그 이름에 따라 데이터를 Flower 객체에 설정
						switch (tagName) {
						case "dataNo":
							flower.setDataNo(textContent);
							break;
						case "fMonth":
							flower.setfMonth(textContent);
							break;
						case "fDay":
							flower.setfDay(textContent);
							break;
						case "flowNm":
							flower.setFlowNm(textContent);
							break;
						case "fSctNm":
							flower.setfSctNm(textContent);
							break;
						case "fEngNm":
							flower.setfEngNm(textContent);
							break;
						case "flowLang":
							flower.setFlowLang(textContent);
							break;
						case "fContent":
							flower.setfContent(textContent);
							break;
						case "fUse":
							flower.setfUse(textContent);
							break;
						case "fGrow":
							flower.setfGrow(textContent);
							break;
						case "fType":
							flower.setfType(textContent);
							break;
						case "fileName1":
							flower.setFileName1(textContent);
							break;
						case "fileName2":
							flower.setFileName2(textContent);
							break;
						case "fileName3":
							flower.setFileName3(textContent);
							break;
						case "imgUrl1":
							flower.setImgUrl1(textContent);
							break;
						case "imgUrl2":
							flower.setImgUrl2(textContent);
							break;
						case "imgUrl3":
							flower.setImgUrl3(textContent);
							break;

						default:
							break;
						}
					}
				}
				// Flower 객체를 리스트에 추가
				flowers.add(flower);
				//db에 저장
//				FlowerDAOImpl fDAO = new FlowerDAOImpl();
//				fDAO.insertFlower(flower);
				
				// 특정 요소 찾기
//				for (Flower flowerQ : flowers) {
//				    String dataNoQ = flowerQ.getDataNo();
//				    System.out.println("dataNo: " + dataNoQ);
//				}
//	                --------------------------------

			}
				for(Flower f : flowers) {
					System.out.println("[" + f.dataNo + "] : [ " + f + " ]");
				}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

//	public static void main(String[] args) {
//		xml_parsing();
//	}
}
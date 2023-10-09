package service;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import bean.Flower;
import dao.FlowerDAO;
import dao.FlowerDAOImpl;

public class FlowerServiceImpl implements FlowerService{
	public void xml_parsing_insert()throws Exception{
		FlowerDAO flowerDao = new FlowerDAOImpl();
//		ClassLoader classLoader = getClass().getClassLoader();
//		File xmlFile = new File(classLoader.getResource("flower.xml").getFile());
			File xmlFile = new File(
					"C:\\Users\\914gk\\git\\FoolPool\\FoolPool\\src\\main\\java\\resource\\flower.xml"		// XML 파일 경로
//					"/FoolPool/src/main/java/resource/flower.xml"
					);
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
				flowerDao.insertFlower(flower);
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
	}

}

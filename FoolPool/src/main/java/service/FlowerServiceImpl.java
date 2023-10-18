package service;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import bean.Flower;
import dao.FlowerDAO;
import dao.FlowerDAOImpl;

public class FlowerServiceImpl implements FlowerService{
	FlowerDAO flowerDao = new FlowerDAOImpl();
	public void xml_parsing_insert()throws Exception{
//		ClassLoader classLoader = getClass().getClassLoader();
//		File xmlFile = new File(classLoader.getResource("flower.xml").getFile());
			File xmlFile = new File(
//					"C:\\Users\\914gk\\git\\FoolPool\\FoolPool\\src\\main\\java\\resource\\flower_api.xml"		// XML 파일 경로
					"C:\\Users\\11027\\Git\\khh-git\\FoolPool\\FoolPool\\src\\main\\java\\resource\\flower_api.xml"
//					"/FoolPool/src/main/java/resource/flower_api.xml"
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
							flower.setDataNo(Integer.parseInt(textContent));
							break;
						case "fMonth":
							
							flower.setfMonth(Integer.parseInt(textContent));
							break;
						case "fDay":
							flower.setfDay(Integer.parseInt(textContent));
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
			}
	}

	@Override
	public Flower searchFlowerByDate(Integer fMonth, Integer fDay) throws Exception {
		Map<String, Integer> param = new HashMap<>();
		param.put("fMonth", fMonth);
		param.put("fDay", fDay);

		return flowerDao.selectFlowerByDate(param);
		
	}

	@Override
	public Flower searchFlowerByNo(Integer dataNo) throws Exception {
		return flowerDao.selectFlowerByNo(dataNo);
	}

	@Override
	public List<Flower> searchFlowerByPeriod(Integer sMonth, Integer sDay, Integer eMonth, Integer eDay) throws Exception {
		Map<String,Integer> startParam = new HashMap<>();
		Map<String,Integer> endParam = new HashMap<>();
		Map<String,Integer> param = new HashMap<>();
		startParam.put("fMonth", sMonth);
		startParam.put("fDay", sDay);
		endParam.put("fMonth", eMonth);
		endParam.put("fDay", eDay);
		Flower s_flower = flowerDao.selectFlowerByDate(startParam);
		Flower e_flower = flowerDao.selectFlowerByDate(endParam);
		Integer startNo = s_flower.getDataNo();
		Integer endNo = e_flower.getDataNo();
		param.put("startNo", startNo);
		param.put("endNo", endNo);
		List<Flower> flowers = null;
		//(앞의 날짜가 더 큰수라면)
		if(startNo > endNo) {
			flowers = flowerDao.selectFlowerPeriodReverse(param);
			return flowers;
		} else {
			flowers = flowerDao.selectFlowerPeriod(param);
			return flowers;
		}
		
		
	}

	@Override
	public List<Flower> searchFlowerByWord(String type, String word) throws Exception {
		Map<String,String> param = new HashMap<>();
		param.put("type", type);
		param.put("word", word);
		List<Flower> flowers = flowerDao.selectFlowerByWord(param);
		return flowers;
	}

	

}

package service;

import java.util.List;

import bean.Flower;

public interface FlowerService {
	void xml_parsing_insert() throws Exception;
	Flower searchFlowerByDate(Integer fMonth,Integer fDay) throws Exception;
	Flower searchFlowerByNo(Integer dataNo) throws Exception;
	List<Flower> searchFlowerByPeriod(Integer sMonth,Integer sDay,Integer eMonth,Integer eDay) throws Exception;
	List<Flower> searchFlowerByWord(String type,String word) throws Exception;
}

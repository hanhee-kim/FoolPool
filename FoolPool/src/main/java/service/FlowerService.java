package service;

import java.util.Map;

import bean.Flower;

public interface FlowerService {
	void xml_parsing_insert() throws Exception;
	Flower searchFlowerByDate(Integer fMonth,Integer fDay) throws Exception;
	Flower searchFlowerByNo(Integer dataNo) throws Exception;
}

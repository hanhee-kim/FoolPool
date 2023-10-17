package dao;

import java.util.List;
import java.util.Map;

import bean.Flower;

public interface FlowerDAO {
	void insertFlower(Flower flower) throws Exception;
	Flower selectFlowerByDate(Map<String,Integer> param) throws Exception;
	Flower selectFlowerByNo(Integer dataNo) throws Exception;
	List<Flower> selectFlowerPeriod(Map<String,Integer> param) throws Exception;
	List<Flower> selectFlowerByWord(Map<String,String> param) throws Exception;
	
}

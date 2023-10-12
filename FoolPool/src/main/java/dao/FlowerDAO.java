package dao;

import java.util.Map;

import bean.Flower;

public interface FlowerDAO {
	void insertFlower(Flower flower) throws Exception;
	Flower selectFlowerByDate(Map<String,Integer> param) throws Exception;
	Flower selectFlowerByNo(Integer dataNo) throws Exception;
}

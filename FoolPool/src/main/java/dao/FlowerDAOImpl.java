package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.Flower;
import util.MybatisSqlSessionFactory;

public class FlowerDAOImpl implements FlowerDAO{
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	@Override
	public void insertFlower(Flower flower) throws Exception {
		sqlSession.insert("mapper.flower.insertFlower", flower);
		sqlSession.commit();
	}

	@Override
	public Flower selectFlowerByDate(Map<String, Integer> param) throws Exception {  
		Flower f = sqlSession.selectOne("mapper.flower.selectFlowerByDate", param);
		return f;
	}


	@Override
	public Flower selectFlowerByNo(Integer dataNo) throws Exception {
		Flower f = sqlSession.selectOne("mapper.flower.selectFlowerByNo", dataNo);
		return f;
	}

	@Override
	public List<Flower> selectFlowerPeriod(Map<String, Integer> param) throws Exception {
		List<Flower> flowers = sqlSession.selectList("mapper.flower.selectFlowerByPeriod",param);
		return flowers;
	}

	@Override
	public List<Flower> selectFlowerByWord(Map<String, String> param) throws Exception {
		List<Flower> flowers = sqlSession.selectList("mapper.flower.selectFlowerByWord", param);
		return flowers;
	}

	
	
	
	
}

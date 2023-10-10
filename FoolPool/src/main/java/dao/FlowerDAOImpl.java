package dao;

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
}

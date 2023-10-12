package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.DrFoolPool;
import util.MybatisSqlSessionFactory;

public class DrFoolPoolDAOImpl implements DrFoolPoolDAO {
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	// 1. 게시글 목록
	@Override
	public List<DrFoolPool> selectDrFoolPoolList(Integer row) throws Exception {
		List<DrFoolPool> list = sqlSession.selectList("mapper.drfoolpool.selectDrFoolPoolList", row);
		return list;
	}
	@Override
	public Integer selectDrFoolPoolCount() throws Exception {
		return sqlSession.selectOne("mapper.drfoolpool.selectDrFoolPoolCount");
	}

}

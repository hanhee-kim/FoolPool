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
	
	// 2. 게시글 작성
	@Override
	public void insertDrFoolPool(DrFoolPool drFoolPool) throws Exception {
		sqlSession.insert("mapper.drfoolpool.insertDrFoolPool", drFoolPool);
		sqlSession.commit();
	}

	// 3-1. 게시글 상세
	@Override
	public DrFoolPool selectDrFoolPool(Integer no) throws Exception {
		return sqlSession.selectOne("mapper.drfoolpool.selectDrFoolPool", no);
	}
	// 3-2. 조회수 증가
	@Override
	public void updateDrFoolPoolViewCnt(Integer no) throws Exception {
		sqlSession.update("mapper.drfoolpool.updateDrFoolPoolViewCnt", no);
		sqlSession.commit();
	}

}

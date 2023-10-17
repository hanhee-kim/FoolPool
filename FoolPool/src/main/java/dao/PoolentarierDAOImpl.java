package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Poolentarier;
import util.MybatisSqlSessionFactory;

public class PoolentarierDAOImpl implements PoolentarierDAO {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	// 전체 게시글 수 조회
	@Override
	public Integer selectPoolentarierCount() throws Exception {
		return sqlSession.selectOne("mapper.poolentarier.selectPoolentarierCount");
	}
	
	@Override
	public List<Poolentarier> selectPoolentarierList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.poolentarier.selectPoolentarierList", row);
	}
	
	@Override
	public Poolentarier selectPoolentarierDetail(Integer no) throws Exception {
		Poolentarier poolentarier = sqlSession.selectOne("mapper.poolentarier.selectPoolentarierDetail", no);
		return sqlSession.selectOne("mapper.poolentarier.selectPoolentarierDetail", no);
	}
	
	@Override
	public void insertPoolentarierDetail(Poolentarier poolentarier) throws Exception {
		sqlSession.insert("mapper.poolentarier.insertPoolentarierDetail", poolentarier);
		sqlSession.commit();
	}
	
	@Override
	public void deletePoolentarierDetail(Integer no) throws Exception {
		sqlSession.delete("mapper.poolentarier.deletePoolentarier", no);
		sqlSession.commit();
	}
}

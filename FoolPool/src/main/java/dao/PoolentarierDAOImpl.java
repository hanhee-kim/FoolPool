package dao;

import java.util.List;
import java.util.Map;

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
	
	// 전체 게시글 목록 조회
	@Override
	public List<Poolentarier> selectPoolentarierList(Map<String, Object> param) throws Exception {
		return sqlSession.selectList("mapper.poolentarier.selectPoolentarierList", param);
	}
	
	// 게시글 조회
	@Override
	public Poolentarier selectPoolentarierDetail(Integer no) throws Exception {
		Poolentarier poolentarier = sqlSession.selectOne("mapper.poolentarier.selectPoolentarierDetail", no);
		return sqlSession.selectOne("mapper.poolentarier.selectPoolentarierDetail", no);
	}
	
	// 게시글 작성
	@Override
	public void insertPoolentarierDetail(Poolentarier poolentarier) throws Exception {
		sqlSession.insert("mapper.poolentarier.insertPoolentarierDetail", poolentarier);
		sqlSession.commit();
	}
	
	// 게시글 삭제
	@Override
	public void deletePoolentarierDetail(Integer no) throws Exception {
		sqlSession.delete("mapper.poolentarier.deletePoolentarier", no);
		sqlSession.commit();
	}
	
	// 게시글 조회수 증가
	@Override
	public void updatePoolentarierView(Integer no) throws Exception {
		sqlSession.update("mapper.poolentarier.updatePoolentarierView", no);
		sqlSession.commit();
	}
}

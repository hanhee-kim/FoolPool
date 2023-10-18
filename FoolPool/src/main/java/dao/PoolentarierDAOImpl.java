package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.Poolentarier;
import bean.PoolentarierComment;
import util.MybatisSqlSessionFactory;

public class PoolentarierDAOImpl implements PoolentarierDAO {
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	// 전체 게시글 수 조회
	@Override
	public Integer selectPoolentarierCount(Map<String, Object> param) throws Exception {
		return sqlSession.selectOne("mapper.poolentarier.selectPoolentarierCount", param);
	}
	
	// 전체 게시글 조회
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
	
	// 게시글 댓글 작성
	@Override
	public void insertPoolentarierComment(PoolentarierComment poolentarierComment) throws Exception {
		sqlSession.insert("mapper.poolentarier.insertPoolentarierComment", poolentarierComment);
		sqlSession.commit();
	}
	
	// 게시글 댓글 삭제
	@Override
	public void deletePoolentarierComment(Integer commentNo) throws Exception {
		sqlSession.delete("mapper.poolentarier.deletePoolentarierComment", commentNo);
		sqlSession.commit();
	}
	
	// 게시글 전체 댓글 조회
	@Override
	public List<PoolentarierComment> selectPoolentarierCommentList(Integer postNo) throws Exception {
		return sqlSession.selectList("mapper.poolentarier.selectPoolentarierCommentList", postNo);
	}
}

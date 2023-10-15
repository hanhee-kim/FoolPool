package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.DrFoolPool;
import bean.DrFoolPoolComment;
import util.MybatisSqlSessionFactory;

public class DrFoolPoolDAOImpl implements DrFoolPoolDAO {
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

	// 1. 게시글 목록
	@Override
	public List<DrFoolPool> selectDrFoolPoolList(Map<String,Object> paramMap) throws Exception {
		List<DrFoolPool> list = sqlSession.selectList("mapper.drfoolpool.selectDrFoolPoolList", paramMap);
		return list;
	}
	@Override
	public Integer selectDrFoolPoolCount(Map<String,Object> paramMap) throws Exception {
		return sqlSession.selectOne("mapper.drfoolpool.selectDrFoolPoolCount", paramMap);
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
	
	// 4. 게시글 삭제
	@Override
	public void deleteDrFoolPool(Integer no) throws Exception {
		sqlSession.update("mapper.drfoolpool.deleteDrFoolPool", no);
		sqlSession.commit();
	}
	
	// 5. 댓글 목록
	@Override
	public List<DrFoolPoolComment> selectDrFoolPoolCommentList(Integer postNo) throws Exception {
		List<DrFoolPoolComment> commlist = sqlSession.selectList("mapper.drfoolpool.selectDrFoolPoolComment", postNo);
		return commlist;
	}
	
	// 6. 댓글 작성

	// 7. 댓글 삭제
	@Override
	public void deleteDrFoolPoolComment(Integer commentNo) throws Exception {
		sqlSession.update("mapper.drfoolpool.deleteDrFoolPoolComment", commentNo);
		sqlSession.commit();
	}
	
	
	
	

}

package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import bean.Notice;
import util.MybatisSqlSessionFactory;

public class NoticeDAOImpl implements NoticeDAO{
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();
	
	@Override //게시글 작성
	public void insertNotice(Notice notice) throws Exception {
		sqlSession.insert("mapper.notice.insertNotice",notice);
		sqlSession.commit();
	}

	@Override //공지사항 리스트
	public List<Notice> selectNoticeList(Integer row) throws Exception {
		return sqlSession.selectList("mapper.notice.selectNoticeList",row);
	}

	@Override //페이징 처리르르 위한 데이터 수 
	public Integer selectNoticeCount() throws Exception {
		return sqlSession.selectOne("mapper.notice.selectNoticeCount");
	}

	@Override //게시글 상세 
	public Notice selectNotice(Integer num) throws Exception {
		return sqlSession.selectOne("mapper.notice.selectNotice",num);
	}

	@Override //게시글 수정 
	public void updateNotice(Notice notice) throws Exception {
		sqlSession.update("mapper.notice.updateNotice",notice);
		sqlSession.commit();		
	}

	@Override //조회수 카운트 
	public void updateNoticeViewCount(Integer num) throws Exception {
		sqlSession.update("mapper.notice.updateNoticeViewCount",num);
		sqlSession.commit();
		
	}

	@Override
	public List<Notice> searchNoticeList(Map<String, Object> parammap) throws Exception {
		return sqlSession.selectList("mapper.notice.searchNoticeList",parammap);
	}

	@Override
	public Integer searchNoticeCount(Map<String, Object> parammap) throws Exception {
		return sqlSession.selectOne("mapper.notice.searchNoticeCount",parammap);
	}

	@Override //게시글 삭제
	public void deleteNotice(Integer num) throws Exception {
		sqlSession.update("mapper.notice.deleteNotice",num);
		sqlSession.commit();
		
	}

	

}
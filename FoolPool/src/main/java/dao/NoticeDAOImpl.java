package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import bean.Notice;
import util.MybatisSqlSessionFactory;

public class NoticeDAOImpl implements NoticeDAO{
	
	SqlSession sqlSession = MybatisSqlSessionFactory.getSqlSessionFactory().openSession();

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

}

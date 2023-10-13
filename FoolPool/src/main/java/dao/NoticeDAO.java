package dao;

import java.util.List;

import bean.Notice;

public interface NoticeDAO {
	//게시글 작성
	void insertNotice(Notice notice)throws Exception;
	
	//공지사항 리스트
	List<Notice> selectNoticeList(Integer row)throws Exception;
	
	//페이징 처리를 위해 필요한 전체 데이터 개수( 전체 행의 개수를 알아야 전체 페이지를 얻을 수 있음 ) 
	Integer selectNoticeCount()throws Exception;
	
	//게시글 상세 미완성
	Notice selectNotice(Integer num)throws Exception;
	
	//게시글 수정 
	void updateNotice(Notice notice)throws Exception;
	
	//좋아요 수 카운트 하기 
	void updateNoticeViewCount(Integer num)throws Exception;
	
}

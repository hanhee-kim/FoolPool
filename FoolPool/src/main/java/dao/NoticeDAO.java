package dao;

import java.util.List;

import bean.Notice;

public interface NoticeDAO {
	//공지사항 리스트
	List<Notice> selectNoticeList(Integer row)throws Exception;
	
	//페이징 처리를 위해 필요한 전체 데이터 개수( 전체 행의 개수를 알아야 전체 페이지를 얻을 수 있음 ) 
	Integer selectNoticeCount()throws Exception;
	
	//게시글 상세 
	Notice selectNotice(Integer num)throws Exception;
	
}

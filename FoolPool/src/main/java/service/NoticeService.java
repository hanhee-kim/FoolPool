package service;

import java.util.Map;

import bean.Notice;

public interface NoticeService {
	void noticeWrite(Notice notice)throws Exception;
	Map<String, Object> noticeListByPage(Integer page)throws Exception;//리스트
	Notice noticeDetail(Integer num)throws Exception;
	void noticeModify(Notice notice)throws Exception; //수정
	Map<String, Object> noticeSearch(String type, String keyword,Integer page)throws Exception;
	void noticeDelete(Integer num)throws Exception;
	
}
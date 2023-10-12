package service;

import java.util.Map;

import bean.Notice;

public interface NoticeService {
	Map<String, Object> noticeListByPage(Integer page)throws Exception;
	Notice noticeDetail(Integer num)throws Exception;
	void noticeEdit(Notice notice)throws Exception;
}

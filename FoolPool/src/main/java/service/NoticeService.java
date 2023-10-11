package service;

import java.util.Map;

public interface NoticeService {
	Map<String, Object> noticeListByPage(Integer page)throws Exception;
}

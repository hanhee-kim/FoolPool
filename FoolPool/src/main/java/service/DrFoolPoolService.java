package service;

import java.util.Map;

public interface DrFoolPoolService {
	
	// 1. 게시글 목록
	Map<String, Object> drFoolPoolListByPage(int curpage) throws Exception;

}

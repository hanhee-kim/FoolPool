package service;

import java.util.Map;

import bean.DrFoolPool;

public interface DrFoolPoolService {
	
	// 1. 게시글 목록
	Map<String, Object> drFoolPoolListByPage(int curpage) throws Exception;
	
	// 2. 게시글 작성
	void drFoolPoolWrite(DrFoolPool drFoolPool) throws Exception;

}
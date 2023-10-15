package dao;

import java.util.List;
import java.util.Map;

import bean.DrFoolPool;

public interface DrFoolPoolDAO {
	
	// 1. 게시글 목록
//	List<DrFoolPool> selectDrFoolPoolList(Integer row) throws Exception;
	List<DrFoolPool> selectDrFoolPoolList(Map<String,Object> paramMap) throws Exception;
	Integer selectDrFoolPoolCount(int filterNo) throws Exception;
	
	// 2. 게시글 작성
	void insertDrFoolPool(DrFoolPool drFoolPool) throws Exception;
	
	// 3-1. 게시글 상세
	DrFoolPool selectDrFoolPool(Integer no) throws Exception;
	// 3-2. 조회수 증가
	void updateDrFoolPoolViewCnt(Integer no) throws Exception;
	
}

package dao;

import java.util.List;

import bean.DrFoolPool;

public interface DrFoolPoolDAO {
	
	// 1. 게시글 목록
	List<DrFoolPool> selectDrFoolPoolList(Integer row) throws Exception;
	Integer selectDrFoolPoolCount() throws Exception;
	
	// 2. 게시글 작성
	void insertDrFoolPool(DrFoolPool drFoolPool) throws Exception;
	
}

package dao;

import java.util.List;
import java.util.Map;

import bean.DrFoolPool;
import bean.DrFoolPoolComment;

public interface DrFoolPoolDAO {
	
	// 1. 게시글 목록
	List<DrFoolPool> selectDrFoolPoolList(Map<String,Object> paramMap) throws Exception;
	Integer selectDrFoolPoolCount(Map<String,Object> paramMap) throws Exception;
	
	// 2. 게시글 작성
	void insertDrFoolPool(DrFoolPool drFoolPool) throws Exception;
	
	// 3-1. 게시글 상세
	DrFoolPool selectDrFoolPool(Integer no) throws Exception;
	// 3-2. 조회수 증가
	void updateDrFoolPoolViewCnt(Integer no) throws Exception;
	
	// 4. 게시글 삭제
	void deleteDrFoolPool(Integer no) throws Exception;
	
	// 5. 댓글 목록
	List<DrFoolPoolComment> selectDrFoolPoolCommentList(Integer postNo) throws Exception;
	
	// 6. 댓글 작성
	void insertDrFoolPoolComment(DrFoolPoolComment comment) throws Exception;

	// 7. 댓글 삭제
	void deleteDrFoolPoolComment(Integer commentNo) throws Exception;
	
	
	
}

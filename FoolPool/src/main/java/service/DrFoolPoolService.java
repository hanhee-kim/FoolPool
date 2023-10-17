package service;

import java.util.List;
import java.util.Map;

import bean.DrFoolPool;
import bean.DrFoolPoolComment;

public interface DrFoolPoolService {
	
	// 1. 게시글 목록
	Map<String, Object> drFoolPoolListByPage(int curpage, String filter, String sOption, String sValue) throws Exception;
	
	// 2. 게시글 작성
	void drFoolPoolWrite(DrFoolPool drFoolPool) throws Exception;
	
	// 3. 게시글 상세
	DrFoolPool drFoolPoolDetail(Integer no) throws Exception;
	
	// 4. 게시글 삭제
	void drFoolPoolRemove(Integer no) throws Exception;
	
	// 5. 게시글 수정
	void drFoolPoolEdit(DrFoolPool drFoolPool) throws Exception;
	
	// 6. 댓글 목록
	List<DrFoolPoolComment> drFoolPoolCommentList(Integer postNo) throws Exception;
	
	// 7. 댓글 작성
	void drFoolPoolCommentWrite(DrFoolPoolComment comment) throws Exception;

	// 8. 댓글 삭제
	void drFoolPoolCommentRemove(Integer commentNo) throws Exception;
	
	// 9. 댓글 채택
	void drFoolPoolCommentPick(Integer commentNo, Integer postNo) throws Exception;

}
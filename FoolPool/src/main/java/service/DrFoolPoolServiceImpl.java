package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.DrFoolPool;
import bean.DrFoolPoolComment;
import dao.DrFoolPoolDAO;
import dao.DrFoolPoolDAOImpl;
import util.PageInfo;

public class DrFoolPoolServiceImpl implements DrFoolPoolService {
	
	private DrFoolPoolDAO drFoolPoolDAO;

	public DrFoolPoolServiceImpl() {
		drFoolPoolDAO = new DrFoolPoolDAOImpl();
	}
	

	// 1. 게시글 목록
	@Override
	public Map<String, Object> drFoolPoolListByPage(int curPage, String filter, String sOption, String sValue)
			throws Exception {
		// 검색 전에는 sOption과 sValue를 null로 받아 호출됨
		System.out.println("===========service\n curPage: " + curPage + ", filter: " + filter + ", sOption: " + sOption + ", sValue: " + sValue);
		
		PageInfo pageInfo = new PageInfo();
		
		// 게시글 행의 수를 통해 전체 페이지 수 계산
		Map<String,Object> paramMapforCnt = new HashMap<>();
		paramMapforCnt.put("filter", filter);
		paramMapforCnt.put("sOption", sOption);
		paramMapforCnt.put("sValue", sValue);
		int drFoolPoolCount = drFoolPoolDAO.selectDrFoolPoolCount(paramMapforCnt);
		System.out.println("####drFoolPoolCount: " + drFoolPoolCount);
		int itemsPerPage = 6; // 페이지당 카드 6개 표시 *** xml의 limit절과 일치시킬것
		int pagesPerGroup = 10; // 페이지그룹당 페이지번호 수
		int maxPage = (int)Math.ceil((double)drFoolPoolCount/itemsPerPage);
		
		// 현재페이지를 통해 버튼의시작페이지번호와 버튼의끝페이지번호를 만든다
		int startPage = (curPage-1)/pagesPerGroup*pagesPerGroup+1;
		int endPage = startPage+pagesPerGroup-1;
		if(endPage>maxPage) endPage=maxPage;
		
		// 게시글 삭제 예외처리
		if(curPage>maxPage) curPage=maxPage;
		
		// PageInfo객체 완성
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(curPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		// 현재 페이지의 시작 행 (SELECT문의 limit절에서 사용)
		int row = (curPage-1)*itemsPerPage+1; 
		System.out.println("maxPage: " + maxPage + ", curPage: " + curPage + ", row: " + row);
		if(row<0) row = 1;
		
		// 서비스의 메서드 호출하여 리스트를 반환받음
		Map<String,Object> paramMap = new HashMap<>();
		paramMap.put("row", row-1);
		paramMap.put("filter", filter);
		paramMap.put("sOption", sOption);
		paramMap.put("sValue", sValue);
		System.out.println("row: " + (row-1) + ", filter: " + filter);
		List<DrFoolPool> drFoolPoolList = drFoolPoolDAO.selectDrFoolPoolList(paramMap);
		
		// 페이지정보 객체와 리스트를 맵에 담아 호출부로 리턴
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("drFoolPoolList", drFoolPoolList);
		
		return map;
	}
	

	
	// 2. 게시글 작성
	@Override
	public void drFoolPoolWrite(DrFoolPool drFoolPool) throws Exception {
		drFoolPoolDAO.insertDrFoolPool(drFoolPool);
	}


	// 3. 게시글 상세
	@Override
	public DrFoolPool drFoolPoolDetail(Integer no) throws Exception {
		drFoolPoolDAO.updateDrFoolPoolViewCnt(no); // 조회수 증가
		return drFoolPoolDAO.selectDrFoolPool(no);
	}


	// 4. 게시글 삭제
	@Override
	public void drFoolPoolRemove(Integer no) throws Exception {
		drFoolPoolDAO.deleteDrFoolPool(no);
	}

	
	// 5. 게시글 수정
	@Override
	public void drFoolPoolEdit(DrFoolPool drFoolPool) throws Exception {
		drFoolPoolDAO.updateDrFoolPool(drFoolPool);
	}


	// 6. 댓글 목록
	@Override
	public List<DrFoolPoolComment> drFoolPoolCommentList(Integer postNo) throws Exception {
		List<DrFoolPoolComment> drFoolPoolCommentList = drFoolPoolDAO.selectDrFoolPoolCommentList(postNo);
		return drFoolPoolCommentList;
	}

	// 7. 댓글 작성
	@Override
	public void drFoolPoolCommentWrite(DrFoolPoolComment comment) throws Exception {
		drFoolPoolDAO.insertDrFoolPoolComment(comment);
	}

	// 8. 댓글 삭제
	@Override
	public void drFoolPoolCommentRemove(Integer commentNo) throws Exception {
		drFoolPoolDAO.deleteDrFoolPoolComment(commentNo);
	}


	




	
	
	
	
	
	
	
	

}
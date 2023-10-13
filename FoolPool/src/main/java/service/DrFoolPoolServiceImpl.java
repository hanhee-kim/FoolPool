package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.DrFoolPool;
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
	public Map<String, Object> drFoolPoolListByPage(int curpage) throws Exception {
		
		PageInfo pageInfo = new PageInfo();
		
		// DB에서 조회한 결과행의 수를 통해 전체 페이지 수 계산
		int drFoolPoolCount = drFoolPoolDAO.selectDrFoolPoolCount();
		int itemsPerPage = 6; // 페이지당 카드 6개 표시 *** xml의 limit절과 일치시킬것
		int pagesPerGroup = 10; // 페이지그룹당 페이지번호 수
		int maxPage = (int)Math.ceil((double)drFoolPoolCount/itemsPerPage);
		System.out.println("-----serviceImpl\n데이터의 수: " + drFoolPoolCount + "\n총페이지수: " + maxPage);
		
		// 현재페이지를 통해 버튼의시작페이지번호와 버튼의끝페이지번호를 만든다
		int startPage = (curpage-1)/pagesPerGroup*pagesPerGroup+1;
		int endPage = startPage+pagesPerGroup-1;
		if(endPage>maxPage) endPage=maxPage;
		
		// 게시글 삭제 예외처리
		if(curpage>maxPage) curpage=maxPage;
		
		// PageInfo객체 완성
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(curpage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		// 현재 페이지의 시작 행 (SELECT문의 limit절에서 사용)
		int row = (curpage-1)*itemsPerPage+1; 
		System.out.println("row: " + row);
		List<DrFoolPool> drFoolPoolList = drFoolPoolDAO.selectDrFoolPoolList(row-1);
		
		// 페이지정보 객체와 리스트를 맵에 담아 호출부로 리턴
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("drFoolPoolList", drFoolPoolList);
		
		return map;
	}

}

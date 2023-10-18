package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Poolentarier;
import bean.PoolentarierComment;
import dao.PoolentarierDAO;
import dao.PoolentarierDAOImpl;
import util.PageInfo;

public class PoolentarierServiceImpl implements PoolentarierService {
	
	private PoolentarierDAO poolentarierDAO;
	
	// 생성자
	public PoolentarierServiceImpl() {
		poolentarierDAO = new PoolentarierDAOImpl();
	}

	// 전체 게시글 개수 조회 + 전체 게시글 조회
	@Override
	public Map<String, Object> poolentarierListByPage(Integer page, String sortOption, String searchOption, String searchText) throws Exception {
		PageInfo pageInfo = new PageInfo();
		Map<String,Object> paramForCount = new HashMap<>();
		
//		System.out.println("검색옵션(서비스): " + searchOption);
//		System.out.println("검색내용(서비스): " + searchText);
		paramForCount.put("searchOption", searchOption);
		paramForCount.put("searchText", searchText);
		int poolentarierCount = poolentarierDAO.selectPoolentarierCount(paramForCount);
		
		// 전체 페이지(최대 페이지) 개수 설정
		// 한 페이지 당 최대 게시글 수는 4개
		// ceil은 무조건 올림 (소수점이 남아있으면 무조건 높은 정수로)
		// ex: 39개의 게시글이 있으면, maxPage는 10 (39 / 4 = 9.xxx...이므로 10으로 올림)
		int maxPage = (int) Math.ceil((double) poolentarierCount / 4);
		
		
		// 현재 페이지인 page를 기반한 시작 페이지
		// 예를 들어, 11~20 사이의 페이지라면 시작 페이지가 11
		// -1을 해주는 이유는 1의 자리 숫자가 0인 페이지가 경계에 걸치는 것을 방지하기 위해 (ex: 11~20까지이므로, 10은 포함 안되도록)
		int startPage = (page - 1) / 10 * 10 + 1;
		
		// 끝 페이지
		int endPage = startPage + 10 - 1;
		// 만일 끝 페이지가 마지막 페이지 수를 초과한다면, 마지막 페이지를 끝 페이지로 설정ㅊ
		if(endPage > maxPage)
			endPage = maxPage;
		
		// 만일 모종의 이유로 요청한 페이지가 전체 페이지를 초과하는 경우
		// ex: 현재 페이지가 마지막 페이지이면서 남은 게시글 1개를 삭제하고 게시판를 불러온다면
		// 마지막 페이지를 현재 페이지로서 보여줌
		// 일종의 예외처리
		System.out.println("페이지: " + page);
		System.out.println("맥스페이지: " + maxPage);
		if(page > maxPage)
			page = maxPage;
		
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		// 현재 페이지 시작 row
		// ex: 3페이지면, row는 9번 (9번부터 시작)
		int row = (page - 1) * 4 + 1;
		System.out.println(row);
		
		// DAO의 메서드를 호출하여 리스트를 반환받음
		Map<String,Object> paramForList = new HashMap<>();
		paramForList.put("row", row - 1);
		paramForList.put("sortOption", sortOption);
		paramForList.put("searchOption", searchOption);
		paramForList.put("searchText", searchText);
		
		// 페이지, 검색 옵션, 검색 텍스트, 정렬 옵션에 대한 값을 가지고 쿼리 수행하여 조건에 맞는 게시글을 순서대로 가져옴.
		// row번째 게시글부터 게시글 가져오기 (4개씩 조회)
		List<Poolentarier> poolentarierList = poolentarierDAO.selectPoolentarierList(paramForList);

		// (페이지 정보 객체, 풀랜테리어 리스트)를 가지는 map 반환
		Map<String, Object> resMap = new HashMap<>();
		resMap.put("pageInfo", pageInfo);
		resMap.put("poolentarierList", poolentarierList);
		
		return resMap;
	}

	// 게시글 조회 + 게시글 조회수 상승
	@Override
	public Poolentarier poolentarierDetail(Integer no) throws Exception {
		poolentarierDAO.updatePoolentarierView(no);
		return poolentarierDAO.selectPoolentarierDetail(no);
	}
	
	// 게시글 작성
	@Override
	public void poolentarierWrite(Poolentarier poolentarier) throws Exception {
		poolentarierDAO.insertPoolentarierDetail(poolentarier);
	}

	// 게시글 삭제
	@Override
	public void poolentarierDelete(Integer no) throws Exception {
		poolentarierDAO.deletePoolentarierDetail(no);
	}
	
	// 게시글 검색
	@Override
	public Map<String, Object> poolentarierSearch(int page, String sortOption, String searchOption, String searchText) throws Exception {
		Map<String, Object> param = new HashMap<>();
		param.put("searchOption", searchOption);
		param.put("searchText", searchText);
		param.put("sortOption", sortOption);
		
		PageInfo pageInfo = new PageInfo();
		int poolentarierCount = poolentarierDAO.selectPoolentarierCount(param);
		int maxPage = (int) Math.ceil((double)poolentarierCount / 10);
		int startPage = (page - 1) / 10 * 10 + 1;
		int endPage = startPage + 10 - 1;
		if(endPage > maxPage) endPage = maxPage;
		if(page > maxPage) page = maxPage;
		
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		// 검색 결과가 없을 떄??
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		
		if(page == 0) {
			return map;
		}
		
		int row = (page - 1) * 10 + 1;
		param.put("row", row - 1);
		List<Poolentarier> poolentarierList = poolentarierDAO.selectPoolentarierList(param);

		map.put("poolentarierList", poolentarierList);
		map.put("searchOption", searchOption);
		map.put("searchText", searchText);
		
		return map;
	}
	
	@Override
	public void poolentarierWriteComment(PoolentarierComment poolentarierComment) throws Exception {
		poolentarierDAO.insertPoolentarierComment(poolentarierComment);
		
	}

	@Override
	public void poolentarierDeleteComment(Integer commentNo) throws Exception {
		poolentarierDAO.deletePoolentarierComment(commentNo);
	}
	
	@Override
	public List<PoolentarierComment> poolentarierCommentList(Integer postNo) throws Exception {
		return poolentarierDAO.selectPoolentarierCommentList(postNo);
	}
	
}

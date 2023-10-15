package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Poolentarier;
import dao.PoolentarierDAO;
import dao.PoolentarierDAOImpl;
import util.PageInfo;

public class PoolentarierServiceImpl implements PoolentarierService {
	
	private PoolentarierDAO poolentarierDAO;
	
	public PoolentarierServiceImpl() {
		poolentarierDAO = new PoolentarierDAOImpl();
	}

	@Override
	public Map<String, Object> poolentarierListByPage(Integer page) throws Exception {
		PageInfo pageInfo = new PageInfo();
		
		// 전체 게시글 개수 조회
		int poolentarierCount = poolentarierDAO.selectPoolentarierCount();
		
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
		if(page > maxPage)
			page = maxPage;
		
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		// 현재 페이지 시작 row
		// ex: 3페이지면, row는 9번 (9번부터 시작)
		int row = (page - 1) * 4 + 1;
		
		// row번째 게시글부터 게시글 가져오기 (4개 가져옴
		List<Poolentarier> poolentarierList = poolentarierDAO.selectPoolentarierList(row - 1);

		// 
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("poolentarierList", poolentarierList);
		
		return map;
	}

	@Override
	public Poolentarier poolentarierDetail(Integer num) throws Exception {
		return poolentarierDAO.selectPoolentarierDetail(num);
	}
	
	@Override
	public void poolentarierWrite(Poolentarier poolentarier) throws Exception {
		poolentarierDAO.insertPoolentarierDetail(poolentarier);
	}
}

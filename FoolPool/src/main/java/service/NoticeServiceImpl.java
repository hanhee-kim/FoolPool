package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import bean.Notice;
import dao.NoticeDAO;
import dao.NoticeDAOImpl;
import util.PageInfo;

public class NoticeServiceImpl implements NoticeService {
	private NoticeDAO noticeDao;
	
	public NoticeServiceImpl() {
		noticeDao = new NoticeDAOImpl();
	}
	
	@Override //게시글 작성
	public void noticeWrite(Notice notice) throws Exception {
		noticeDao.insertNotice(notice);
		
	}

	@Override //공지사항 리스트
	public Map<String, Object> noticeListByPage(Integer page) throws Exception { //인자로 받은것이 현재 페이지 
		
		PageInfo pageInfo = new PageInfo();
		
		int NoticeCount = noticeDao.selectNoticeCount();
		int maxPage = (int)Math.ceil((double)NoticeCount/10);
		
		
		int startPage = (page-1)/10*10+1;
		int endPage = startPage+10-1;
		if(endPage>maxPage) endPage = maxPage;
		
		// NoticeCount==0일때의 예외처리: 아래 코드로 인해 page가 0이 되면 자연히 row가 음수가 되어 sql예외 발생하게됨
		if(maxPage==0) maxPage = 1;
		
		//게시글 삭제 예외처리 
		if(page>maxPage) page = maxPage;
		
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		//현재 페이지의 시작 행 ( select 문의 limit 절에 사용됨 ) 
		int row = (page-1)*10+1; 
		List<Notice> noticeList = noticeDao.selectNoticeList(row-1);
		
		
		//페이지 정보 객체와 리스트를 맵에 담아 호출부로부터 리턴 
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("noticeList", noticeList);
		return map;
	}
	
	

	@Override //상세 페이지 
	public Notice noticeDetail(Integer num) throws Exception {
		noticeDao.updateNoticeViewCount(num);
		return noticeDao.selectNotice(num);			
	}

	@Override //수정
	public void noticeModify(Notice notice) throws Exception {
		System.out.println("noticeModify");
		noticeDao.updateNotice(notice);
	}

	@Override //게시글 검색 
	public Map<String, Object> noticeSearch(String type, String keyword, Integer page) throws Exception {
		Map<String, Object>param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		
		PageInfo pageInfo = new PageInfo();
		int noticeCount = noticeDao.searchNoticeCount(param);
		int maxPage = (int)Math.ceil((double)noticeCount/10);
		int startPage = (page-1)/10*10+1;
		int endPage = startPage+10-1;
		if(endPage>maxPage)endPage = maxPage;
		if(maxPage==0) maxPage = 1;
		if(page>maxPage)page = maxPage;
		
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		int row = (page-1)*10+1;
		param.put("row", row-1);
		List<Notice> noticeList = noticeDao.searchNoticeList(param);
		
		Map<String, Object>map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("noticeList", noticeList);
		map.put("type", type);
		map.put("keyword", keyword);
		
		
		return map;
	}

	@Override
	public void noticeDelete(Integer num) throws Exception {
		noticeDao.deleteNotice(num);
		
	}



	

}
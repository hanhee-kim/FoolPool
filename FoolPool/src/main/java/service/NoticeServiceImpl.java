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
		System.out.println(NoticeCount);
		
		int startPage = (page-1)/10*10+1;
		int endPage = startPage+10-1;
		if(endPage>maxPage) endPage = maxPage;
		
		//게시글 삭제 예외처리 
		if(page>maxPage) page = maxPage;
		
		pageInfo.setAllPage(maxPage);
		pageInfo.setCurPage(page);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		
		//현재 페이지의 시작 행 ( select 문의 limit 절에 사용됨 ) 
		int row = (page-1)*10+1; 
		List<Notice> noticeList = noticeDao.selectNoticeList(row-1);
		Notice n = noticeList.get(0);
		System.out.println(n.getTitle());
		//페이지 정보 객체와 리스트를 맵에 담아 호출부로부터 리턴 
		Map<String, Object> map = new HashMap<>();
		map.put("pageInfo", pageInfo);
		map.put("noticeList", noticeList);
		return map;
	}

	@Override //상세 페이지 
	public Notice noticeDetail(Integer num) throws Exception {
//		noticeDao.updateNoticeViewCount(num); 
		return noticeDao.selectNotice(num);			
	}

	@Override //공지사항 수정
	public void noticeModify(Notice notice) throws Exception {
		noticeDao.updateNotice(notice);
	}

	

}

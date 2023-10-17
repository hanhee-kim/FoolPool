package service;

import java.util.List;
import java.util.Map;

import bean.Poolentarier;
import bean.PoolentarierComment;

public interface PoolentarierService {
	Map<String, Object> poolentarierListByPage(Integer page, String sortOption, String searchOption, String searchText) throws Exception; // key, value
	Poolentarier poolentarierDetail(Integer no) throws Exception;
	void poolentarierWrite(Poolentarier poolentarier) throws Exception;
	void poolentarierDelete(Integer no) throws Exception;
//	Map<String, Object> poolentarierSearch(Integer page, String sortOption, String searchOption, String searchText) throws Exception;
	void poolentarierWriteComment(PoolentarierComment poolentarierComment) throws Exception;
	void poolentarierDeleteComment(Integer commentNo) throws Exception;
	List<PoolentarierComment> poolentarierCommentList(Integer postNo) throws Exception;
}

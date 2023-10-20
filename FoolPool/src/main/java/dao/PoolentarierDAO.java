package dao;

import java.util.List;
import java.util.Map;

import bean.Poolentarier;
import bean.PoolentarierComment;

public interface PoolentarierDAO {
	Integer selectPoolentarierCount(Map<String, Object> param) throws Exception;
	List<Poolentarier> selectPoolentarierList(Map<String, Object> param) throws Exception;
	Poolentarier selectPoolentarierDetail(Integer no) throws Exception;
	void insertPoolentarierDetail(Poolentarier poolentarier) throws Exception;
	void deletePoolentarierDetail(Integer no) throws Exception;
	void updatePoolentarierView(Integer no) throws Exception;
	void insertPoolentarierComment(PoolentarierComment poolentarierComment) throws Exception;
	void deletePoolentarierComment(Integer commentNo) throws Exception;
	List<PoolentarierComment> selectPoolentarierCommentList(Integer postNo) throws Exception;
	void updatePoolentarierDetail(Poolentarier poolentarier) throws Exception;
}

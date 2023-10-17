package dao;

import java.util.List;
import java.util.Map;

import bean.Poolentarier;

public interface PoolentarierDAO {
	Integer selectPoolentarierCount() throws Exception;
	List<Poolentarier> selectPoolentarierList(Map<String, Object> param) throws Exception;
	Poolentarier selectPoolentarierDetail(Integer no) throws Exception;
	void insertPoolentarierDetail(Poolentarier poolentarier) throws Exception;
	void deletePoolentarierDetail(Integer no) throws Exception;
	void updatePoolentarierView(Integer no) throws Exception;
}

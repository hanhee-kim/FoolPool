package dao;

import java.util.List;

import bean.Poolentarier;

public interface PoolentarierDAO {
	Integer selectPoolentarierCount() throws Exception;
	List<Poolentarier> selectPoolentarierList(Integer row) throws Exception;
	Poolentarier selectPoolentarierDetail(Integer no) throws Exception;
	void insertPoolentarierDetail(Poolentarier poolentarier) throws Exception;
	void deletePoolentarierDetail(Integer no) throws Exception;
}

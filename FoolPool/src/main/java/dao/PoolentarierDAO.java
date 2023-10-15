package dao;

import java.util.List;

import bean.Poolentarier;

public interface PoolentarierDAO {
	Integer selectPoolentarierCount() throws Exception;
	List<Poolentarier> selectPoolentarierList(Integer row) throws Exception;
	Poolentarier selectPoolentarierDetail(Integer num) throws Exception;
	void insertPoolentarierDetail(Poolentarier poolentarier) throws Exception;
}

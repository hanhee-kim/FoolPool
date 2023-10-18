package service;

import java.util.Map;

import bean.Poolentarier;

public interface PoolentarierService {
	Map<String, Object> poolentarierListByPage(Integer page) throws Exception; // key, value
	Poolentarier poolentarierDetail(Integer no) throws Exception;
	void poolentarierWrite(Poolentarier poolentarier) throws Exception;
	void poolentarierDelete(Integer no) throws Exception;
}

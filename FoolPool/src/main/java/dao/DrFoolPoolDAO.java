package dao;

import java.util.List;

import bean.DrFoolPool;

public interface DrFoolPoolDAO {
	
	List<DrFoolPool> selectDrFoolPoolList(Integer row) throws Exception;
	Integer selectDrFoolPoolCount() throws Exception;
	
}

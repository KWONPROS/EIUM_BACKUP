package com.myspring.eium.pm.pm_p0001.dao;



import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.pm.pm_p0001.vo.S0002VO;




public interface S0002DAO {
	 public List<S0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;
	 
}

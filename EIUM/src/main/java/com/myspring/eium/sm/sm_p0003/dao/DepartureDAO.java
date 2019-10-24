package com.myspring.eium.sm.sm_p0003.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0003.vo.DepartureVO;

public interface DepartureDAO {

	public List<DepartureVO> searchList(Map<String, Object> searchMap)throws DataAccessException;

	public void insertData(Map<String, String> row)throws DataAccessException;

	public void updateData(Map<String, String> row)throws DataAccessException;

	public void deleteData(Map<String, String> row)throws DataAccessException;

	public List<DepartureVO> searchpopup(Map<String, Object> searchMap) throws DataAccessException;

	public void insertDatapopup(Map<String, String> row);

	public void updateDatapopup(Map<String, String> row);

	public void deleteDatapopup(Map<String, String> row); 
	public List<DepartureVO> searchSiteList(Map<String, Object> searchMap)throws DataAccessException;

	
}

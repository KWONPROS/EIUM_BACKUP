package com.myspring.eium.sm.sm_p0003.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0003.vo.P0003VO;

public interface P0003DAO {

	public List<P0003VO> searchList(Map<String, Object> searchMap)throws DataAccessException;

	public void insertData(Map<String, String> row)throws DataAccessException;

	public void updateData(Map<String, String> row)throws DataAccessException;

	public void deleteData(Map<String, String> row)throws DataAccessException;

	public List<P0003VO> searchpopup(Map<String, Object> searchMap) throws DataAccessException;

	public void insertDatapopup(Map<String, String> row);

	public void updateDatapopup(Map<String, String> row);

	public void deleteDatapopup(Map<String, String> row); 
	public List<P0003VO> searchSiteList(Map<String, Object> searchMap)throws DataAccessException;

	
}

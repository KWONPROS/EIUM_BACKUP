package com.myspring.eium.sm.sm_p0003.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0003.vo.DepartureVO;

public interface DepartureService {

	public List<DepartureVO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap)throws DataAccessException;

	public List<DepartureVO> searchpopup(Map<String, Object> searchMap) throws DataAccessException;

	public void saveDatapopup(Map<String, String[]> dataMap) throws DataAccessException;

	public List<DepartureVO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException;



}

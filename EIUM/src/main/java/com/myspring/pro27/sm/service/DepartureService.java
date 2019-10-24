package com.myspring.pro27.sm.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.pro27.sm.vo.DepartureVO;

public interface DepartureService {

	public List<DepartureVO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap)throws DataAccessException;

	public List<DepartureVO> searchpopup(Map<String, Object> searchMap) throws DataAccessException;

	public void saveDatapopup(Map<String, String[]> dataMap) throws DataAccessException;

	public List<DepartureVO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException;



}

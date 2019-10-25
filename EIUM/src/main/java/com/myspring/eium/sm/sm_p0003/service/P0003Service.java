package com.myspring.eium.sm.sm_p0003.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0003.vo.P0003VO;

public interface P0003Service {

	public List<P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap)throws DataAccessException;

	public List<P0003VO> searchpopup(Map<String, Object> searchMap) throws DataAccessException;

	public void saveDatapopup(Map<String, String[]> dataMap) throws DataAccessException;

	public List<P0003VO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException;



}

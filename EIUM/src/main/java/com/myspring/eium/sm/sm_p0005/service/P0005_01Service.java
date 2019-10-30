package com.myspring.eium.sm.sm_p0005.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0005.vo.P0005_01VO;


public interface P0005_01Service {
	 
	 public List<P0005_01VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
     public void saveData(Map<String, String[]> dataMap, String x)  throws DataAccessException;
}

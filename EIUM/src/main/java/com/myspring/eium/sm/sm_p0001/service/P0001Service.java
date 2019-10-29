package com.myspring.eium.sm.sm_p0001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0001.vo.P0001VO;

public interface P0001Service {
	public List<P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap) throws DataAccessException;
}

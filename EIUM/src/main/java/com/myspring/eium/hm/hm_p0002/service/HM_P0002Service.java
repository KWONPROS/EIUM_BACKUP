package com.myspring.eium.hm.hm_p0002.service;


import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0002.vo.HM_P0002VO;




public interface HM_P0002Service {
	 public List<HM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap, String u, String x)  throws DataAccessException ;
}

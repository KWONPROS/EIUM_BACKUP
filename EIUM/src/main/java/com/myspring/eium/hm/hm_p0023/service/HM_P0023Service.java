package com.myspring.eium.hm.hm_p0023.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0023.vo.HM_P0023VO;

public interface HM_P0023Service {

	List<HM_P0023VO> appointList(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0023VO> appointSearch_p01(Map<String, Object> searchMap) throws DataAccessException;

	void saveData(Map<String, String[]> dataMap) throws DataAccessException;

	List<HM_P0023VO> masterEmployee_p02(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0023VO> homeEmployeeSearch(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0023VO> homeSearch_p03(Map<String, Object> searchMap) throws DataAccessException;

	void saveData2(Map<String, String[]> dataMap) throws DataAccessException;

}

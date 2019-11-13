package com.myspring.eium.hm.hm_p0022.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0022.vo.HM_P0022VO;

public interface HM_P0022Service {

	List<HM_P0022VO> appointList(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> appointSearch_p01(Map<String, Object> searchMap) throws DataAccessException;

	void saveData(Map<String, String[]> dataMap) throws DataAccessException;

	List<HM_P0022VO> masterEmployee_p02(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeEmployeeSearch(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeSearch_p03(Map<String, Object> searchMap) throws DataAccessException;

}

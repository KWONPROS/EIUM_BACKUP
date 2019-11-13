package com.myspring.eium.hm.hm_p0022.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0022.vo.HM_P0022VO;

public interface HM_P0022DAO {

	List<HM_P0022VO> appointList(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> appointSearch_p01(Map<String, Object> searchMap) throws DataAccessException;

	void insertData(Map<String, String> row) throws DataAccessException ;

	void updateData(Map<String, String> row) throws DataAccessException;

	void deleteData(Map<String, String> row) throws DataAccessException;

	List<HM_P0022VO> masterEmployee_p02(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeEmployeeSearch(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0022VO> homeSearch_p03(Map<String, Object> searchMap) throws DataAccessException;

}

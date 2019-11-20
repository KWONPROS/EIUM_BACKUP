package com.myspring.eium.hm.hm_p0023.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0023.vo.HM_P0023VO;

public interface HM_P0023DAO {

	List<HM_P0023VO> appointList(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0023VO> appointSearch_p01(Map<String, Object> searchMap) throws DataAccessException;

	void insertData(Map<String, String> row) throws DataAccessException ;

	void updateData(Map<String, String> row) throws DataAccessException;

	void deleteData(Map<String, String> row) throws DataAccessException;

	List<HM_P0023VO> masterEmployee_p02(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0023VO> homeEmployeeSearch(Map<String, Object> searchMap) throws DataAccessException;

	List<HM_P0023VO> homeSearch_p03(Map<String, Object> searchMap) throws DataAccessException;

	void insertData2(Map<String, String> row) throws DataAccessException;

	void updateData2(Map<String, String> row) throws DataAccessException;

	void deleteData2(Map<String, String> row) throws DataAccessException;

}

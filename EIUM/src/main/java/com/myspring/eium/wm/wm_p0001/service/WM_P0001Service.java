package com.myspring.eium.wm.wm_p0001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.wm.wm_p0001.vo.WM_P0001VO;



public interface WM_P0001Service {
	public List<WM_P0001VO> EMP_searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<WM_P0001VO> WS_searchList(Map<String, String> searchMap) throws DataAccessException;
	public void saveData(Map<String, String[]> dataMap, String P_EMPLOYEE_CODE)  throws DataAccessException ;
	public void TWS_saveData(Map<String, String[]> dataMap, String PP_EMPLOYEE_CODE, String P_PAYMENT_CODE)  throws DataAccessException ;
}

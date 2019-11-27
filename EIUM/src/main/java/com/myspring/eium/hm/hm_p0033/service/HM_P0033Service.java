package com.myspring.eium.hm.hm_p0033.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0033.vo.HM_P0033VO;

public interface HM_P0033Service {
	public void saveData(Map<String, String[]> dataMap, String user, String x, String y)  throws DataAccessException ;
	public List<HM_P0033VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0033VO> searchTypeList(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0033VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0033VO> searchReceipt(Map<String, Object> searchMap)throws DataAccessException;
	public List<HM_P0033VO> paygrade_searchData(Map<String, Object> searchMap)throws DataAccessException;
	public List<HM_P0033VO> BankList(Map<String, Object> searchMap)throws DataAccessException;

}

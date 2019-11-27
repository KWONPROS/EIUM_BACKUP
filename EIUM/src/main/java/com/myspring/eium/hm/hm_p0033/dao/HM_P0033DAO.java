package com.myspring.eium.hm.hm_p0033.dao;



import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0033.vo.HM_P0033VO;




public interface HM_P0033DAO {
	public List<HM_P0033VO> typeList(Map<String, Object> searchMap) throws DataAccessException;
	public List<HM_P0033VO> paydate_searchList(Map<String, Object> searchMap)throws DataAccessException;
	public List<HM_P0033VO> searchList(Map<String, Object> searchMap)throws DataAccessException;

	public void insertData(Map<String, String> row) throws DataAccessException;

	public void updateData(Map<String, String> row) throws DataAccessException;

	public void deleteData(Map<String, String> row) throws DataAccessException;
	public List<HM_P0033VO> searchReceipt(Map<String, Object> searchMap)throws DataAccessException;
	public List<HM_P0033VO> paygradeList(Map<String, Object> searchMap)throws DataAccessException;
	public List<HM_P0033VO> BankList(Map<String, Object> searchMap)throws DataAccessException;

	
	 
}

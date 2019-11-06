package com.myspring.eium.hm.hm_p0018.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.hm.hm_p0018.vo.HM_P0018VO;



public interface HM_P0018DAO {

	public List<HM_P0018VO> searchList(Map<String, Object> searchMap);


	public void insertData(Map<String, String> row)throws DataAccessException;

	public void updateData(Map<String, String> row)throws DataAccessException;

	public void deleteData(Map<String, String> row)throws DataAccessException;
}

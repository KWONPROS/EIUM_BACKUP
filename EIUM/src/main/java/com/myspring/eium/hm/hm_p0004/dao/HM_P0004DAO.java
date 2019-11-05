package com.myspring.eium.hm.hm_p0004.dao;



import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.eium.hm.hm_p0004.vo.HM_P0004VO;


public interface HM_P0004DAO {
	 public List<HM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

		public void insertData(Map<String, String> row) throws DataAccessException;

		public void updateData(Map<String, String> row) throws DataAccessException;

		public void deleteData(Map<String, String> row) throws DataAccessException;

		public List<HM_P0004VO> searchList2(Map<String, Object> searchMap)throws DataAccessException;

	

	 
}

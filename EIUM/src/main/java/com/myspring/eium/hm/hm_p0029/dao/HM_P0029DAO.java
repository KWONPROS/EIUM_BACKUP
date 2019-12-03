package com.myspring.eium.hm.hm_p0029.dao;



import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.eium.hm.hm_p0029.vo.HM_P0029VO;


public interface HM_P0029DAO {
	 public List<HM_P0029VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

		public void insertData(Map<String, String> row) throws DataAccessException;

		public void updateData(Map<String, String> row) throws DataAccessException;

		public void deleteData(Map<String, String> row) throws DataAccessException;

		public List<HM_P0029VO> searchList2(Map<String, Object> searchMap)throws DataAccessException;

		public void saveFile(Map<String, Object> dataMap ) throws DataAccessException;

		public Map<String, Object> getByteImage(Map<String, Object> searchMap);

		//사업장 팝업 dao
		public List<HM_P0029VO> searchList_site(Map<String, Object> searchMap)throws DataAccessException;

	

	 
}

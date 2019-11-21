package com.myspring.eium.pm.pm_p0009.dao;





import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.eium.pm.pm_p0009.vo.PM_P0009VO;




public interface PM_P0009DAO {
	 public List<PM_P0009VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

		public void insertData(Map<String, String> row) throws DataAccessException;

		public void updateData(Map<String, String> row) throws DataAccessException;

		public void deleteData(Map<String, String> row) throws DataAccessException;

		public List<PM_P0009VO> searchList2(Map<String, Object> searchMap)throws DataAccessException;

		public void saveFile(Map<String, Object> dataMap ) throws DataAccessException;

		public Map<String, Object> getByteImage(Map<String, Object> searchMap);

	

	 
}

package com.myspring.eium.pm.pm_p0009.service;




import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myspring.eium.pm.pm_p0009.vo.PM_P0009VO;



public interface PM_P0009Service {
	public List<PM_P0009VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException;
	public List<PM_P0009VO> searchList2(Map<String, Object> searchMap) throws DataAccessException;
	public void saveFile(Map<String,Object> dataMap);
	

}

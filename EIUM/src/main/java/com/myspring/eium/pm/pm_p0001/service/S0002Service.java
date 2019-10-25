package com.myspring.eium.pm.pm_p0001.service;




import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.myspring.eium.pm.pm_p0001.vo.S0002VO;





public interface S0002Service {
	 public List<S0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException ;
}
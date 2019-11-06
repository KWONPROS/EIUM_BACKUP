package com.myspring.eium.wm.wm_p0002.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.wm.wm_p0002.vo.WM_P0002VO;

public interface WM_P0002Service {
	 public List<WM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
	 public List<WM_P0002VO> searchSiteList(Map<String, Object> searchMap);
	 public List<WM_P0002VO> searchDeptList(Map<String, Object> searchMap);
	 public List<WM_P0002VO> searchEmployeeList(Map<String, Object> searchMap);
}

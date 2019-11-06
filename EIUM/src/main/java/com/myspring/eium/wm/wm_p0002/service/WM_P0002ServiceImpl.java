package com.myspring.eium.wm.wm_p0002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.wm.wm_p0002.dao.WM_P0002DAO;
import com.myspring.eium.wm.wm_p0002.vo.WM_P0002VO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class WM_P0002ServiceImpl implements WM_P0002Service {
	@Autowired
	private WM_P0002DAO WM_P0002DAO;
	
	@Override
	public List<WM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0002VO> list =  WM_P0002DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public List<WM_P0002VO> searchSiteList(Map<String, Object> searchMap) {
		List<WM_P0002VO> list=WM_P0002DAO.searchSiteList(searchMap);

		return list;
	}

	@Override
	public List<WM_P0002VO> searchDeptList(Map<String, Object> searchMap) {
		List<WM_P0002VO> list=WM_P0002DAO.searchDeptList(searchMap);

		return list;
	}

	public List<WM_P0002VO> searchEmployeeList(Map<String, Object> searchMap) {
		List<WM_P0002VO> list=WM_P0002DAO.searchEmployeeList(searchMap);

		return list;
	}

}

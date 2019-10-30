package com.myspring.eium.sm.sm_p0006.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0006.dao.P0006DAO;
import com.myspring.eium.sm.sm_p0006.vo.P0006VO;


@Service
@Transactional(propagation = Propagation.REQUIRED)
public class P0006ServiceImpl implements P0006Service {
	@Autowired
	private P0006DAO p0006DAO;
	
	@Override
	public List<P0006VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<P0006VO> list =  p0006DAO.searchList(searchMap); 
		return list;
	}

}

package com.myspring.eium.sm.sm_p0006.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0006.vo.SM_P0006VO;

public interface SM_P0006Service {
	 public List<SM_P0006VO> searchList(Map<String, Object> searchMap) throws DataAccessException;
}

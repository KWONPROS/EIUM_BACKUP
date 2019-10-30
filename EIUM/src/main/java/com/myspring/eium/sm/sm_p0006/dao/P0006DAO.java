package com.myspring.eium.sm.sm_p0006.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.sm.sm_p0006.vo.P0006VO;

public interface P0006DAO {

	public List<P0006VO> searchList(Map<String, Object> searchMap) throws DataAccessException;

}

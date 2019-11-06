package com.myspring.eium.wm.wm_p0002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;
import com.myspring.eium.wm.wm_p0002.vo.WM_P0002VO;

@Repository
public class WM_P0002DAOImpl implements WM_P0002DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0002VO> list = sqlSession.selectList("mapper.wm_p0002.searchList", searchMap);
		return list;
	}

	@Override
	public List<WM_P0002VO> searchSiteList(Map<String, Object> searchMap) {
		List<WM_P0002VO> list = sqlSession.selectList("mapper.wm_p0002.searchSiteList", searchMap);
		return list;
	}

	@Override
	public List<WM_P0002VO> searchDeptList(Map<String, Object> searchMap) {
		List<WM_P0002VO> list = sqlSession.selectList("mapper.wm_p0002.searchDeptList", searchMap);
		return list;
	}
	
	@Override
	public List<WM_P0002VO> searchEmployeeList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0002VO> list = sqlSession.selectList("mapper.wm_p0002.searchEmployeeList", searchMap);
		return list;
	}

}

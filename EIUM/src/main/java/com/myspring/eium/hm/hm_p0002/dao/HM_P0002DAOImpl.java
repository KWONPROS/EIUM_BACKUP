package com.myspring.eium.hm.hm_p0002.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0002.vo.HM_P0002VO;





@Repository
public class HM_P0002DAOImpl implements HM_P0002DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<HM_P0002VO> list = sqlSession.selectList("mapper.hm_p0002.searchList", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0002VO> searchSelect(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<HM_P0002VO> list = sqlSession.selectList("mapper.hm_p0002.searchSelect", searchMap);
		return list;
	}
	
	
	
	@Override
	public List<HM_P0002VO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<HM_P0002VO> list = sqlSession.selectList("mapper.hm_p0002.searchSiteList", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0002VO> searchJobclassList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<HM_P0002VO> list = sqlSession.selectList("mapper.hm_p0002.searchJobclassList", searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0002.insertData", row);
		
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0002.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0002.deleteData", row);
	}
	
	
	
	
	@Override
	public void insertData2(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0002.insertData2", row);
		
	}

	@Override
	public void updateData2(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0002.updateData2", row);
	}

	@Override
	public void deleteData2(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0002.deleteData2", row);
	}
	
	

}

package com.myspring.eium.hm.hm_p0023.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0023.vo.HM_P0023VO;

@Repository
public class HM_P0023DAOImpl implements HM_P0023DAO{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<HM_P0023VO> appointList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0023VO> list = sqlSession.selectList("mapper.hm_p0023.appointList", searchMap);
	
		return list;
	}
	
	@Override
	public List<HM_P0023VO> appointSearch_p01(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0023VO> list = sqlSession.selectList("mapper.hm_p0023.appointSearch_p01", searchMap);
	
		return list;
	}
	

	@Override
	public List<HM_P0023VO> masterEmployee_p02(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0023VO> list = sqlSession.selectList("mapper.hm_p0023.masterEmployee_p02", searchMap);
	
		return list;
	}
	@Override
	public List<HM_P0023VO> homeSearch_p03(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0023VO> list = sqlSession.selectList("mapper.hm_p0023.homeSearch_p03", searchMap);
	
		return list;
	}
	@Override
	public List<HM_P0023VO> homeEmployeeSearch(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0023VO> list = sqlSession.selectList("mapper.hm_p0023.homeEmployeeSearch", searchMap);
	
		return list;
	}
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0023.insertData", row);
		
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0023.updateData", row);
		
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0023.deleteData", row);
		
	}
	
	@Override
	public void insertData2(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0023.insertData2", row);
		
	}

	@Override
	public void updateData2(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0023.updateData2", row);
		
	}

	@Override
	public void deleteData2(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0023.deleteData2", row);
		
	}
	
	
	
}

package com.myspring.eium.sm.sm_p0003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.sm.sm_p0003.vo.P0003VO;

@Repository("P0003DAO")
public class P0003DAOImpl implements P0003DAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<P0003VO> list = sqlSession.selectList("departure.searchDep", searchMap);
		System.out.println("++++++dao"+searchMap);
		return list;
	}
	


	@Override
	public void insertData(Map<String, String> row) {
		sqlSession.update("departure.insertData", row);
		
	}

	@Override
	public void updateData(Map<String, String> row) {
		sqlSession.update("departure.updateData", row);
		
	}

	@Override
	public void deleteData(Map<String, String> row) {
		sqlSession.update("departure.deleteData", row);
		
	}
	
	
	
	
	
	
	@Override
	public List<P0003VO> searchpopup(Map<String, Object> searchMap) throws DataAccessException {
		List<P0003VO> list = sqlSession.selectList("departure.searchPopup", searchMap);
		return list;
	}
	
	@Override
	public void insertDatapopup(Map<String, String> row) {
		sqlSession.update("departure.insertDataPopup", row);
		
	}

	@Override
	public void updateDatapopup(Map<String, String> row) {
		sqlSession.update("departure.updateDataPopup", row);
		
	}

	@Override
	public void deleteDatapopup(Map<String, String> row) {
		sqlSession.update("departure.deleteDataPopup", row);
		
	}



	@Override
	public List<P0003VO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<P0003VO> list = sqlSession.selectList("departure.searchSiteList", searchMap);
		return list;
	}


	
	
	
}

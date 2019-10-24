package com.myspring.eium.sm.sm_p0003.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.sm.sm_p0003.vo.DepartureVO;

@Repository("departureDAO")
public class DepartureDAOImpl implements DepartureDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DepartureVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<DepartureVO> list = sqlSession.selectList("departure.searchDep", searchMap);
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
	public List<DepartureVO> searchpopup(Map<String, Object> searchMap) throws DataAccessException {
		List<DepartureVO> list = sqlSession.selectList("departure.searchPopup", searchMap);
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
	public List<DepartureVO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<DepartureVO> list = sqlSession.selectList("departure.searchSiteList", searchMap);
		return list;
	}


	
	
	
}

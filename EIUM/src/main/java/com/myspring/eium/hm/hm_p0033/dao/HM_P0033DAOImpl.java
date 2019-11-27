package com.myspring.eium.hm.hm_p0033.dao;




import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.hm.hm_p0033.vo.HM_P0033VO;




@Repository
public class HM_P0033DAOImpl implements HM_P0033DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<HM_P0033VO> typeList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list = sqlSession.selectList("mapper.pm_p0033.typeList", searchMap);
		return list;
	}
	
	
	
	@Override
	public List<HM_P0033VO> paygradeList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list = sqlSession.selectList("mapper.pm_p0033.paygradeList", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0033VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list = sqlSession.selectList("mapper.pm_p0033.paydate_searchList", searchMap);
		return list;
	}
	
	
	@Override
	public List<HM_P0033VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list = sqlSession.selectList("mapper.pm_p0033.searchList", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0033VO> searchReceipt(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list = sqlSession.selectList("mapper.pm_p0033.searchReceipt", searchMap);
		return list;
	}
	
	@Override
	public List<HM_P0033VO> BankList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list = sqlSession.selectList("mapper.pm_p0033.BankList", searchMap);
		return list;
	}
	


	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0033.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0033.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0033.deleteData", row);
	}

	

}

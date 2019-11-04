package com.myspring.eium.pm.pm_p0001.dao;




import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.pm.pm_p0001.vo.PM_P0001VO;




@Repository("s0002DAO")
public class PM_P0001DAOImpl implements PM_P0001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PM_P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		System.out.println("searchMAp: "+searchMap);
		List<PM_P0001VO> list = sqlSession.selectList("hm.s0002.searchList", searchMap);
		return list;
	}

	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hm.s0002.insertData", row);
	}

	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hm.s0002.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("hm.s0002.deleteData", row);
	}

}

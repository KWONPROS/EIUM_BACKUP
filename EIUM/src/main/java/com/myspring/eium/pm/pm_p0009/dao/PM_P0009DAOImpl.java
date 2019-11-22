package com.myspring.eium.pm.pm_p0009.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.eium.pm.pm_p0009.vo.PM_P0009VO;



@Repository
public class PM_P0009DAOImpl implements PM_P0009DAO {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	PM_P0009VO p0009Vo;
	

	@Override
	public List<PM_P0009VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0009VO> list = sqlSession.selectList("mapper.pm_p0009.searchList", searchMap);
		return list;
	}
	@Override
	public List<PM_P0009VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0009VO> list = sqlSession.selectList("mapper.pm_p0009.searchList2", searchMap);
		return list;
	}
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0009.insertData", row);
		sqlSession.update("mapper.pm_p0009.insertData2", row);
		sqlSession.update("mapper.pm_p0009.insertData3", row);
	}



	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0009.updateData", row);
		sqlSession.update("mapper.pm_p0009.updateData2", row);
		sqlSession.update("mapper.pm_p0009.updateData3", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.pm_p0009.deleteData", row);
	}
	
	@Override
	public void saveFile(Map<String, Object> dataMap ) throws DataAccessException {
		
		sqlSession.update("mapper.pm_p0009.insertFile", dataMap);
	}
	@Override
	public Map<String, Object> getByteImage(Map<String, Object> searchMap) {
		return sqlSession.selectOne("mapper.pm_p0009.getByteImage" ,searchMap);
	}

	

}

package com.myspring.eium.hm.hm_p0029.dao;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.myspring.eium.hm.hm_p0029.vo.HM_P0029VO;



@Repository
public class HM_P0029DAOImpl implements HM_P0029DAO {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	HM_P0029VO p0029Vo;
	

	@Override
	public List<HM_P0029VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list = sqlSession.selectList("mapper.hm_p0029.searchList", searchMap);
		return list;
	}
	@Override
	public List<HM_P0029VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list = sqlSession.selectList("mapper.hm_p0029.searchList2", searchMap);
		return list;
	}
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0029.insertData", row);
		sqlSession.update("mapper.hm_p0029.insertData2", row);
		sqlSession.update("mapper.hm_p0029.insertData3", row);
	}



	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0029.updateData", row);
		sqlSession.update("mapper.hm_p0029.updateData2", row);
		sqlSession.update("mapper.hm_p0029.updateData3", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.hm_p0029.deleteData", row);
	}
	
	@Override
	public void saveFile(Map<String, Object> dataMap ) throws DataAccessException {
		
		sqlSession.update("mapper.hm_p0029.insertFile", dataMap);
	}
	@Override
	public Map<String, Object> getByteImage(Map<String, Object> searchMap) {
		return sqlSession.selectOne("mapper.hm_p0029.getByteImage" ,searchMap);
	}

	

}

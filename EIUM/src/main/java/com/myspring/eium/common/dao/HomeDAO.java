package com.myspring.eium.common.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.myspring.eium.common.vo.HomeVO;

@Repository("HomeDAO")
public class HomeDAO{
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	HomeVO homeVO;
	

	public HomeVO findId(Map<String, Object> searchMap) {
		homeVO = sqlSession.selectOne("mapper.common.findId",searchMap);
		return homeVO;
	}
	public HomeVO findPwd(Map<String, Object> searchMap) {
		homeVO = sqlSession.selectOne("mapper.common.findPwd", searchMap);
		return homeVO;
	}
	
	public List<HomeVO> findAll(){
		List<HomeVO> list = sqlSession.selectList("mapper.common.findAll");
		return list;
	}
	
}

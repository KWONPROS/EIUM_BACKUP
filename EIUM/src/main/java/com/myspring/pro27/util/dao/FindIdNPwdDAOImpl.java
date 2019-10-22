package com.myspring.pro27.util.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.pro27.util.vo.FindIdNPwdVO;

@Repository("FindIdNPwdDAO")
public class FindIdNPwdDAOImpl implements FindIdNPwdDAO {
	@Autowired
	private SqlSession sqlSession;
	@Autowired
	FindIdNPwdVO FindIdNPwdvO;
	

	public FindIdNPwdVO findId(Map<String, Object> searchMap) {
		FindIdNPwdvO = sqlSession.selectOne("mapper.util.findId",searchMap);
		return FindIdNPwdvO;
	}
	public FindIdNPwdVO findPwd(Map<String, Object> searchMap) {
		FindIdNPwdvO = sqlSession.selectOne("mapper.util.findPwd", searchMap);
		return FindIdNPwdvO;
	}
	

}

package com.myspring.pro27.util.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.pro27.util.vo.FindIdNPwdVO;

@Repository("FindIdNPwdDAO")
public class FindIdNPwdDAOImpl implements FindIdNPwdDAO {
	@Autowired
	private SqlSession sqlSession;

	public FindIdNPwdVO findId(FindIdNPwdVO findIdNPwdVO) {
		findIdNPwdVO = sqlSession.selectOne("mapper.util.findId");
		return findIdNPwdVO;
	}
	public FindIdNPwdVO findPwd(FindIdNPwdVO findIdNPwdVO) {
		findIdNPwdVO = sqlSession.selectOne("mapper.util.findId");
		return findIdNPwdVO;
	}
	

}

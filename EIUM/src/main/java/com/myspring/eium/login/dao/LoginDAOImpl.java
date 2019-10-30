package com.myspring.eium.login.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.eium.login.vo.LoginVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	@Autowired
	private SqlSession sqlSession;


	@Override
	public LoginVO loginById(LoginVO loginVO) throws DataAccessException {
		LoginVO vo = sqlSession.selectOne("mapper.login.loginById", loginVO);
		return vo;
	}
}

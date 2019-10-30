package com.myspring.eium.login.dao;

import org.springframework.dao.DataAccessException;

import com.myspring.eium.login.vo.LoginVO;


public interface LoginDAO {
	
	
	 public LoginVO loginById(LoginVO loginVO) throws DataAccessException ;

}

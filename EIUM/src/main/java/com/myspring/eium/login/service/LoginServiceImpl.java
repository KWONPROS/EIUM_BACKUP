package com.myspring.eium.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.login.dao.LoginDAO;
import com.myspring.eium.login.vo.LoginVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO loginDAO;


	@Override
	public LoginVO login(LoginVO loginVO) throws Exception {
		return loginDAO.loginById(loginVO); 
	}
}

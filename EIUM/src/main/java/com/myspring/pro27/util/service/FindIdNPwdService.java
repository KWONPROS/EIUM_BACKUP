package com.myspring.pro27.util.service;

import java.util.Map;

import com.myspring.pro27.util.vo.FindIdNPwdVO;

public interface FindIdNPwdService {
	 
	

	 public void mailSender(FindIdNPwdVO findIdNPwdVO) throws Exception;

	 public FindIdNPwdVO findInfo(Map<String, Object> searchMap) throws Exception;
}

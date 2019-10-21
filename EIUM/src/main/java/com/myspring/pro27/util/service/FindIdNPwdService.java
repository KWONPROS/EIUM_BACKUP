package com.myspring.pro27.util.service;

import com.myspring.pro27.util.vo.FindIdNPwdVO;

public interface FindIdNPwdService {
	 
	 public FindIdNPwdVO findInfo(FindIdNPwdVO findIdNPwdVO) throws Exception;

	 public void mailSender(FindIdNPwdVO findIdNPwdVO) throws Exception;
}

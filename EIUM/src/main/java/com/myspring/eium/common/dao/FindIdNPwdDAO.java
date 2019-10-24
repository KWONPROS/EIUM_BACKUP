package com.myspring.pro27.util.dao;

import java.util.Map;

import com.myspring.pro27.util.vo.FindIdNPwdVO;


public interface FindIdNPwdDAO {

	public FindIdNPwdVO findId(Map<String, Object> searchMap);
	public FindIdNPwdVO findPwd(Map<String, Object> searchMap);

}

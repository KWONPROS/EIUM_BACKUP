package com.myspring.pro27.util.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.pro27.util.vo.FindIdNPwdVO;

public interface FindIdNPwdController {

	public ModelAndView findInfo(FindIdNPwdVO FindIdNPwdVo, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
}

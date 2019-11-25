package com.myspring.eium.hm.hm_p0023.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.hm.hm_p0023.service.HM_P0023Service;
import com.myspring.eium.hm.hm_p0023.vo.HM_P0023VO;

@Controller
public class HM_P0023ControllerImpl implements HM_P0023Controller{
	@Autowired
	HM_P0023Service hM_P0023Service;
	
	@Autowired
	HM_P0023VO hM_P0023VO;
	
	@Override
	@RequestMapping(value = "hm/p0023/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView homeInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0023/p0023_home");
	
		return mav;

	}
	@Override
	@RequestMapping(value = "hm/p0023/departmentSearch_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView departmentSearch_p01(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0023/departmentSearch_p01");
	
		return mav;
	}
	@Override
	@RequestMapping(value = "hm/p0023/employeeSearch_p02.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView employeeSearch_p02(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0023/employeeSearch_p02");
	
		return mav;
	
	}
	
	
}
	
	
	


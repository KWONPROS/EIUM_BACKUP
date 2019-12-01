package com.myspring.eium.pm.pm_p0010.controller;


import java.util.Enumeration;
import java.util.HashMap;

import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;



@Controller
public class PM_P0010ControllerImpl implements PM_P0010Controller {
	private static final Logger logger = LoggerFactory.getLogger(PM_P0010ControllerImpl.class);


	
	@Override
	@RequestMapping(value = "/pm/p0010/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("pm/pm_p0010/p0010_home");
	
		return mav;
	} 

		
	

}

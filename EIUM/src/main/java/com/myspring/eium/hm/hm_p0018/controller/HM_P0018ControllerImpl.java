package com.myspring.eium.hm.hm_p0018.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HM_P0018ControllerImpl implements HM_P0018Controller{
	private static final Logger logger = LoggerFactory.getLogger(HM_P0018ControllerImpl.class);
	
	
	@Override
	@RequestMapping(value = "hm/p0018/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView educationInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0018/p0018_home");
	
		return mav;
	} 
	

}

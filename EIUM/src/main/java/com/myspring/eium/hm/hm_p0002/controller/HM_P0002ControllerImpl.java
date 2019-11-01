package com.myspring.eium.hm.hm_p0002.controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.sm.sm_p0002.service.SM_P0002Service;
import com.myspring.eium.sm.sm_p0002.vo.SM_P0002VO;






@Controller
public class HM_P0002ControllerImpl implements HM_P0002Controller{
	private static final Logger logger = LoggerFactory.getLogger(HM_P0002ControllerImpl.class);
	
	@Autowired
	private SM_P0002Service sM_P0002Service;
	
	@Autowired
	SM_P0002VO sM_P0003VO;
	
	
	@Override
	@RequestMapping(value = "hm/p0002/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView paymentInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("/hm/hm_p0002/p0002_home");
	
		return mav;
	} 
	

	
	

}

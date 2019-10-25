package com.myspring.eium.common.controller;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.myspring.eium.common.service.HomeService;
import com.myspring.eium.common.vo.HomeVO;


@Controller
public class HomeController {
	@Autowired 
	SessionLocaleResolver localeResolver; 
	@Autowired 
	MessageSource messageSource;
	@Autowired 
	HomeService homeService;
	@Autowired 
	HomeVO homeVO;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}

	@RequestMapping(value = "/login.do", method =  RequestMethod.GET)
	public String Login( Locale locale,HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/common/cm_login";
	}
	
	
	@RequestMapping(value = "/findIdNPwd.do", method = RequestMethod.GET)
	public ModelAndView findInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/common/cm_login_p01");

		mav.addObject("command", request.getParameter("command"));

		if (request.getParameter("EMPLOYEE_CODE") != null) {
			
			Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
			
			searchMap.put("EMPLOYEE_CODE", request.getParameter("EMPLOYEE_CODE"));
			searchMap.put("EMPLOYEE_ID", request.getParameter("EMPLOYEE_ID"));
			searchMap.put("EMAIL", request.getParameter("EMAIL"));
			
	
			HomeVO reVo = homeService.findInfo(searchMap);
			mav = new ModelAndView("/common/cm_login_p02");

			homeService.mailSender(reVo);
		}

		return mav;

	}
	
}


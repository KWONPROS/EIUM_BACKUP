package com.myspring.pro27.util.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.myspring.pro27.util.service.FindIdNPwdService;
import com.myspring.pro27.util.vo.FindIdNPwdVO;

@Controller
public class FindIdNPwdControllerImpl implements FindIdNPwdController {
	@Autowired
	FindIdNPwdService findIdNPwdservice;
	@Autowired
	FindIdNPwdVO FindIdNPwdvO;

	@Override
	@RequestMapping(value = "/util/findIdNPwd.do", method = RequestMethod.GET)
	public ModelAndView findInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/util/findIdNPwd");

		mav.addObject("command", request.getParameter("command"));

		if (request.getParameter("EMPLOYEE_CODE") != null) {
			
			Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
			
			searchMap.put("EMPLOYEE_CODE", request.getParameter("EMPLOYEE_CODE"));
			searchMap.put("EMPLOYEE_ID", request.getParameter("EMPLOYEE_ID"));
			searchMap.put("EMAIL", request.getParameter("EMAIL"));
			
	
			FindIdNPwdVO reVo = findIdNPwdservice.findInfo(searchMap);
			mav = new ModelAndView("/util/findIdNPwdResult");

			findIdNPwdservice.mailSender(reVo);
		}

		return mav;

	}
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}

}

package com.myspring.eium.sm.sm_p0006.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.sm.sm_p0006.service.SM_P0006Service;
import com.myspring.eium.sm.sm_p0006.vo.SM_P0006VO;



@Controller
public class SM_P0006ControllerImpl implements SM_P0006Controller{
	private static final Logger logger = LoggerFactory.getLogger(SM_P0006ControllerImpl.class);
	
	@Autowired
	SM_P0006Service sM_P0006Service;
	@Autowired
	SM_P0006VO sM_P0006VO;
	
	@Override
	@RequestMapping(value = "/sm/p0006/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("sm/sm_p0006/p0006");
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/sm/p0006/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		searchMap.put("p_employee__code", request.getParameter("p_employee__code"));
		
		List<SM_P0006VO> data = sM_P0006Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}

	
}

package com.myspring.eium.hm.hm_p0004.controller;



import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.hm.hm_p0004.service.HM_P0004Service;
import com.myspring.eium.hm.hm_p0004.vo.HM_P0004VO;

@Controller
public class HM_P0004ControllerImpl implements HM_P0004Controller {
	private static final Logger logger = LoggerFactory.getLogger(HM_P0004ControllerImpl.class);

	@Autowired
	HM_P0004Service p0004Service;
	
	
	@Override
	@RequestMapping(value = "/hm/p0004/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0004/p0004_home");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0004/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("command", request.getParameter("command"));
		List<HM_P0004VO> data = p0004Service.searchList(searchMap);

        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/hm/p0004/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		Map<String, String> searchMap = new HashMap<String, String>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 	
		searchMap.put("emp_CODE", request.getParameter("emp_CODE"));
		List<HM_P0004VO> data = p0004Service.searchList2(searchMap);
		resultMap.put("Data", data);
		System.out.println("resultMap::::"+data.get(0).getEmail());
		return resultMap;
	}
	

	@Override
	@RequestMapping(value = "/hm/p0004/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		String table_NAME = request.getParameter("table_NAME");
		
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			p0004Service.saveData(dataMap,table_NAME);	
			result.put("Code","0");
			result.put("Message","저장성공");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","저장실패");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);        
        return resultMap;
	}

	
}

package com.myspring.eium.pm.pm_p0001.controller;


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

import com.myspring.eium.hm.hm_p0002.vo.HM_P0002VO;
import com.myspring.eium.pm.pm_p0001.service.PM_P0001Service;
import com.myspring.eium.pm.pm_p0001.vo.PM_P0001VO;




@Controller
public class PM_P0001ControllerImpl implements PM_P0001Controller {
	private static final Logger logger = LoggerFactory.getLogger(PM_P0001ControllerImpl.class);
	Map<String, Object> dateMap = new HashMap<String, Object>();
	@Autowired
	PM_P0001Service p0001Service;
	
	@Override
	@RequestMapping(value = "/pm/p0001/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("pm/pm_p0001/p0001_home");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/pm/p0001/searchPaymentdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView paymentdateSerch_init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		dateMap.put("date", request.getParameter("monthpicker"));
		System.out.println("1");
		System.out.println(request.getParameter("monthpicker"));
		
		ModelAndView mav = new ModelAndView("pm/pm_p0001/p0001_Payment_date");
		
		mav.addObject("monthpicker",request.getParameter("monthpicker"));
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/pm/p0001/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		searchMap.put("Ppayment_date", request.getParameter("Ppayment_date"));
		searchMap.put("searchTYPE", request.getParameter("searchTYPE"));
		searchMap.put("searchDetail", request.getParameter("searchDetail"));


		System.out.println(request.getParameter("Ppayment_date"));
		System.out.println(request.getParameter("searchTYPE"));
		System.out.println(request.getParameter("searchDetail"));

		List<PM_P0001VO> data = p0001Service.searchList(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	

	
	@Override
	@RequestMapping(value = "/pm/p0001/searchPaymentdateList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map payment_searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		searchMap= dateMap;
		List<PM_P0001VO> data = p0001Service.paydate_searchList(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}

	@Override
	@RequestMapping(value = "pm/p0001/TypeList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchTypeList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // ???????
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ??????
		
		// ??????????
		searchMap.put("searchTYPE", request.getParameter("searchTYPE"));
		System.out.println(request.getParameter("searchTYPE"));
		//?????? ???
		List<PM_P0001VO> data = p0001Service.searchTypeList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/pm/p0001/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 占쏙옙占쏙옙占쏙옙Data
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 처占쏙옙占쏙옙占�
		
		// 저장 Data 추출하기
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			p0001Service.saveData(dataMap);	
			result.put("Code","0");
			result.put("Message","저장되었습니다");
		}catch(Exception e) {                                                               
			result.put("Code","-1");
			result.put("Message","저장에 실패하였습니다");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);         
        return resultMap;
	}


}

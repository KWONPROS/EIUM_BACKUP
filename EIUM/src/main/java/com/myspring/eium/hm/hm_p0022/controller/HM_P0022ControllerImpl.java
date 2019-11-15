package com.myspring.eium.hm.hm_p0022.controller;

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

import com.myspring.eium.hm.hm_p0021.vo.HM_P0021VO;
import com.myspring.eium.hm.hm_p0022.service.HM_P0022Service;
import com.myspring.eium.hm.hm_p0022.vo.HM_P0022VO;

@Controller
public class HM_P0022ControllerImpl implements HM_P0022Controller{
	@Autowired
	HM_P0022Service hM_P0022Service;
	
	@Autowired
	HM_P0022VO hM_P0022VO;
	
	@Override
	@RequestMapping(value = "hm/p0022/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView homeInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0022/p0022_home");
	
		return mav;
	
	
	}
	
	
	
	
	
	//search
	
	@Override
	@RequestMapping(value = "/hm/p0022/appointList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map appointList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		searchMap.put("date", request.getParameter("date"));
		searchMap.put("date2", request.getParameter("date2"));
		searchMap.put("title", request.getParameter("title"));
		searchMap.put("masterEmpl", request.getParameter("masterEmpl"));
		searchMap.put("emply", request.getParameter("emplyCode"));
		searchMap.put("emply", request.getParameter("emply"));
		
		List<HM_P0022VO> data = hM_P0022Service.appointList(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0022/appointCodeSearch_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map appointSearch_p01(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
			List<HM_P0022VO> data = hM_P0022Service.appointSearch_p01(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	
	
	@Override
	@RequestMapping(value = "/hm/p0022/homeSearch_p02.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map masterEmployee_p02(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		
		searchMap.put("E_id", request.getParameter("E_id"));
		System.out.println(request.getParameter("E_id"));
		List<HM_P0022VO> data = hM_P0022Service.masterEmployee_p02(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}

	@Override
	@RequestMapping(value = "/hm/p0022/homeSearch_p03.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map homeSearch_p03(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		
		searchMap.put("E_id", request.getParameter("E_id"));
		System.out.println(request.getParameter("E_id"));
		List<HM_P0022VO> data = hM_P0022Service.homeSearch_p03(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}

	
	@Override
	@RequestMapping(value = "/hm/p0022/homeEmployeeSearch.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map homeEmployeeSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		
		
		searchMap.put("param", request.getParameter("param"));
		System.out.println("#########파람이여"+request.getParameter("param"));
		List<HM_P0022VO> data = hM_P0022Service.homeEmployeeSearch(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	

	
	//save
	
	@Override
	@RequestMapping(value = "hm/p0022/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			hM_P0022Service.saveData(dataMap);	
			result.put("Code","0");
			result.put("Message","저장성공");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","저장실패");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result); 
		
        return result;
	}
	@Override
	@RequestMapping(value = "hm/p0022/saveData2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			hM_P0022Service.saveData2(dataMap);	
			result.put("Code","0");
			result.put("Message","저장성공");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","저장실패");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result); 
		
        return result;
	}
	
	
}

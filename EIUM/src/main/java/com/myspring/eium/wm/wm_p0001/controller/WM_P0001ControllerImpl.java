package com.myspring.eium.wm.wm_p0001.controller;


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

import com.myspring.eium.wm.wm_p0001.service.WM_P0001Service;
import com.myspring.eium.wm.wm_p0001.vo.WM_P0001VO;







@Controller
public class WM_P0001ControllerImpl implements WM_P0001Controller {
	private static final Logger logger = LoggerFactory.getLogger(WM_P0001ControllerImpl.class);
	
	@Autowired
	WM_P0001Service p0001Service;
	
	@Override
	@RequestMapping(value = "/wm/p0001/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("wm/wm_p0001/p0001_home");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/wm/p0001/EMP_searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map EMP_searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		
		searchMap.put("P_WS_MONTH", request.getParameter("monthpicker"));
		searchMap.put("searchSite", request.getParameter("searchSite"));
		searchMap.put("searchTYPE", request.getParameter("searchTYPE"));
		searchMap.put("searchDetail", request.getParameter("searchDetail"));
		
		System.out.println(request.getParameter("monthpicker"));
		System.out.println(request.getParameter("searchSite"));
		System.out.println(request.getParameter("searchTYPE"));
		System.out.println(request.getParameter("searchDetail"));
		//데이터 조회
		List<WM_P0001VO> data = p0001Service.EMP_searchList(searchMap);
		
        resultMap.put("Data", data);
    	System.out.println("WM-P0001ControllerImpl-1-resultMap::::" + resultMap);
        return resultMap;
	}

	@Override
	@RequestMapping(value = "/wm/p0001/WS_searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map WS_searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String> searchMap = new HashMap<String, String>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		String P_EMP_CODE = request.getParameter("P_EMP_CODE");
		System.out.println("P_EMP_CODE = " + P_EMP_CODE);
		
		String P_WS_MONTH = request.getParameter("monthpicker");
		System.out.println("P_WS_MONTH = " + P_WS_MONTH);
		
		searchMap.put("P_EMP_CODE", request.getParameter("P_EMP_CODE"));
		searchMap.put("P_WS_MONTH", P_WS_MONTH);
		//데이터 조회
		List<WM_P0001VO> data = p0001Service.WS_searchList(searchMap);
		
        resultMap.put("Data", data);
    	System.out.println("WM-P0001ControllerImpl-2-resultMap::::" + resultMap);
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/wm/p0001/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 占쏙옙占쏙옙占쏙옙Data
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 처占쏙옙占쏙옙占�
		
		String P_EMPLOYEE_CODE = request.getParameter("p_emp_code");
		System.out.println("P_EMPLOYEE_CODE : " + P_EMPLOYEE_CODE);
		
		// 저장 Data 추출하기
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			p0001Service.saveData(dataMap, P_EMPLOYEE_CODE);	
			result.put("Code","0");
			result.put("Message","저장되었습니다");
		}catch(Exception e) {                                                               
			result.put("Code","-1");
			result.put("Message","저장에 실패하였습니다");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);     
		System.out.println("WM-P0001ControllerImpl-saveData1-resultMap::::" + resultMap);
        return resultMap;
	}

	@Override
	@RequestMapping(value = "/wm/p0001/TWS_saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map TWS_saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // 占쏙옙占쏙옙占쏙옙Data
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 처占쏙옙占쏙옙占�
		
		String PP_EMPLOYEE_CODE = request.getParameter("PP_EMP_CODE");
		System.out.println("PP_EMPLOYEE_CODE : " + PP_EMPLOYEE_CODE);
		
		String P_WS_MONTH = request.getParameter("monthpicker");
		System.out.println("P_WS_MONTH : " + P_WS_MONTH);
		// 저장 Data 추출하기
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			p0001Service.TWS_saveData(dataMap, PP_EMPLOYEE_CODE, P_WS_MONTH);	
			result.put("Code","0");
			result.put("Message","저장되었습니다");
		}catch(Exception e) {                                                               
			result.put("Code","-1");
			result.put("Message","저장에 실패하였습니다");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);     
		System.out.println("WM-P0001ControllerImpl-TWS_saveData-resultMap::::" + resultMap);
        return resultMap;
	}
	
	/*
	 * @Override
	 * 
	 * @RequestMapping(value = "/wm/p0001/WS_YN_updateData.do", method = {
	 * RequestMethod.GET, RequestMethod.POST })
	 * 
	 * @ResponseBody public Map WS_YN_updateData(HttpServletRequest request,
	 * HttpServletResponse response) throws Exception {
	 * request.setCharacterEncoding("utf-8"); Map<String, String[]> dataMap = new
	 * HashMap<String, String[]>(); // 占쏙옙占쏙옙占쏙옙Data Map<String, Object> resultMap =
	 * new HashMap<String, Object>(); // 처占쏙옙占쏙옙占�
	 * 
	 * String YN_EMP_CODE = request.getParameter("YN_EMP_CODE");
	 * System.out.println("YN_EMP_CODE : " + YN_EMP_CODE);
	 * 
	 * String YN_WS_MONTH = request.getParameter("monthpicker");
	 * System.out.println("YN_WS_MONTH = " + YN_WS_MONTH);
	 * 
	 * 
	 * 
	 * 
	 * // 저장 Data 추출하기 Enumeration enu = request.getParameterNames(); while
	 * (enu.hasMoreElements()) { String name = (String) enu.nextElement(); String[]
	 * values = request.getParameterValues(name); dataMap.put(name, values); }
	 * 
	 * Map<String, String> result = new HashMap<String, String>(); try {
	 * p0001Service.WS_YN_updateData(YN_EMP_CODE, YN_WS_MONTH);
	 * result.put("Code","0"); result.put("Message","저장되었습니다"); }catch(Exception e)
	 * { result.put("Code","-1"); result.put("Message","저장에 실패하였습니다");
	 * e.printStackTrace(); }
	 * 
	 * resultMap.put("Result", result);
	 * System.out.println("WM-P0001ControllerImpl-WS_YN_updateData-resultMap::::" +
	 * resultMap); return resultMap; }
	 */

}

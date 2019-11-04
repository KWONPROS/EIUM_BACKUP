package com.myspring.eium.hm.hm_p0018.controller;

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

import com.myspring.eium.hm.hm_p0018.service.HM_P0018Service;
import com.myspring.eium.hm.hm_p0018.vo.HM_P0018VO;
import com.myspring.eium.sm.sm_p0001.service.SM_P0001Service;
import com.myspring.eium.sm.sm_p0001.vo.SM_P0001VO;

@Controller
public class HM_P0018ControllerImpl implements HM_P0018Controller{
	private static final Logger logger = LoggerFactory.getLogger(HM_P0018ControllerImpl.class);
	
	@Autowired
	HM_P0018Service hM_P0018Service;
	
	@Autowired
	HM_P0018VO hM_P0018VO;
	
	@Override
	@RequestMapping(value = "hm/p0018/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView EduInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0018/p0018_home");
	
		return mav;
	} 
	@Override
	@RequestMapping(value = "/hm/p0018/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과
		

		//데이터 조회
		List<HM_P0018VO> data = hM_P0018Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "hm/p0018/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
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
			hM_P0018Service.saveData(dataMap);	
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
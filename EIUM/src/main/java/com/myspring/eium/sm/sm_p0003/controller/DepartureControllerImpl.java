package com.myspring.eium.sm.sm_p0003.controller;

import java.util.ArrayList;
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

import com.myspring.eium.sm.sm_p0003.service.DepartureService;
import com.myspring.eium.sm.sm_p0003.vo.DepartureVO;








@Controller("departureController")
public class DepartureControllerImpl implements DepartureController{
	private static final Logger logger = LoggerFactory.getLogger(DepartureControllerImpl.class);
	
	@Autowired
	private DepartureService departureService;
	
	@Autowired
	DepartureVO departureVO;
	

	@Override
	@RequestMapping(value = "/departure/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("SiteList", request.getParameter("SiteList"));
	
		List<DepartureVO> data = departureService.searchList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}


	@Override
	@RequestMapping(value = "/departure/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // ������Daa
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ó�����
		
		// ���� Data �����ϱ�
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			departureService.saveData(dataMap);	
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
	@RequestMapping(value = "/departure/popup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView popup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("departurePopup");
		return mav;
	} 


	@Override
	@RequestMapping(value = "/departure/searchpopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchpopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("p_id", request.getParameter("p_id"));
		
		//������ ��ȸ
		List<DepartureVO> data = departureService.searchpopup(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	

	
	
	@Override
	@RequestMapping(value = "/departure/saveDatapopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveDataPopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>(); // ������Daa
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ó�����
		
		// ���� Data �����ϱ�
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			departureService.saveDatapopup(dataMap);	
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
	@RequestMapping(value = "/departure/SiteList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchSiteList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("p_id", request.getParameter("p_id"));
		
		//������ ��ȸ
		List<DepartureVO> data = departureService.searchSiteList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}

	

}

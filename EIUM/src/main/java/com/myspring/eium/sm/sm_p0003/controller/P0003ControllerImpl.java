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

import com.myspring.eium.sm.sm_p0003.service.P0003Service;
import com.myspring.eium.sm.sm_p0003.vo.P0003VO;








@Controller("P0003Controller")
public class P0003ControllerImpl implements P0003Controller{
	private static final Logger logger = LoggerFactory.getLogger(P0003ControllerImpl.class);
	
	@Autowired
	private P0003Service p0003Service;
	
	@Autowired
	P0003VO p0003VO;
	
	
	@Override
	@RequestMapping(value = "/p0003/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("/sm/p0003_search");
	
		return mav;
	} 
	

	@Override
	@RequestMapping(value = "/p0003/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("SiteList", request.getParameter("SiteList"));
	
		List<P0003VO> data = p0003Service.searchList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}


	@Override
	@RequestMapping(value = "/p0003/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
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
			p0003Service.saveData(dataMap);	
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
	@RequestMapping(value = "/p0003/popup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView popup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("sm/p0003_search_p01");
		return mav;
	} 


	@Override
	@RequestMapping(value = "/p0003/searchpopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchpopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("p_id", request.getParameter("p_id"));
		
		//������ ��ȸ
		List<P0003VO> data = p0003Service.searchpopup(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	

	
	
	@Override
	@RequestMapping(value = "/p0003/saveDatapopup.do", method = { RequestMethod.GET, RequestMethod.POST })
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
			p0003Service.saveDatapopup(dataMap);	
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
	@RequestMapping(value = "/p0003/SiteList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchSiteList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("p_id", request.getParameter("p_id"));
		
		//������ ��ȸ
		List<P0003VO> data = p0003Service.searchSiteList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}

	

}

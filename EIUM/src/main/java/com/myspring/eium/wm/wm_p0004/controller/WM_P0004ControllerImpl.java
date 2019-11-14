package com.myspring.eium.wm.wm_p0004.controller;

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

import com.myspring.eium.wm.wm_p0004.vo.WM_P0004VO;
import com.myspring.eium.wm.wm_p0004.service.WM_P0004ServiceImpl;



@Controller
public class WM_P0004ControllerImpl implements WM_P0004Controller{
	private static final Logger logger = LoggerFactory.getLogger(WM_P0004ControllerImpl.class);
	
	@Autowired
	WM_P0004ServiceImpl WM_P0004Service;
	@Autowired
	WM_P0004VO WM_P0004VO;
	
	@Override
	@RequestMapping(value = "/wm/p0004/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("wm/wm_p0004/p0004");
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "wm/p0004/employeeSearch_Init.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView employeeSearch_init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("/wm/wm_p0004/p0004_employeeSearch_p01");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/wm/p0004/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		searchMap.put("date", request.getParameter("date"));
		searchMap.put("date2", request.getParameter("date2"));
		searchMap.put("p_text", request.getParameter("p_text"));
		
		List<WM_P0004VO> data = WM_P0004Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/wm/p0004/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, String[]> dataMap = new HashMap<String, String[]>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
	    String x = request.getParameter("x");
	    
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String[] values = request.getParameterValues(name);
			dataMap.put(name, values);
		}
		
		
		for(String key : dataMap.keySet()){
            String[] value = dataMap.get(key);
        }

		Map<String, String> result = new HashMap<String, String>();
		/*try {
			p0006_01ServiceImpl.saveData(dataMap, x);	
			result.put("Code","0");
			result.put("Message","����Ǿ����ϴ�");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","���忡 �����Ͽ����ϴ�");
			e.printStackTrace();
		}*/
		WM_P0004Service.saveData(dataMap, x);	
		resultMap.put("Result", result);         
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "wm/p0004/employeeSearch_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map employeeSearch_p01(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("p_id", request.getParameter("p_id"));
		
		//������ ��ȸ
		List<WM_P0004VO> data = WM_P0004Service.searchEmployeeList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	
}
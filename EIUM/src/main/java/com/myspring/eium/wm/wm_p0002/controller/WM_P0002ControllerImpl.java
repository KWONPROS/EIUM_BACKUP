package com.myspring.eium.wm.wm_p0002.controller;

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

import com.myspring.eium.wm.wm_p0002.vo.WM_P0002VO;
import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;
import com.myspring.eium.wm.wm_p0002.service.WM_P0002ServiceImpl;



@Controller
public class WM_P0002ControllerImpl implements WM_P0002Controller{
	private static final Logger logger = LoggerFactory.getLogger(WM_P0002ControllerImpl.class);
	
	@Autowired
	WM_P0002ServiceImpl WM_P0002Service;
	@Autowired
	WM_P0002VO WM_P0002VO;
	
	@Override
	@RequestMapping(value = "/wm/p0002/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("wm/wm_p0002/p0002");
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "wm/p0002/employeeSearch_Init.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView employeeSearch_init(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("/wm/wm_p0002/p0002_employeeSearch_p01");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/wm/p0002/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();

		searchMap.put("SiteList", request.getParameter("SiteList"));
		searchMap.put("DeptList", request.getParameter("DeptList"));
		searchMap.put("Employee_Select", request.getParameter("Employee_Select"));
		searchMap.put("p_text", request.getParameter("p_text"));
		
		List<WM_P0002VO> data = WM_P0002Service.searchList(searchMap);
        resultMap.put("Data", data);
        
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/wm/p0002/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
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
		WM_P0002Service.saveData(dataMap, x);	
		resultMap.put("Result", result);         
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "wm/p0002/employeeSearch_p01.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map employeeSearch_p01(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("p_id", request.getParameter("p_id"));
		
		//������ ��ȸ
		List<WM_P0002VO> data = WM_P0002Service.searchEmployeeList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}

	@Override
	@RequestMapping(value = "wm/p0002/SiteList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchSiteList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("p_id", request.getParameter("p_id"));
		
		//������ ��ȸ
		List<WM_P0002VO> data = WM_P0002Service.searchSiteList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "wm/p0002/DeptList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchDeptList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
		Map<String, Object> resultMap = new HashMap<String, Object>(); // ��ȸ���
		
		// �˻����Ǽ���
		searchMap.put("SiteList", request.getParameter("SiteList"));
		
		//������ ��ȸ
		List<WM_P0002VO> data = WM_P0002Service.searchDeptList(searchMap);
        resultMap.put("Data", data);
       
        return resultMap;
	}
	
}

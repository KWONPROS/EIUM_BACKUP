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


import com.myspring.eium.pm.pm_p0001.service.PM_P0001Service;
import com.myspring.eium.pm.pm_p0001.vo.PM_P0001VO;




@Controller
public class PM_P0001ControllerImpl implements PM_P0001Controller {
	private static final Logger logger = LoggerFactory.getLogger(PM_P0001ControllerImpl.class);
	@Autowired
	PM_P0001Service pM_P0001Service;
	@Autowired
	PM_P0001VO pM_P0001VO;
	
	@Override
	@RequestMapping(value = "/pm/p0001/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("pm/pm_p0001/p0001_home");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/pm/p0001/EMP_searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map EMP_searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		
		//데이터 조회
		List<PM_P0001VO> data = pM_P0001Service.EMP_searchList(searchMap);
		
        resultMap.put("Data", data);
    	System.out.println("PM-P0001ControllerImpl-1-resultMap::::" + resultMap);
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
			pM_P0001Service.saveData(dataMap);	
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

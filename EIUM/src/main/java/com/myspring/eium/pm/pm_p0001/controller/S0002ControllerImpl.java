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


import com.myspring.eium.pm.pm_p0001.service.S0002Service;
import com.myspring.eium.pm.pm_p0001.vo.S0002VO;




@Controller("s0002Controller")
public class S0002ControllerImpl implements S0002Controller {
	private static final Logger logger = LoggerFactory.getLogger(S0002ControllerImpl.class);
	@Autowired
	S0002Service s0002Service;
	@Autowired
	S0002VO s0002VO;
	
	@Override
	@RequestMapping(value = "/s0002/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("/s0002/s0002_home");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/s0002/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); // 占싯삼옙占쏙옙占쏙옙
		Map<String, Object> resultMap = new HashMap<String, Object>(); // 占쏙옙회占쏙옙占�
		
		// 검색조건설정
		searchMap.put("p_cust_id", request.getParameter("p_cust_id"));
		
		//데이터 조회
		List<S0002VO> data = s0002Service.searchList(searchMap);
        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	
	@Override 
	@RequestMapping(value = "/s0002/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public String searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
        String str = "{\"Data\":[{\"ID\":\"그것만이 내 세상\",\"PWD\":\"Keys to the Heart\",\"NAME\":\"2017\",\"EMAIL\":\"한국\",\"JOINDATE\":\"20190101\",\"NUM\":\"1\"}]}";
        //JSON 반환 
        return str;
	}
	
	@Override
	@RequestMapping(value = "/s0002/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
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
			s0002Service.saveData(dataMap);	
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
package com.myspring.eium.hm.hm_p0029.controller;



import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.hm.hm_p0029.dao.HM_P0029DAO;
import com.myspring.eium.hm.hm_p0029.service.HM_P0029Service;
import com.myspring.eium.hm.hm_p0029.vo.HM_P0029VO;


@Controller
public class HM_P0029ControllerImpl implements HM_P0029Controller {
	private static final Logger logger = LoggerFactory.getLogger(HM_P0029ControllerImpl.class);

	@Autowired
	HM_P0029Service p0029Service;
	@Autowired
	HM_P0029DAO p0029dao;

	
	
	@Override
	@RequestMapping(value = "/hm/p0029/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_tab");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchInit_TN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit_TN(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0033/p0033_TN");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchInit_BN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit_BN(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0033/p0033_BN");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchInit_LI.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit_LI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0033/p0033_LI");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/hm/p0033/searchInit_LA.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit_LA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0033/p0033_LA");
	
		return mav;
	} 
	//4가지 모델엔 뷰
	@Override
	@RequestMapping(value = "/hm/p0029/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("command", request.getParameter("command"));
		searchMap.put("condition", request.getParameter("condition"));
		List<HM_P0029VO> data = p0029Service.searchList(searchMap);
        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
    	
        return resultMap;
	}
		
	@Override
	@RequestMapping(value = "/hm/p0029/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
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
			p0029Service.saveData(dataMap);	
			result.put("Code","0");
			result.put("Message","저장성공");
		}catch(Exception e) {
			result.put("Code","-1");
			result.put("Message","저장실패");
			e.printStackTrace();
		}
		
		resultMap.put("Result", result);         
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0029/findAddress.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findAddress(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/hm/hm_p0029/p0029_home_p01");
		return mav;

	}
	@Override
	@RequestMapping(value = "/hm/p0029/findPopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findPopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/hm/hm_p0029/p0029_home_p02");
		mav.addObject("command", request.getParameter("command"));
		mav.addObject("index", request.getParameter("index"));
		return mav;
	}
	@Override
	@RequestMapping(value = "/hm/p0029/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("command", request.getParameter("command"));
		List<HM_P0029VO> data = p0029Service.searchList2(searchMap);

        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	
	@Override
    @RequestMapping(value="/hm/p0029/saveFile.do", method = { RequestMethod.GET, RequestMethod.POST })
    public void saveFile(HM_P0029VO VO, ModelAndView mav, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>(); 
		
        dataMap.put("emp_CODE",VO.getEmp_CODE());
        dataMap.put("picture",VO.getPicture().getBytes());
        
		try {
			p0029Service.saveFile(dataMap);
		}catch(Exception e) {
			e.printStackTrace();
		}
	
    }
	
	@Override
	@RequestMapping(value = "/hm/p0029/getByteImage.do")
	@ResponseBody
	public ResponseEntity<byte[]> getByteImage(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("emp_CODE",request.getParameter("empCode"));
		
		Map<String, Object> map = p0029dao.getByteImage(searchMap);
		
		byte[] imageContent = (byte[]) map.get("picture");

		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	}
	
}

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
import com.myspring.eium.hm.hm_p0033.vo.HM_P0033VO;


@Controller
public class HM_P0029ControllerImpl implements HM_P0029Controller {
	private static final Logger logger = LoggerFactory.getLogger(HM_P0029ControllerImpl.class);

	@Autowired
	HM_P0029Service p0029Service;
	@Autowired
	HM_P0029DAO p0029dao;

	
	//탭
	@Override
	@RequestMapping(value = "/hm/p0029/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_tab");
	
		return mav;
	} 
	
	//교육 탭
	@Override
	@RequestMapping(value = "/hm/p0029/searchInit_TN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit_TN(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_TN");
	
		return mav;
	} 
	
	//출장 탭
	@Override
	@RequestMapping(value = "/hm/p0029/searchInit_BN.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit_BN(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_BN");
	
		return mav;
	} 
	
	//자격/면허 탭
	@Override
	@RequestMapping(value = "/hm/p0029/searchInit_LI.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit_LI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_LI");
	
		return mav;
	} 
	
	//어학시험 탭
	@Override
	@RequestMapping(value = "/hm/p0029/searchInit_LA.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit_LA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_LA");
	
		return mav;
	} 
	//4가지 모델엔 뷰
	
	//사업장 조회 모델엔뷰
	@Override
	@RequestMapping(value = "/hm/p0029/search_Site.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView search_Site(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_SearchSite");
		return mav;
	}
	
	//사업장 팝업 리스트 조회
	@Override
	@RequestMapping(value = "/hm/p0029/searchList_site.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_site(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>(); 
		Map<String, Object> resultMap = new HashMap<String, Object>(); 

		List<HM_P0029VO> data = p0029Service.searchList_site(searchMap);
		
        resultMap.put("Data", data);
        return resultMap;
	}
	//부서 팝업
	@Override
	@RequestMapping(value = "/hm/p0029/search_Dept.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView search_Dept(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("hm/hm_p0029/p0029_SearchDept");
		return mav;
	}
	
	//table로 팝업창 조회
	@Override
	@RequestMapping(value = "/hm/p0029/findPopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findPopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/hm/hm_p0029/p0029_home_p02");
		mav.addObject("command", request.getParameter("command"));
		mav.addObject("index", request.getParameter("index"));
		return mav;
	}
	//팝업 조회 맵 리스트
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
	@RequestMapping(value = "/hm/p0029/searchList_TN.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_TN(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("command", request.getParameter("command"));
		searchMap.put("condition", request.getParameter("condition"));
		List<HM_P0029VO> data = p0029Service.searchList_TN(searchMap);
        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
    	
        return resultMap;
	}
		
	@Override
	@RequestMapping(value = "/hm/p0029/searchList_BN.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_BN(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("command", request.getParameter("command"));
		searchMap.put("condition", request.getParameter("condition"));
		List<HM_P0029VO> data = p0029Service.searchList_BN(searchMap);
        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
    	
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0029/searchList_LI.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_LI(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("command", request.getParameter("command"));
		searchMap.put("condition", request.getParameter("condition"));
		List<HM_P0029VO> data = p0029Service.searchList_LI(searchMap);
        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
    	
        return resultMap;
	}
	
	@Override
	@RequestMapping(value = "/hm/p0029/searchList_LA.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList_LA(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("command", request.getParameter("command"));
		searchMap.put("condition", request.getParameter("condition"));
		List<HM_P0029VO> data = p0029Service.searchList_LA(searchMap);
        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
    	
        return resultMap;
	}
}

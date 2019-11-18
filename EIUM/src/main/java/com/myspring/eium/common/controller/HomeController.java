package com.myspring.eium.common.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.myspring.eium.common.service.HomeService;
import com.myspring.eium.common.vo.HomeVO;
import com.myspring.eium.login.vo.LoginVO;



@Controller
public class HomeController {
	@Autowired 
	SessionLocaleResolver localeResolver; 
	@Autowired 
	MessageSource messageSource;
	@Autowired 
	HomeService homeService;
	@Autowired 
	HomeVO homeVO;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "main";
	}

	@RequestMapping(value = "/login.do", method =  RequestMethod.GET)
	public String Login( Locale locale,HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "common/cm_login";
	}
	
	@RequestMapping(value = "/findIdNPwd.do", method = RequestMethod.GET)
	public ModelAndView findInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/common/cm_login_p01");

		mav.addObject("command", request.getParameter("command"));

		if (request.getParameter("EMPLOYEE_CODE") != null) {
			
			Map<String, Object> searchMap = new HashMap<String, Object>(); // �˻�����
			
			searchMap.put("EMPLOYEE_CODE", request.getParameter("EMPLOYEE_CODE"));
			searchMap.put("EMPLOYEE_ID", request.getParameter("EMPLOYEE_ID"));
			searchMap.put("EMAIL", request.getParameter("EMAIL"));
			
	
			HomeVO reVo = homeService.findInfo(searchMap);
			mav = new ModelAndView("/common/cm_login_p02");

			homeService.mailSender(reVo);
		}

		return mav;

	}

	
	@RequestMapping(value = "/cm/main.do", method =  RequestMethod.GET)
	public ModelAndView main( Locale locale,HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<HomeVO> boardList = homeService.findAll();
		ModelAndView main = new ModelAndView("common/cm_main");
		main.addObject("boardList", boardList);
		return main;
	}
	
	// 새 글 올리기
	@RequestMapping(value = "/cm/board.do", method = RequestMethod.POST)
	public void create(@RequestBody Map<String, Object> map,HttpServletRequest request,
			HttpServletResponse response) throws Exception{	
		HttpSession session = request.getSession();
		LoginVO vo = (LoginVO)session.getAttribute("login");
		map.put("employee_id", vo.getEmployee_id());
		homeService.boardInsert(map);
	}
	
	// 글 수정
	@RequestMapping(value = "/cm/board.do", method = RequestMethod.PUT)
	public void modify(@RequestBody Map<String, Object> map,HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		homeService.boardUpdate(map);
	}

	// 글 삭제
	@RequestMapping(value = "/cm/board.do", method = RequestMethod.GET)
	public void delete(@Param("board_CODE") Integer board_CODE) throws Exception{		
		  homeService.boardDelete(board_CODE);	
	}
	
	
}


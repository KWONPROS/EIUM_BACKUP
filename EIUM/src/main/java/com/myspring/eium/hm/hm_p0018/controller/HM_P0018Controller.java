package com.myspring.eium.hm.hm_p0018.controller;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface HM_P0018Controller {



	Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView EduInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView tabInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView EdutargetInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map home2search(HttpServletRequest request, HttpServletResponse response) throws Exception;

	ModelAndView home2PopUPInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
}

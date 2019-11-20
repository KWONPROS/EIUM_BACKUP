package com.myspring.eium.hm.hm_p0023.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface HM_P0023Controller {

	ModelAndView homeInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map appointList(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map appointSearch_p01(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map masterEmployee_p02(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map homeEmployeeSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;

	Map homeSearch_p03(HttpServletRequest request, HttpServletResponse response) throws Exception;


	Map saveData2(HttpServletRequest request, HttpServletResponse response) throws Exception;

}

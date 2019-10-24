package com.myspring.eium.sm.sm_p0003.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.eium.sm.sm_p0003.vo.DepartureVO;


public interface DepartureController {
	public ModelAndView popup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchpopup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map saveDataPopup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchSiteList(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}

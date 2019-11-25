package com.myspring.eium.pm.pm_p0009.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.eium.pm.pm_p0009.vo.PM_P0009VO;

public interface PM_P0009Controller {
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception;	
	public Map saveData(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView findAddress(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView findPopup(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity<byte[]> getByteImage(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void saveFile(PM_P0009VO VO, ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

	
	
}
package com.myspring.eium.pm.pm_p0009.controller;


import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.stream.FileImageOutputStream;
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
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.eium.pm.pm_p0009.dao.PM_P0009DAO;
import com.myspring.eium.pm.pm_p0009.service.PM_P0009Service;
import com.myspring.eium.pm.pm_p0009.vo.PM_P0009VO;


@Controller
public class PM_P0009ControllerImpl implements PM_P0009Controller {
	private static final Logger logger = LoggerFactory.getLogger(PM_P0009ControllerImpl.class);

	@Autowired
	PM_P0009Service p0009Service;
	@Autowired
	PM_P0009DAO p0009dao;

	
	
	@Override
	@RequestMapping(value = "/pm/p0009/searchInit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView searchInit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("pm/pm_p0009/p0009_home");
	
		return mav;
	} 
	
	@Override
	@RequestMapping(value = "/pm/p0009/searchList.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("command", request.getParameter("command"));
		searchMap.put("condition", request.getParameter("condition"));
		List<PM_P0009VO> data = p0009Service.searchList(searchMap);
        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
    	
        return resultMap;
	}
		
	@Override
	@RequestMapping(value = "/pm/p0009/saveData.do", method = { RequestMethod.GET, RequestMethod.POST })
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
			p0009Service.saveData(dataMap);	
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
	@RequestMapping(value = "/pm/p0009/findAddress.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findAddress(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/pm/pm_p0009/p0009_home_p01");
		return mav;

	}
	@Override
	@RequestMapping(value = "/pm/p0009/findPopup.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView findPopup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView("/pm/pm_p0009/p0009_home_p02");
		mav.addObject("command", request.getParameter("command"));
		mav.addObject("index", request.getParameter("index"));
		return mav;
	}
	@Override
	@RequestMapping(value = "/pm/p0009/searchList2.do", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public Map searchList2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		Map<String, Object> searchMap = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>(); 
		searchMap.put("command", request.getParameter("command"));
		List<PM_P0009VO> data = p0009Service.searchList2(searchMap);

        resultMap.put("Data", data);
    	System.out.println("resultMap::::"+resultMap);
        return resultMap;
	}
	
	@Override
    @RequestMapping(value="/pm/p0009/saveFile.do", method = { RequestMethod.GET, RequestMethod.POST })
    public void saveFile(PM_P0009VO VO, ModelAndView mav, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Map<String, Object> dataMap = new HashMap<String, Object>(); 
		
        dataMap.put("emp_CODE",VO.getEmp_CODE());
        dataMap.put("picture",VO.getPicture().getBytes());
        
		try {
			p0009Service.saveFile(dataMap);
		}catch(Exception e) {
			e.printStackTrace();
		}
	
    }
	
	@Override
	@RequestMapping(value = "/pm/p0009/getByteImage.do")
	@ResponseBody
	public ResponseEntity<byte[]> getByteImage(HttpServletRequest request, HttpServletResponse response)throws Exception {
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("emp_CODE",request.getParameter("empCode"));
		
		Map<String, Object> map = p0009dao.getByteImage(searchMap);
		
		byte[] imageContent = (byte[]) map.get("picture");

		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	}
	
}

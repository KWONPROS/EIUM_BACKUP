package com.myspring.eium.hm.hm_p0002.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;


public interface HM_P0002Controller {

	ModelAndView paymentInit(HttpServletRequest request, HttpServletResponse response) throws Exception;

}

package com.myspring.eium.login.cotroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.eium.login.service.LoginService;
import com.myspring.eium.login.vo.LoginVO;




@Controller
public class LoginControllerImpl   implements LoginController {
	@Autowired
	private LoginService loginService;
	@Autowired
	LoginVO loginVO ;
	

	/*
	 * private String getViewName(HttpServletRequest request) throws Exception {
	 * String contextPath = request.getContextPath(); String uri = (String)
	 * request.getAttribute("javax.servlet.include.request_uri"); if (uri == null ||
	 * uri.trim().equals("")) { uri = request.getRequestURI(); }
	 * 
	 * int begin = 0; if (!((contextPath == null) || ("".equals(contextPath)))) {
	 * begin = contextPath.length(); }
	 * 
	 * int end; if (uri.indexOf(";") != -1) { end = uri.indexOf(";"); } else if
	 * (uri.indexOf("?") != -1) { end = uri.indexOf("?"); } else { end =
	 * uri.length(); }
	 * 
	 * String viewName = uri.substring(begin, end); if (viewName.indexOf(".") != -1)
	 * { viewName = viewName.substring(0, viewName.lastIndexOf(".")); } if
	 * (viewName.lastIndexOf("/") != -1) { viewName =
	 * viewName.substring(viewName.lastIndexOf("/",1), viewName.length()); } return
	 * viewName; }
	 */

	@Override
	@RequestMapping(value="/login/Login.do", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("login") LoginVO login, RedirectAttributes rAttr, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		loginVO = loginService.login(login);

		if(loginVO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("login", loginVO);
			session.setAttribute("isLogOn", true);

	
			mav.setViewName("redirect:/main.do");
			}else {
			//RedirectAttributes: redirect���� Data�� �����ϴ� ����� ����
			rAttr.addAttribute("result", "loginFailed");
			mav.setViewName("redirect:/login.do");
			}
		return mav;
	}
	

	


}

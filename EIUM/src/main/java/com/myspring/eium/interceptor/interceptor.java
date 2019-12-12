package com.myspring.eium.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class interceptor extends HandlerInterceptorAdapter{
	  @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {

	        // session 媛앹껜瑜� 媛��졇�샂
	        HttpSession session = request.getSession();
	        // login泥섎━瑜� �떞�떦�븯�뒗 �궗�슜�옄 �젙蹂대�� �떞怨� �엳�뒗 媛앹껜瑜� 媛��졇�샂
	        Object obj = session.getAttribute("login");
			String requestUrl=request.getRequestURL().toString();
			System.out.println(requestUrl);
			if(requestUrl.contains("/login.do")){
				System.out.println("1踰덉��");
				return true;
				}
			if(requestUrl.contains("/LoginCheck.do")) {
				return true;
			}
	        if ( obj ==null ){
	        	System.out.println("2踰덉��");
	            // 濡쒓렇�씤�씠 �븞�릺�뼱 �엳�뒗 �긽�깭�엫�쑝濡� 濡쒓렇�씤 �뤌�쑝濡� �떎�떆 �룎�젮蹂대깂(redirect)
	            response.sendRedirect("/EIUM/login.do");
	            return false; // �뜑�씠�긽 而⑦듃濡ㅻ윭 �슂泥��쑝濡� 媛�吏� �븡�룄濡쓋alse濡� 諛섑솚�븿
	        }
	         
	        // preHandle�쓽return�� 而⑦듃濡ㅻ윭 �슂泥� uri濡� 媛��룄 �릺�깘 �븞�릺�깘瑜� �뿀媛��븯�뒗 �쓽誘몄엫
	        // �뵲�씪�꽌true濡쒗븯硫� 而⑦듃濡ㅻ윭 uri濡� 媛�寃� �맖.
	        return super.preHandle(request, response, handler);
	    }
	 
	    // 而⑦듃濡ㅻ윭媛� �닔�뻾�릺怨� �솕硫댁씠 蹂댁뿬吏�湲� 吏곸쟾�뿉 �닔�뻾�릺�뒗 硫붿꽌�뱶
	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	            ModelAndView modelAndView) throws Exception {
	        // TODO Auto-generated method stub
	        super.postHandle(request, response, handler, modelAndView);
	    }


}

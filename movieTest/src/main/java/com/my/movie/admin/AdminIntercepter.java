package com.my.movie.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminIntercepter extends HandlerInterceptorAdapter{
	//夸没傈 贸府
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		//技记按眉 积己
		HttpSession session = request.getSession();
		//session俊 包府磊id啊 null捞搁
		if(session.getAttribute("adminId") ==null){
			response.sendRedirect("/inclue/login");
			return false;//夸没角青 X
		//null捞 酒聪搁
		}else{
			return true;//夸没角青 O
		}
	}
	//夸没 贸府饶
	public void postHandler(HttpServletRequest request, HttpServletResponse response, 
			Object handler, ModelAndView modelAndView) throws Exception{
		super.postHandle(request, response, handler, modelAndView);
	}
}

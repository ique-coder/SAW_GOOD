package com.saw.good.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginMember")==null) {
			request.setAttribute("msg", "로그인 후 이용할 수 있습니.");
			request.setAttribute("referer", request.getHeader("Referer"));
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			
			return false;
		}
		else{
			return super.preHandle(request, response, handler);
		}
	}
	
	

}

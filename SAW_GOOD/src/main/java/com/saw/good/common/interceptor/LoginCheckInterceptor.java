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
		String refer=request.getHeader("Referer");
		if(session.getAttribute("loginMember")==null) {
			request.setAttribute("msg", "로그인 후 이용할 수 있습니다.");
			request.setAttribute("referer", "/"+refer.substring(refer.indexOf("20AM_SAW_GOOD_final")));
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			.forward(request, response);
			return false;
		}
		else{
			return super.preHandle(request, response, handler);
		}
	}
	
	

}

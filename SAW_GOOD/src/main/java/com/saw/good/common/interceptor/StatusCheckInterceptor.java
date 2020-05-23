package com.saw.good.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.saw.good.member.model.vo.Member;

public class StatusCheckInterceptor extends HandlerInterceptorAdapter{

	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String refer = request.getHeader("Referer");
		System.out.println(refer);
		Member m = (Member)session.getAttribute("loginMember");
		if(m==null || m.getStatus()<2) {
			request.setAttribute("msg", "판매등급인 회원만 이용가능합니다.");
			request.setAttribute("referer", "/"+refer.substring(refer.indexOf("good")));
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
			.forward(request, response);
			return false;
		}
		else{
			
			return super.preHandle(request, response, handler);
		}
		
	}

	
}

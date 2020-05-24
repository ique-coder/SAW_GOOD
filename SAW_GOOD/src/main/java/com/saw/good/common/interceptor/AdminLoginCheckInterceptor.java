package com.saw.good.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.saw.good.member.model.vo.Member;

public class AdminLoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("loginMember");
		if(m==null || !m.getUserId().equals("admin") ) {
			request.setAttribute("msg", "관리자 로그인 후 이용해주세요");
			request.setAttribute("referer", request.getHeader("Referer"));
			request.getRequestDispatcher("/WEB-INF/views/admin/common/msg.jsp")
			.forward(request, response);
			return false;
		}else {
			return super.preHandle(request, response, handler);
		}
	}
	
	
}

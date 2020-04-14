package edu.Farmfarm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class AuthInterceptor extends HandlerInterceptorAdapter{ //특정 경로에서 로그인 상태 확인

	 @Override // 로그인 상태 여부 확인. 컨트롤러 호출 결정.
	 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		 HttpSession httpSession = request.getSession();

	     if (httpSession.getAttribute("login") == null) {
	    	 log.info("로그인 한 상태가 아님");
	         response.sendRedirect("/user/login");
	         return false;
	     }

	     return true;
	}
	 
}

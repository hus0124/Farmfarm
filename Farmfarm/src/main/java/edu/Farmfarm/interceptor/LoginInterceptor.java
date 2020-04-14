package edu.Farmfarm.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class LoginInterceptor extends HandlerInterceptorAdapter{

	private static final String LOGIN = "login";
    
    @Override //  httpSession에 컨트롤러에서 저장한 user를 저장하고, /로 리다이렉트
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

        HttpSession httpSession = request.getSession();
        ModelMap modelMap = modelAndView.getModelMap();
        Object userVO =  modelMap.get("user"); // UserController 에서 model "user" 로 보낸 것.

        if (userVO != null) {
            log.info("new login success");
            httpSession.setAttribute(LOGIN, userVO);
            response.sendRedirect("/"); // 로그인이 제대로 되었다면 / 즉 메인페이지로 이동.
        }

    }

    @Override // 기존의 로그인 정보가 있을 경우 초기화
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession httpSession = request.getSession();
        // 기존의 로그인 정보 제거
        if (httpSession.getAttribute(LOGIN) != null) {
            log.info("clear login data before");
            httpSession.removeAttribute(LOGIN);
        }

        return true;
    }
    
}

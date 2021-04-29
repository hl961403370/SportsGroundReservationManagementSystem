package com.hl.prms.global;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String url = String.valueOf(request.getRequestURL());
        if(url.toLowerCase().indexOf("index")>=0){
            return true;
        }
        if(url.toLowerCase().indexOf("register")>=0){
            return true;
        }
        if(url.toLowerCase().indexOf("check")>=0){
            return true;
        }
        if(url.toLowerCase().indexOf("login")>=0){
            return true;
        }

        HttpSession session = request.getSession();
        if(session.getAttribute("user")!=null){
            return true;
        }

        response.sendRedirect("/to_login");
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}

package com.jl.helloing.common.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
    
    /*
     * extends HandlerInterceptorAdapter 상속받기
     * 
     * Interceptor(정확히 표현하면 HandlerInterceptor)
     * 
     * Controller가 실행되기 전, 실행된 후에 낚아채서 실행할 내용을 작성 가능
     * 로그인 유무 판단, 회원의 권한 체크
     * 
     * preHandle(전처리) : 핸들러 호출 전 낚아챔
     * postHandle(후처리) : 요청 처리 후 DispatcherServlet이 View 정보를 받기 전 낚아챔
     */
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
        
        // true 리턴 시 => 기존 요청 흐름대로 Controller를 정상 실행
        // false 리턴 시 => Controller 실행 X
        
        // 현재 요청을 보낸 사람이 로그인이 되어있을 경우 => Controller 실행
        HttpSession session = request.getSession();
        
        if(session.getAttribute("loginUser") != null) {
            return true;
        } else {
            
            session.setAttribute("alertMsg", "로그인을 하세여. 콱씨👊");
            response.sendRedirect(request.getContextPath());
            
            return false;
        }
    }

}

package com.example.demo;

import java.io.IOException;

import org.springframework.security.core.AuthenticationException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Component
public class CustomAuthFailureHandler implements AuthenticationFailureHandler {
 
	private final String DEFAULT_FAILURE_URL = "/login?error=true";

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
    		AuthenticationException exception) throws IOException, ServletException {
    	// TODO Auto-generated method stub
    	 String loginFailMsg = null;
    	
         if (exception instanceof AuthenticationServiceException) {
             loginFailMsg = "존재하지 않는 사용자입니다.";
         } else if(exception instanceof BadCredentialsException) {
             loginFailMsg = "아이디 또는 비밀번호가 틀립니다.";
         }
         
         request.setAttribute("loginFailMsg", loginFailMsg);
   	
         request.getRequestDispatcher(DEFAULT_FAILURE_URL).forward(request,response);
     }
    	 	
    }
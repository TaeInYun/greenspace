package com.example.demo;

import javax.annotation.security.PermitAll;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import lombok.AllArgsConstructor;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private CustomAuthFailureHandler authFailureHandler;
	
	//사이트 잠금해제
	@Override
	public void configure(WebSecurity web) throws Exception
	{
		// static 디렉터리의 하위 파일 목록은 인증 무시 ( = 항상통과 )
        web.ignoring().antMatchers("/css/**", "/js/**", "/img/**", "/lib/**","/views/**");
        }
	
	//로그인폼 수정
	@Override
	protected void configure(HttpSecurity http) throws Exception
	{

		http
		.csrf().disable()
		.formLogin()
		.loginPage("/login")//로그인을 위한 서비스명 설정
		//.loginProcessingUrl("/loginAction")//로그인과정
		.defaultSuccessUrl("/loginOK")//로그인을 성공하였을때 이동할 서비스명을 설정
		.failureUrl("/login?error=true")
		.failureHandler(authFailureHandler); //->변수로

		
		http.logout()
		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))//로그아웃을 위한 서비스명을 설정
		.invalidateHttpSession(true)//로그아웃을 완료하였을 때 세션을 파기하도록 설정
		.logoutSuccessUrl("/login");//로그아웃을 완료한 후에 이동할 서비스명 설정

		
		http.httpBasic();
	}	
	
	

	/*
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		//super.configure(http);
	
		
		http.authorizeHttpRequests()
		.mvcMatchers("/","/join","/login").permitAll()//인증(로그인)을 하지 않아도 될 서비스들을 설정
		.anyRequest().authenticated();//그 나머지 모든 요청은 인증(로그인)을 해야 서비스 받을 수 있음을 설정
	
		//만약 자신이 만든 로그인폼을 사용하려면 다음과 같이 설정한다.
		http.formLogin().loginPage("/login")//로그인을 위한 서비스명 설정
		.defaultSuccessUrl("/loginOK");//로그인을 성공하였을때 이동할 서비스명을 설정
		//로그인을 위한 폼태그에서 아이디와 비밀번호를 입력하고 submit버튼을 누르면
		//자동으로 UserDetailsService인터페이스를 구현한 클래스의 loadUserByUsername메소드가 자동으로 동작
		
		//로그아웃을 위하여 서비스명만 설정하면
		//실제 로그아웃에 대한 처리는 스프링시큐리티가 처리해 준다.
		http.logout()
		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))//로그아웃을 위한 서비스명을 설정
		.invalidateHttpSession(true)//로그아웃을 완료하였을 때 세션을 파기하도록 설정
		.logoutSuccessUrl("/login");//로그아웃을 완료한 후에 이동할 서비스명 설정

		http.httpBasic();
	
	}*/
	

	
}
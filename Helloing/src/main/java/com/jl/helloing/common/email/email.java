package com.jl.helloing.common.email;

import java.util.Properties;

import org.springframework.mail.javamail.JavaMailSenderImpl;

public class email {
	
	public static JavaMailSenderImpl sender;
	
	public static void main(String[] args) {
			
			JavaMailSenderImpl impl = new JavaMailSenderImpl();
			
			// - 계정 설정
			impl.setHost("smtp.gmail.com"); 			// 메일을 보내는 곳(google) 설정
			impl.setPort(587);							// 포트번호
			impl.setUsername("winjun9191@gmail.com");	// 보내는이
			impl.setPassword("zgggozlujryamapz");			// 비밀번호
			
			// - 옵션설정
			Properties prop = new Properties(); 			// Map<Object, Object> 형태
			prop.put("mail.smtp.auth", true);				// map에 요소추가 
			prop.put("mail.smtp.starttls.enable", true);	// map에 요소추가 
			// 이까지 메일쓰기 위한 기본 설정
			
			impl.setJavaMailProperties(prop); // Properties객체를 넣어줌
			
			sender = impl;
			// 이까지 전송 도구
	}
}

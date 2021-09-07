package com.shop.mint.common.kakao.controller;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.mint.common.kakao.service.KakaoAPI;

@Controller
public class KakaoController {

	@Autowired
	private KakaoAPI kakao;
	
	@RequestMapping(value="/wtf")
	public String login(@RequestParam(value="code", required = false) String code, HttpSession session) throws Exception {
		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	    System.out.println("login Controller : " + userInfo);
	    
	    // 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	    if (userInfo.get("email") != null) {
	        session.setAttribute("userId", userInfo.get("email"));
	        session.setAttribute("nickname", userInfo.get("nickname"));
	        session.setAttribute("access_Token", access_Token);
	    }
		
		return "home";
	}
	
	@RequestMapping(value="/wtf/logout")
	public String logout(HttpSession session) {
	    kakao.kakaoLogout((String)session.getAttribute("access_Token"));
	    session.removeAttribute("access_Token");
	    session.removeAttribute("userId");
	    System.out.println("로그아웃 완료");
	    session.invalidate();
	    return "redirect:/main";


	}

	
 }
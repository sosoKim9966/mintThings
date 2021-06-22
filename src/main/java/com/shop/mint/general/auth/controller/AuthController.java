package com.shop.mint.general.auth.controller;

import com.shop.mint.general.auth.domain.AuthVO;
import com.shop.mint.general.auth.mapper.AuthMapper;
import com.shop.mint.general.auth.service.AuthService;
import com.shop.mint.jwtConfig.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RequiredArgsConstructor
@RestController
public class AuthController {

    private final PasswordEncoder passwordEncoder;
    private final JwtTokenProvider jwtTokenProvider;
    private final AuthService authService;

    // 로그인
    @PostMapping("/login")
    public String login(@RequestBody Map<String, String> user) {
        System.out.println("aaaaaaa = "+user.get("userId"));
        AuthVO member = authService.findByUserId(user.get("userId"));
        System.out.println("Bbbbbb = " + member.getUserPw());
//        if (!passwordEncoder.matches(user.get("userPw"), member.getUserPw())) {
//            throw new IllegalArgumentException("잘못된 비밀번호입니다.");
//        }
        System.out.println("member.getRoles() = " + member.getRoles());
        return jwtTokenProvider.createToken(member.getUserNo().toString(), member.getRoles());
    }

    @PostMapping("/join")
    public int join(@RequestBody Map<String, String> user) {
        return 0;
    }

    @PostMapping("/test")
    public String test(@RequestBody Map<String, String> map) { // 토큰을 인자로 받아서 현재 로그인한 userPk 확인
        System.out.println("1111111 = " + map.get("token"));
        //jwtTokenProvider.getUserPk(map.get("token"));
        return jwtTokenProvider.getUserPk(map.get("token"));
    }

    @PostMapping("/test1")
    public Authentication test1(@RequestBody Map<String, String> map) { // 토큰을 인자로 받아서 현재 로그인한 userPk 확인
        System.out.println("1111111 = " + map.get("token"));
        
        return jwtTokenProvider.getAuthentication(map.get("token"));
    }


}

package com.shop.mint.general.auth.controller;

import com.shop.mint.general.auth.domain.AuthVO;
import com.shop.mint.general.auth.mapper.AuthMapper;
import com.shop.mint.general.auth.service.AuthService;
import com.shop.mint.jwtConfig.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
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

}

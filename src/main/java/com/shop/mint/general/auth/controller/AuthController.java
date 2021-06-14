package com.shop.mint.general.auth.controller;

import com.shop.mint.general.auth.mapper.AuthMapper;
import com.shop.mint.jwtConfig.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RequiredArgsConstructor
@RestController
public class AuthController {

    private final PasswordEncoder passwordEncoder;
    private final JwtTokenProvider jwtTokenProvider;
    private final AuthMapper authMapper;

    // 로그인
    @PostMapping("/login")
    public String login(@RequestBody Map<String, String> user) {
        return null;
    }

    @PostMapping("/join")
    public String join(@RequestBody Map<String, String> user) {
        return null;
    }

}

package com.shop.mint.jwtConfig;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.GenericFilterBean;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@RequiredArgsConstructor
public class JwtAuthenticationFilter extends GenericFilterBean {

    private final JwtTokenProvider jwtTokenProvider;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        String token = jwtTokenProvider.resolveToken( (HttpServletRequest) request );   // header에서 jwt 가져오기
        if( token != null && jwtTokenProvider.validateToken(token) ) {  // 토큰 유효성 체크
            Authentication authentication = jwtTokenProvider.getAuthentication(token);  // 토큰이 유효하면 토큰으로 부터 유저 정보 가져옴
            SecurityContextHolder.getContext().setAuthentication(authentication);   //  SecurityContext 에 Authentication 객체를 저장합니다.
        }
        chain.doFilter(request, response);
    }

}

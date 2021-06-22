package com.shop.mint.configuration;

import com.shop.mint.jwtConfig.JwtAuthenticationFilter;
import com.shop.mint.jwtConfig.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@RequiredArgsConstructor
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    private final JwtTokenProvider jwtTokenProvider;


    @Bean
    public PasswordEncoder passwordEncoder() { // 암호화에 필요한 PasswordEncoder 를 Bean 등록합니다.
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception { // authenticationManager를 Bean 등록합니다.
        return super.authenticationManagerBean();
    }

    /**
     *
     * <pre>
     * @Date : 2021-06-11
     * @author "윤철규(hash)"
     * @History :
     * @Description : spring Security 해당 url로 접근 시 로그인 요구
     * </pre>
     *
     * @return
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
    	http.cors().and();
    	http.csrf().disable();
        http.httpBasic()
                .disable() // rest api 만을 고려하여 기본 설정은 해제하겠습니다.
                .csrf().disable() // csrf 보안 토큰 disable처리.
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS) // 토큰 기반 인증이므로 세션 역시 사용하지 않습니다.
                .and()
                .authorizeRequests() // 요청에 대한 사용권한 체크
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/user/**").hasRole("USER")
                .anyRequest().permitAll() // 그외 나머지 요청은 누구나 접근 가능
                .and()
                .addFilterBefore(new JwtAuthenticationFilter(jwtTokenProvider),
                        UsernamePasswordAuthenticationFilter.class);  // JwtAuthenticationFilter를 UsernamePasswordAuthenticationFilter 전에 넣는다

    }


}

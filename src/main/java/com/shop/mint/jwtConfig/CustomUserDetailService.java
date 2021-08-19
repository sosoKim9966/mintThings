package com.shop.mint.jwtConfig;

import com.shop.mint.general.auth.mapper.AuthMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class CustomUserDetailService implements UserDetailsService {

	// 의존성 주입 해야함함 private final
	AuthMapper authMapper;

	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		try {
			return authMapper.findByUserId(userId);
		} catch (UsernameNotFoundException e) {
			return (UserDetails) new UsernameNotFoundException("사용자를 찾을 수 없습니다.");
		}
	}

}

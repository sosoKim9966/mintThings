package com.shop.mint.general.auth.service;

import com.shop.mint.general.auth.domain.AuthVO;
import com.shop.mint.general.auth.mapper.AuthMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class AuthService {

    private final AuthMapper authMapper;

    public AuthVO findByUserId(String userId) {

        return authMapper.findByUserId(userId);
    }

    public int insertJoinUser(AuthVO authVO) {
        return authMapper.insertJoinUser(authVO);
    }

}

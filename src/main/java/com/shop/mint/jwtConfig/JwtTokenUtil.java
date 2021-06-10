package com.shop.mint.jwtConfig;

import org.springframework.stereotype.Service;

import java.io.Serializable;

@Service
public class JwtTokenUtil implements Serializable {

    private static final long serialVersionUID = -798416586417070603L;
    private static final long JWT_TOKEN_VALIDITY = 5 * 60 * 60;

}

package com.shop.mint.general.auth.mapper;

import com.shop.mint.general.auth.domain.AuthVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.logging.Logger;

@Mapper
public interface AuthMapper {

    public AuthVO findByUserId(String userId);


}

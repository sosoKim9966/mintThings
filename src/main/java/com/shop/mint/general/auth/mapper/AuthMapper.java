package com.shop.mint.general.auth.mapper;

import com.shop.mint.general.auth.domain.AuthVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AuthMapper {

    public AuthVO getUserId(String id);

}

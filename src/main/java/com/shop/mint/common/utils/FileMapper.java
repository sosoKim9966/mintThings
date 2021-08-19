package com.shop.mint.common.utils;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FileMapper {
	public int insertFile(FileVO fileVO) throws Exception;
	public int updateFile(FileVO fileVO) throws Exception;
}

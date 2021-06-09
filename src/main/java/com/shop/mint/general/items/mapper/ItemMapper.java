package com.shop.mint.general.items.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.mint.general.items.domain.ItemOptionVO;
import com.shop.mint.general.items.domain.ItemVO;

@Mapper
public interface ItemMapper {
	
	//메인 상품리스트
	public List<ItemVO> getMainList() throws Exception;
	
	//카테고리별 상품리스트
	public List<ItemVO> getCateList() throws Exception;
	
	//상품 전체 리스트
	public List<ItemVO> getAllList() throws Exception;
	
	//총 아이템 갯수 출력
	public int getCountItems();

	//페이징 처리한 목록 가져오기
	//public List<ItemVO> selectItem(PagingVO pagingVO);
	
	//아이템 상세
	public ItemVO getItemDetail(int item_No) throws Exception; 
	
	//아이템 상세 - 아이템 옵션
	public List<ItemOptionVO> getItemOption() throws Exception; 
}

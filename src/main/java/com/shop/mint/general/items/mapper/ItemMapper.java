package com.shop.mint.general.items.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.mint.general.items.domain.ItemVO;

@Mapper
public interface ItemMapper {
	
	//메인 리스트 띄우기
	public List<ItemVO> getMainList() throws Exception;
	
	//목록별 리스트 띄우기
	public List<ItemVO> getCateList() throws Exception;
	
	//상품 총 갯수 가져오기
	public int getCountItem();

	//페이징 처리한 목록 가져오기
	//public List<ItemVO> selectItem(PagingVO pagingVO);
	
	//아이템 상세보기
	public ItemVO getItemDetail(int item_No) throws Exception; 
}

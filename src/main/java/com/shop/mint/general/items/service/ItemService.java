package com.shop.mint.general.items.service;

import java.util.List;

import com.shop.mint.general.items.domain.ItemVO;

public interface ItemService {
	
	//메인 리스트 띄우기
	public List<ItemVO> getMainList() throws Exception;
	
	//목록별 리스트 띄우기
	public List<ItemVO> getCateList() throws Exception;
	
	//상품 총 갯수 가져오기
	public int getCountItem();

	// 페이징 처리하기
	//public List<ItemVO> selectItem(PagingVO pagingVO);
	
	//아이템 상세보기
	public ItemVO getItemDetail(int item_No) throws Exception; 
}

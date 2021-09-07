package com.shop.mint.general.items.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.shop.mint.common.utils.Criteria;
import com.shop.mint.common.utils.FileVO;
import com.shop.mint.general.items.domain.ItemOptionVO;
import com.shop.mint.general.items.domain.ItemVO;

public interface ItemService {
	
	//메인 상품리스트
	public List<ItemVO> getMainList(Criteria cri) throws Exception;
	
	//카테고리별 상품리스트
	public List<ItemVO> getCateList(Criteria cri) throws Exception;
	
	//베스트10 상품리스트
	public List<ItemVO> getBestList() throws Exception;
	
	//카테고리별 상품리스트
	public List<ItemVO> getDetailCateList(String itemCategoryName) throws Exception;
	
	//상품 전체 리스트
	public List<ItemVO> getAllList() throws Exception; 
	
	//총 아이템 갯수 출력
	public int getItemsCount();

	//아이템 상세
	public ItemVO getItemDetail(int itemNo) throws Exception; 
	
	//아이템 상세 - 아이템 옵션
	public List<ItemOptionVO> getItemOption() throws Exception; 
	
	//아이템 등록1 - 기존 것 
	public int insertItem(HttpServletRequest request, ItemVO itemVO) throws Exception;

	//아이템 등록 1-1 기존것 수정
	public void save(FileVO fileVO) throws Exception;
	
	//아이템 수정
	public int updateItem(ItemVO itemVO) throws Exception;
	
	//파일 수정
	public void update(FileVO fileVO) throws Exception;
	
	//아이템 삭제
	public void deleteItem(int itemNo) throws Exception;
	
	//아이템 삭제
	public void deleteFile(int itemNo) throws Exception;
		
}

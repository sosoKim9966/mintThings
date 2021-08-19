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
	
	//카테고리별 상품리스트
	public List<ItemVO> getBesetList() throws Exception;
	
	//카테고리별 상품리스트
	public List<ItemVO> getDetailCateList(String itemCategoryName) throws Exception;
	
	//상품 전체 리스트
	public List<ItemVO> getAllList() throws Exception;
	
	//총 아이템 갯수 출력
	public int getCountItems();

	//페이징 처리한 목록 가져오기
	//public List<ItemVO> selectItem(PagingVO pagingVO);
	
	//아이템 상세
	public ItemVO getItemDetail(int itemNo) throws Exception; 
	
	//아이템 상세 - 아이템 옵션
	public List<ItemOptionVO> getItemOption() throws Exception; 
	
	//아이템 조회수
	public int updateViewCnt(int itemNo) throws Exception;

	//아이템 등록 
	public int insertItem(ItemVO itemVO) throws Exception;
	
	//아이템 수정
	public int updateItem(ItemVO itemVO) throws Exception;
	
	//아이템 삭제 
	public void deleteItem(int itemNo) throws Exception;
	
	//파일 삭제 
	public void deleteFile(int itemNo) throws Exception;
	
}

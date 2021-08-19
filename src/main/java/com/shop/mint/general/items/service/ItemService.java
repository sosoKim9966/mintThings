package com.shop.mint.general.items.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.coyote.http11.Http11AprProtocol;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shop.mint.common.utils.FileVO;
import com.shop.mint.general.items.domain.ItemOptionVO;
import com.shop.mint.general.items.domain.ItemVO;

public interface ItemService {
	
	//메인 상품리스트
	public List<ItemVO> getMainList() throws Exception;
	
	//카테고리별 상품리스트
	public List<ItemVO> getCateList() throws Exception;
	
	//베스트10 상품리스트
	public List<ItemVO> getBesetList() throws Exception;
	
	//카테고리별 상품리스트
	public List<ItemVO> getDetailCateList(String itemCategoryName) throws Exception;
	
	//상품 전체 리스트
	public List<ItemVO> getAllList() throws Exception; 
	
	//총 아이템 갯수 출력
	public int getCountItems();

	// 페이징 처리 리스트
	//public List<ItemVO> selectItem(PagingVO pagingVO);
	
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

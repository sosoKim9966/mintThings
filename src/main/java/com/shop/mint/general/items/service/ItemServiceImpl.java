package com.shop.mint.general.items.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mint.general.items.controller.ItemController;
import com.shop.mint.general.items.domain.ItemOptionVO;
import com.shop.mint.general.items.domain.ItemVO;
import com.shop.mint.general.items.mapper.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemMapper itemMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);
	
	//메인 상품리스트
	@Override
	public List<ItemVO> getMainList() throws Exception {
		logger.info("(service)getMainList 실행"); 
		return itemMapper.getMainList();
	}
	
	//카테고리별 상품리스트
	@Override
	public List<ItemVO> getCateList() throws Exception {
		logger.info("(service)getCateList 실행"); 
		return itemMapper.getCateList();
	}
	//상품 전체 리스트
	@Override
	public List<ItemVO> getAllList() throws Exception {
		logger.info("(service)getAllList 실행");
		return itemMapper.getAllList();
	}

	//총 아이템 갯수 출력
	@Override
	public int getCountItems() {
		logger.info("(service)getCountItems 실행"); 
		return itemMapper.getCountItems();
	}

	//아이템 상세
	@Override
	public ItemVO getItemDetail(int item_No) throws Exception {
		logger.info("(service)getItemDetail 실행" + item_No); 
		
		return itemMapper.getItemDetail(item_No);
	}
	
	//아이템 상세 - 아이템 옵션
	@Override
	public List<ItemOptionVO> getItemOption() throws Exception {
		logger.info("(service)getItemOption 실행");
		return itemMapper.getItemOption();
	}

	//아이템 등록
	@Override
	public int insertItem(ItemVO itemVO) throws Exception {
		logger.info("(service)getItemOption 실행");
		return itemMapper.insertItem(itemVO);
	}

	//아이템 수정
	@Override
	public int updateItem(ItemVO itemVO) throws Exception {
		logger.info("(service)deleteItem 실행");
		return itemMapper.updateItem(itemVO);
	}
	
	//아이템 삭제
	@Override
	public void deleteItem(int item_No) throws Exception {
		logger.info("(service)deleteItem 실행");
		itemMapper.deleteItem(item_No);
	}

	
	
	

}

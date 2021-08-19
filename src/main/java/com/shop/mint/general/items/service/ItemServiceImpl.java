package com.shop.mint.general.items.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.shop.mint.common.utils.FileMapper;
//import com.shop.mint.common.utils.FileUtils;
import com.shop.mint.common.utils.FileVO;
import com.shop.mint.general.items.controller.ItemController;
import com.shop.mint.general.items.domain.ItemOptionVO;
import com.shop.mint.general.items.domain.ItemVO;
import com.shop.mint.general.items.mapper.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemMapper itemMapper;
	
	@Autowired
	private FileMapper fileMapper;
	
//	@Autowired
//	private FileUtils fileUtils;
	
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
	
	//베스트10 상품리스트
	@Override
	public List<ItemVO> getBesetList() throws Exception {
		logger.info("(service)getBesetList 실행"); 
		return itemMapper.getBesetList();
	}
	
	//카테고리별 상품리스트
	@Override
	public List<ItemVO> getDetailCateList(String itemCategoryName) throws Exception {
		logger.info("(service)getDetailCateList 실행 ==> " + itemCategoryName); 
		return itemMapper.getDetailCateList(itemCategoryName);
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
	public ItemVO getItemDetail(int itemNo) throws Exception {
		logger.info("(service)getItemDetail 실행 ==> " + itemNo); 
		itemMapper.updateViewCnt(itemNo);
		return itemMapper.getItemDetail(itemNo);
	}
	
	//아이템 상세 - 아이템 옵션
	@Override
	public List<ItemOptionVO> getItemOption() throws Exception {
		logger.info("(service)getItemOption 실행");
		return itemMapper.getItemOption();
	}

	//아이템 등록
	@Override
	public int insertItem(HttpServletRequest request, ItemVO itemVO) throws Exception {
		logger.info("(service)insertItem1 실행");
		return itemMapper.insertItem(itemVO);
	}
	
	//파일 등록
	@Override
	public void save(FileVO fileVO) throws Exception	{
		FileVO f = new FileVO();
		f.setOriginalName(fileVO.getOriginalName());
		f.setSaveName(fileVO.getSaveName());
		f.setFileUrl(fileVO.getFileUrl());
		fileMapper.insertFile(fileVO);
	}
	
	//아이템 수정
	@Override
	public int updateItem(ItemVO itemVO) throws Exception {
		logger.info("(service)updateItem 실행 ==> " + itemVO);
		return itemMapper.updateItem(itemVO);
	}
	
	//파일 수정
	@Override
	public void update(FileVO fileVO) throws Exception	{
		FileVO f = new FileVO();
		f.setOriginalName(fileVO.getOriginalName());
		f.setSaveName(fileVO.getSaveName());
		f.setFileUrl(fileVO.getFileUrl());
		fileMapper.updateFile(fileVO);
	}

	//아이템 삭제
	@Override
	public void deleteItem(int itemNo) throws Exception {
		logger.info("(service)deleteItem 실행");
		itemMapper.deleteFile(itemNo);
		itemMapper.deleteItem(itemNo);
		logger.info("(service)deleteItem 실행2  itemNo =>" + itemNo);
	
	}

	//파일 삭제
	@Override
	public void deleteFile(int itemNo) throws Exception {
		logger.info("(service)deleteFile 실행  itemNo =>" + itemNo);
		itemMapper.deleteFile(itemNo);
	}
	
	
	

}

package com.shop.mint.general.items.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.mint.general.items.domain.ItemOptionVO;
import com.shop.mint.general.items.domain.ItemVO;
import com.shop.mint.general.items.mapper.ItemMapper;
import com.shop.mint.general.items.service.ItemService;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemServiceImpl;
	
	ItemMapper itemMapper;
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	//메인 상품리스트
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String getmainList(Model model) throws Exception {
		logger.info("(controller)getmainList 실행");
		List<ItemVO> items = itemServiceImpl.getMainList();
		model.addAttribute("items", items);
		return "main";
	}

	//카테고리별 상품리스트
	@RequestMapping(value = "/cateList/Best10", method = RequestMethod.GET) 
	public String getCateList( Model model) throws Exception {
		
		logger.info("(controller)getCateList 실행"); 

//		int total = itemServiceImpl.countItem();
//		if(nowPage == null && cntPerPage == null) {
//			nowPage = "1";
//			cntPerPage = "5";
//		} else if(nowPage == null) {
//			nowPage = "1";
//		} else if(cntPerPage == null) {
//			cntPerPage = "5";
//		}
//		
//		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//		model.addAttribute("paging", pagingVO);
//		model.addAttribute("viewAll", itemServiceImpl.selectItem(pagingVO));
		List<ItemVO> items = itemServiceImpl.getCateList();
		model.addAttribute("items", items);
		return "list/cateList"; 
	}
	
	//상품 전체 리스트
	@RequestMapping(value = "/cateList/all", method = RequestMethod.GET) 
	public String getAllList( Model model) throws Exception {
		
		logger.info("(controller)getAllList 실행"); 

		List<ItemVO> items = itemServiceImpl.getCateList();
		model.addAttribute("items", items);
		return "list/cateList"; 
	}
	
	//아이템 상세
	@RequestMapping(value = "/items/detail", method = RequestMethod.GET) 
	public String getItemDetail(int item_no, Model model) throws Exception {
		logger.info("(controller)getDetail 실행 " + item_no); 
		List<ItemOptionVO> itemOp = itemServiceImpl.getItemOption();
		model.addAttribute("itemOp", itemOp);
		model.addAttribute("items", itemServiceImpl.getItemDetail(item_no));
	
		return "list/itemDetail";
	}
	
	
}

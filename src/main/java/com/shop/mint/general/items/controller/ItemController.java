package com.shop.mint.general.items.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.mint.general.items.domain.ItemVO;
import com.shop.mint.general.items.mapper.ItemMapper;
import com.shop.mint.general.items.service.ItemService;

@Controller
public class ItemController {
	
	@Autowired
	private ItemService itemServiceImpl;

	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String getmainList(Model model) throws Exception {
		logger.info("main 실행중.............");
		List<ItemVO> list;
		list = itemServiceImpl.getMainList();
		model.addAttribute("list", list);
		return "main";
	}

	@RequestMapping(value = "/cateList/Best10", method = RequestMethod.GET) 
	public String getCateList( Model model) throws Exception {
		
		logger.info("list 실행중............."); 

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
		List<ItemVO> list = itemServiceImpl.getCateList();
		model.addAttribute("list", list);
		return "list/cateList"; 
	}
	
	@RequestMapping(value = "/item/detail", method = RequestMethod.GET) 
	public String getDetail(Model model, int item_No) throws Exception {
		logger.info("디테일 실행중............."); 
		model.addAttribute("detailList", itemServiceImpl.getItemDetail(item_No));
		return "list/itemDetail"; 
	}
	
	
}

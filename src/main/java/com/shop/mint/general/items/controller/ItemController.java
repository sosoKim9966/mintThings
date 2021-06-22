package com.shop.mint.general.items.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
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

	// 메인 상품리스트
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String getmainList(Model model) throws Exception {
		logger.info("(controller)getmainList 실행");
		List<ItemVO> items = itemServiceImpl.getMainList();
		model.addAttribute("items", items);
		return "main";
	}

	// 카테고리별 상품리스트
	@RequestMapping(value = "/cateList/Best10", method = RequestMethod.GET)
	public String getCateList(Model model) throws Exception {
		logger.info("(controller)getCateList 실행");
		List<ItemVO> items = itemServiceImpl.getCateList();
		model.addAttribute("items", items);
		return "list/cateList";
	}

	// 상품 전체 리스트
	@RequestMapping(value = "/cateList/all", method = RequestMethod.GET)
	public String getAllList(Model model) throws Exception {
		logger.info("(controller)getAllList 실행");
		List<ItemVO> items = itemServiceImpl.getCateList();
		model.addAttribute("items", items);
		return "list/cateList";
	}

	// 아이템 상세
	@RequestMapping(value = "/items/detail", method = RequestMethod.GET)
	public String getItemDetail(int item_no, Model model) throws Exception {
		logger.info("(controller)getDetail 실행 item_no => " + item_no);
		List<ItemOptionVO> itemOp = itemServiceImpl.getItemOption();
		Set<ItemOptionVO> set = new HashSet<ItemOptionVO>(itemOp);
		logger.info("(controller)중복행 제거 시작 ");
		List<ItemOptionVO> newitemOp = new ArrayList<ItemOptionVO>(set);

		model.addAttribute("itemOp", newitemOp);
		model.addAttribute("items", itemServiceImpl.getItemDetail(item_no));

		return "list/itemDetail";
	}

	// 아이템 등록 GET
	@RequestMapping(value = "/items/register", method = RequestMethod.GET)
	public String GetinsertItem() {
		logger.info("(controller)insertItem 실행");
		return "items/itemsRegister";
	}

	// 아이템 등록 POST
	@RequestMapping(value = "/items/registerOk", method = RequestMethod.POST)
	public String postInsertItem(MultipartHttpServletRequest request, @ModelAttribute ItemVO itemVO) throws Exception {
		logger.info("(controller)itemRegister 실행 ");
		itemServiceImpl.insertItem(itemVO);
		return "redirect:/cateList/all";
	}

	// 아이템 수정 GET
	@RequestMapping(value = "/items/update/{item_No}", method = RequestMethod.GET)
	public String getUpdateItem(@PathVariable int item_No, Model model) throws Exception {
		logger.info("(controller)itemUpdate 실행 =>" + item_No );
		model.addAttribute("items", itemServiceImpl.getItemDetail(item_No));
		return "items/itemsUpdate";
	}

	//아이템 수정 POST
	@RequestMapping(value="/items/updateOk", method = RequestMethod.POST) 
	public String postUpdateItem(MultipartHttpServletRequest request, @ModelAttribute ItemVO itemVO) throws Exception { 
		logger.info("(controller)itemUpdate 실행" + itemVO);
		itemServiceImpl.updateItem(itemVO);
		return "redirect:/cateList/all"; 
	}
	 
	// 아이템 삭제
	@RequestMapping("/items/delete/{item_No}")
	public String itemDelete(@PathVariable int item_No) throws Exception {
		logger.info("(controller)itemDelete 실행 ");
		itemServiceImpl.deleteItem(item_No);
		return "redirect:/cateList/all";
	}

}

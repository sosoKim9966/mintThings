package com.shop.mint.general.items.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.shop.mint.common.utils.Criteria;
import com.shop.mint.common.utils.FileVO;
import com.shop.mint.common.utils.PageMaker;
import com.shop.mint.general.items.domain.ItemOptionVO;
import com.shop.mint.general.items.domain.ItemVO;
import com.shop.mint.general.items.service.ItemService;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemServiceImpl;
	
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);

	// 메인 상품리스트
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String getmainList(Model model, Criteria cri) throws Exception {
		logger.info("(controller)getmainList 실행");
		PageMaker pageMaker = new PageMaker();
		int perPageNum = 12;
		cri.setPerPageNum(perPageNum);
		System.out.println("한 페이지에 보여줄 아이템 개수 ==> " + cri.getPerPageNum());
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(itemServiceImpl.getItemsCount());
		
		List<ItemVO> items = itemServiceImpl.getMainList(cri);
		model.addAttribute("items", items);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("item", "item");
		return "main";
	}

	// 카테고리별 상품리스트
	@RequestMapping(value = "/cateList/Best10", method = RequestMethod.GET)
	public String getCateList(Model model) throws Exception {
		logger.info("(controller)getCateList 실행");
		List<ItemVO> items = itemServiceImpl.getBestList();
		model.addAttribute("items", items);
		model.addAttribute("Best10", "Best10");
		model.addAttribute("item", "item");
		return "list/cateList";
	}
	
	//카테고리별 상품리스트2
	@RequestMapping(value="/cateList/{itemCategoryName}", method = RequestMethod.GET)
	public String getDetailCateList(@PathVariable String itemCategoryName, Model model) throws Exception {
		logger.info("(controller)getDetailCateList 실행 => " + itemCategoryName);
		List<ItemVO> items = itemServiceImpl.getDetailCateList(itemCategoryName);
		model.addAttribute("items", items);
		model.addAttribute("item", "item");
		return "list/cateList";
	}
	
	// 상품 전체 리스트
	@RequestMapping(value = "/cateList/all", method = RequestMethod.GET)
	public String getAllList(Model model, Criteria cri) throws Exception {
		logger.info("(controller)getAllList 실행");
		PageMaker pageMaker = new PageMaker();
		int perPageNum = 12;
		cri.setPerPageNum(perPageNum);
		System.out.println("한 페이지에 보여줄 아이템 개수 ==> " + cri.getPerPageNum());
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(itemServiceImpl.getItemsCount());

		List<ItemVO> items = itemServiceImpl.getCateList(cri);
		model.addAttribute("items", items);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("item", "item");
		model.addAttribute("all", "all");
		return "list/cateList";
	}


	// 아이템 상세
	@RequestMapping(value = "/items/detail", method = RequestMethod.GET)
	public String getItemDetail(int itemNo, Model model) throws Exception {
		logger.info("(controller)getDetail 실행 itemNo ==> " + itemNo);
		List<ItemOptionVO> itemOp = itemServiceImpl.getItemOption();
		Set<ItemOptionVO> set = new HashSet<ItemOptionVO>(itemOp);
		logger.info("(controller)중복행 제거 시작 ");
		List<ItemOptionVO> newitemOp = new ArrayList<ItemOptionVO>(set);
		model.addAttribute("itemOp", newitemOp);
		model.addAttribute("items", itemServiceImpl.getItemDetail(itemNo));
		model.addAttribute("item", "item");

		return "list/itemDetail";
	}

	// 아이템 등록 GET
	@RequestMapping(value = "/items/register", method = RequestMethod.GET)
	public String GetinsertItem() {
		logger.info("(controller)insertItem 실행");
		return "items/itemsRegister";
	}
	
	//아이템 등록 POST
	@PostMapping(value="/items/registerOk")
	public String postInsertItem(HttpServletRequest request, @RequestPart MultipartFile files, ItemVO itemVO) throws Exception {
		logger.info("(controller)postInsertItem 실행");
		itemServiceImpl.insertItem(request, itemVO);
		FileVO file = new FileVO();
		 
		String sourceFileName = files.getOriginalFilename();
	 	String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
 		File destinationFile; 
 		String destinationFileName;
 		
	 	String fileUrl = "C:/mintThings/src/main/resource/";
	 	
	 	
	 	do {
	 		destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
			destinationFile = new File(fileUrl + destinationFileName); 		 	
		} while(destinationFile.exists());
		 
	 	destinationFile.getParentFile().mkdirs(); 
	 	files.transferTo(destinationFile);
	 	file.setIdx(file.getIdx());
	 	file.setSaveName(destinationFileName);
	 	file.setOriginalName(sourceFileName);
	 	file.setFileUrl(fileUrl);
		itemVO.setItemImage(file.getSaveName());
	 	logger.info("파일 저장된 이름 ===>"+file.getSaveName());
	 	logger.info("파일 원래 이름 ===>" + file.getOriginalName());
	 	logger.info("파일 url ==> " + file.getFileUrl());
	 	itemServiceImpl.save(file);
	 	
	 	return "redirect:/cateList/all";
	}	

	// 아이템 수정 GET
	@RequestMapping(value = "/items/update/{itemNo}", method = RequestMethod.GET)
	public String getUpdateItem(@PathVariable int itemNo, Model model) throws Exception {
		logger.info("(controller)itemUpdate 실행 ==> " + itemNo );
		model.addAttribute("items", itemServiceImpl.getItemDetail(itemNo));
		return "items/itemsUpdate";
	}

	
	//아이템 수정 POST
	@RequestMapping(value="/items/updateOk", method = RequestMethod.POST) 
	public String postUpdateItem(HttpServletRequest request, @RequestPart MultipartFile files, ItemVO itemVO, int itemNo) throws Exception { 
		logger.info("(controller)itemUpdate 실행 ==> " + itemVO);
		logger.info("들어온 아이템 번호 ==> " + itemNo );
		itemServiceImpl.deleteFile(itemNo);
		
		FileVO file = new FileVO();
		 
		String sourceFileName = files.getOriginalFilename();
	 	String sourceFileNameExtension = FilenameUtils.getExtension(sourceFileName).toLowerCase(); 
 		File destinationFile; 
 		String destinationFileName;
 		String fileUrl = "C:/mintThings/src/main/resource/"; 
	 	
	 	do {
	 		
	 		destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + sourceFileNameExtension; 
			destinationFile = new File(fileUrl + destinationFileName); 		 	
		} while(destinationFile.exists());
		 
	 	destinationFile.getParentFile().mkdirs(); 
	 	files.transferTo(destinationFile);
	 	file.setIdx(file.getIdx());
	 	file.setSaveName(destinationFileName);
	 	file.setOriginalName(sourceFileName);
	 	file.setFileUrl(fileUrl);
		itemVO.setItemImage(file.getSaveName());
	 	logger.info("파일 저장된 이름 ===>"+file.getSaveName());
	 	logger.info("파일 원래 이름 ===>" + file.getOriginalName());
	 	logger.info("파일 url ==> " + file.getFileUrl());
	 	logger.info("아이템 번호 ==> " + itemVO.getItemNo());
	 	itemServiceImpl.save(file);
		itemServiceImpl.updateItem(itemVO);
		return "redirect:/cateList/all";
}
			
	// 아이템 삭제
	@RequestMapping("/items/delete/{itemNo}")
	public String itemDelete(@PathVariable int itemNo) throws Exception {
		logger.info("(controller)itemDelete 실행 ==> " + itemNo);
		itemServiceImpl.deleteItem(itemNo);
		return "redirect:/cateList/all";
	}


}

package com.shop.mint.general.commonBoard.controller;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shop.mint.common.utils.Criteria;
import com.shop.mint.common.utils.PageMaker;
import com.shop.mint.general.commonBoard.domain.BoardVO;
import com.shop.mint.general.commonBoard.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardServiceImpl;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	//게시글 목록
	@RequestMapping(value="/board/notice", method = RequestMethod.GET)
	public String getBoard(Model model, Criteria cri) throws Exception {
		logger.info("(controller)getBoard 실행");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(boardServiceImpl.getBoardCount());
		
		model.addAttribute("board", "board");
		List<BoardVO> list = boardServiceImpl.getList(cri);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		return "board/board";
	}
	
	//게시글 상세보기
	@RequestMapping(value="/board/detail", method = RequestMethod.GET)
	public String getBoardDetail(Model model, int noticeNo) throws Exception {
		logger.info("(controller)getBoardDetail 실행 ==> " + noticeNo);
		model.addAttribute("board", "board");
		model.addAttribute("list", boardServiceImpl.getListDetail(noticeNo));
		return "board/detail";
	}
	
	//게시글 쓰기 GET
	@RequestMapping(value="/board/insert", method = RequestMethod.GET)
	public String getBoardInsert() throws Exception {
		logger.info("(controller)getBoardDetail 실행" );
		return "board/insert";
	}
	
	//게시글 쓰기 POST
	@RequestMapping(value="/board/insertOk", method = RequestMethod.POST)
	public String postBoardInsertOK(BoardVO boardVO) throws Exception {
		logger.info("(controller)postBoardInsertOK 실행" );
		boardServiceImpl.insertBoard(boardVO);
		return "redirect:/board/notice";
	}
	
	//게시글 수정 GET
	@RequestMapping(value="/board/update/{noticeNo}", method = RequestMethod.GET)
	public String getBoardUpdate(Model model, @PathVariable int noticeNo) throws Exception {
		logger.info("(controller)getBoardUpdate 실행 ==> " + noticeNo);
		BoardVO list = boardServiceImpl.getListDetail(noticeNo);
		model.addAttribute("list", list);
		return "board/update";
	}
	
	//게시글 수정 POST
	@RequestMapping(value="/board/updateOk", method = RequestMethod.POST)
	public String postBoardUpdate(Model model, BoardVO boardVO) throws Exception {
		logger.info("(controller)postBoardUpdate 실행" );
		boardServiceImpl.updateBoard(boardVO);
		return "redirect:/board/notice";
	}
	
	//게시글 삭제 
	@RequestMapping(value="/board/delete/{noticeNo}")
	public String boardDelete(@PathVariable int noticeNo) throws Exception {
		logger.info("(controller)boardDelete 실행 ==> " + noticeNo);
		boardServiceImpl.deleteBoard(noticeNo);
		return "redirect:/board/notice";
	}
	
}

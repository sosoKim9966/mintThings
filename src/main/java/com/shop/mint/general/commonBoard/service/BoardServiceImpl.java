package com.shop.mint.general.commonBoard.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mint.general.commonBoard.domain.BoardVO;
import com.shop.mint.general.commonBoard.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	//게시글 목록
	@Override
	public List<BoardVO> getList() throws Exception {
		logger.info("(service)getList 실행");
		return boardMapper.getList();
	}

	//게시글 상세
	@Override
	public BoardVO getListDetail(int noticeNo) throws Exception {
		logger.info("(service)getListDetail 실행 ==>" + noticeNo);
		boardMapper.boardViewCnt(noticeNo);
		logger.info("(service)boardViewCnt 실행 ==>" + noticeNo);
		return boardMapper.getListDetail(noticeNo);
	}

	//게시글 등록
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		logger.info("(service)insertBoard 실행 ");
		boardMapper.insertBoard(boardVO);
	}
	
	//게시글 수정
	@Override
	public int updateBoard(BoardVO boardVO) throws Exception {
		logger.info("(service)updateBoard 실행 ");
		return boardMapper.updateBoard(boardVO);
	}

	//게시글 삭제 
	@Override
	public void deleteBoard(int noticeNo) throws Exception {
		logger.info("(service)updateBoard 실행 ==> " + noticeNo);
		boardMapper.deleteBoard(noticeNo);
	}
	
	

	
	
}

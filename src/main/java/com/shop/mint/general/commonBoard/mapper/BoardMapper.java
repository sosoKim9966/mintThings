package com.shop.mint.general.commonBoard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.shop.mint.common.utils.Criteria;
import com.shop.mint.general.commonBoard.domain.BoardVO;

@Mapper
public interface BoardMapper {
	
	//게시글 목록
	public List<BoardVO> getList(Criteria cri) throws Exception;

	//게시글 총 개수 
	public int getBoardCount();
	
	//게시글 조회수 
	public int boardViewCnt(int noticeNo) throws Exception;
	
	//게시글 상세
	public BoardVO getListDetail(int noticeNo) throws Exception;
	
	//게시글 등록 
	public void insertBoard(BoardVO boardVO) throws Exception;
	
	//게시글 수정 
	public int updateBoard(BoardVO boardVO) throws Exception;
	
	//게시글 삭제 
	public void deleteBoard(int noticeNo) throws Exception;
}

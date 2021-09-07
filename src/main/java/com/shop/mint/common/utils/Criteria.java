package com.shop.mint.common.utils;

import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
	
	private int page;           //현재 페이지 번호
    private int perPageNum;	 	//한 페이지당 보여줄 게시글의 개수
    
    private String searchType;
    private String keyword;
    
    public int getPageStart() { // 특정 페이지의 게시글 시작번호, 게시글 시작 행 번호
    	//현재 페이지의 게시글 시작 번호 = (현재 페이지 번호 - 1) * 페이지당 보여줄 게시글 갯수
    	return (this.page-1)*perPageNum;
    }
    
    public Criteria() {  //기본 생성자
        this.page = 1;
        this.perPageNum = 10;
        this.searchType = null;
        this.keyword = null;
    }
    
    public int getPage() {  //현재 페이지 번호
        return page;
    }
    
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }
    
    public int getPerPageNum() {  //한 페이지당 보여줄 게시글 개수
        return perPageNum;
    }
    
//    public void setPerPageNum(int pageCount) {
//        int cnt = this.perPageNum;
//        if(pageCount != cnt) {
//            this.perPageNum = cnt;
//        } else {
//            this.perPageNum = pageCount;
//        }
//    }
    
    public void setPerPageNum(int perPageNum) {
    	this.perPageNum = perPageNum;
    }
    
    public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	//searchType, keyword 추가
    public String makeQuery() {
    	UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
    			.queryParam("page", page)
    			.queryParam("perPageNum", this.perPageNum);
		
    	if (searchType!=null) {
    		uriComponentsBuilder
    		.queryParam("searchType", this.searchType)
    		.queryParam("keyword", this.keyword);
    	}
    	
    	return uriComponentsBuilder.build().encode().toString();
    }
    
}

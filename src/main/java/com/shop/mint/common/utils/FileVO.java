package com.shop.mint.common.utils;

import lombok.Data;

@Data
public class FileVO{
	private int idx;             	//파일 PK
	private int itemIdx;  			//아이템 FK
	private String originalName; 	//원본 파일명
	private String saveName; 		//저장 파일명
	private String fileUrl;			//파일 경로
}

package com.shop.mint.general.commonBoard.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int noticeNo;
	private int userNo;
	private int noticeViewCnt;
	private String noticeTitle;
	private String noticeContent;
	private String noticeWriter;
	private String noticeKind;
	private Date noticeRegdate;
}

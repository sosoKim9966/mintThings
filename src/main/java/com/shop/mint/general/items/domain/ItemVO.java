package com.shop.mint.general.items.domain;

import com.shop.mint.common.utils.FileVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class ItemVO extends FileVO{
	private int itemNo;
	private int itemPrice;
	private int itemSalePrice;
	private int itemStock;
	private int itemViewCnt;
	private String itemCategoryName;
	private String itemName;
	private String itemContent;
	private String itemRefundYn;
	private String itemImage;
}

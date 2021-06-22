package com.shop.mint.general.items.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ItemVO {
	private int itemNo;
	private String itemCategoryName;
	private String itemName;
	private String itemContent;
	private int itemPrice;
	private int itemSalePrice;
	private int itemStock;
	private String itemRefundYn;
	private int itemViewCnt;
	private String itemImage;
}

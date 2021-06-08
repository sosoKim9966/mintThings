package com.shop.mint.general.items.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ItemVO {
	private int item_No;
	private String item_Category;
	private String item_Name;
	private String item_Content;
	private int item_Price;
	private int item_Sale_Price;
	private int item_Stock;
	private String item_RefundYn;
	private int item_View_Cnt;
	private String item_Image;
}

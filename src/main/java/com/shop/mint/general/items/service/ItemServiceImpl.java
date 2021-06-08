package com.shop.mint.general.items.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mint.general.items.domain.ItemVO;
import com.shop.mint.general.items.mapper.ItemMapper;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private ItemMapper itemMapper;
	
	@Override
	public List<ItemVO> getMainList() throws Exception {
		return itemMapper.getMainList();
	}

	@Override
	public List<ItemVO> getCateList() throws Exception {
		return itemMapper.getCateList();
	}

	@Override
	public int getCountItem() {
		return itemMapper.getCountItem();
	}

	@Override
	public ItemVO getItemDetail(int item_No) throws Exception {
		return itemMapper.getItemDetail(item_No);
	}

}

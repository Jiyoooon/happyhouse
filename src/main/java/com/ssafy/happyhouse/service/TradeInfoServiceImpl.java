package com.ssafy.happyhouse.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.TradeInfoDao;
import com.ssafy.happyhouse.dto.TradeInfo;

@Service
public class TradeInfoServiceImpl implements TradeInfoService{
	@Autowired
	private TradeInfoDao tradeInfoDao;
	
	@Override
	public List<TradeInfo> searchTradesByDong(String gu, String dong) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("gu", gu);
		map.put("dong", dong);
		return tradeInfoDao.searchTradeByDong(map);
	}

	@Override
	public List<String> searchTradeCode() {
		return tradeInfoDao.searchTradeCode();
	}

}

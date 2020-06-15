package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.TradeInfo;

public interface TradeInfoService {
	public List<TradeInfo> searchTradesByDong(String gu, String dong);
	public List<String> searchTradeCode();
}

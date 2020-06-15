package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.TradeInfo;
import com.ssafy.happyhouse.service.TradeInfoService;

@RestController
public class TradeController {
	@Autowired
	private TradeInfoService tradeInfoService;
	
	@GetMapping("api/trade/{gu}/{dong}")
	public List<TradeInfo> findTradesByDong(@PathVariable("gu") String gu, @PathVariable("dong") String dong){
		List<TradeInfo> trades = tradeInfoService.searchTradesByDong(gu, dong);
		return trades;
	}
	
	@GetMapping("api/trade/codename")
	public List<String> findTradesCode(){
		return tradeInfoService.searchTradeCode();
	}
}

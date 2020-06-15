package com.ssafy.happyhouse.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.TradeInfo;

@Mapper
public interface TradeInfoDao {
	public List<TradeInfo> searchTradeByDong(HashMap<String, String> gudong);
	public List<String> searchTradeCode();
}

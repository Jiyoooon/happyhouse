package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.HouseInfoSearch;

public interface HouseInfoService {

	public List<HouseInfo> searchAllHouseInfo();
	public HouseInfo search(int no);
	public HouseInfo search(HouseInfoSearch houseInfoSearch);
	public void add(HouseInfo houseinfo);
	public void remove(int no);
	public void update(HouseInfo houseinfo);
	
}

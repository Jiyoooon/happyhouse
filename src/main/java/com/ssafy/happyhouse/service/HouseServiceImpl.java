package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.dao.HouseDao;
import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.HouseInfoSearch;
import com.ssafy.happyhouse.dto.SidoCode;


@Service
public class HouseServiceImpl implements HouseService{
	
	@Autowired
	private HouseDao dao;

	public HouseDeal search(int no) {
		try {
			HouseDeal deal = dao.searchDealByNo(no);
			if(deal == null) {
				throw new HappyHouseException(String.format("거래번호 %d번에 해당하는 주택거래 정보가 존재하지 않습니다."
															, no));
			}
			return deal;
		}catch(SQLException e) {
			throw new HappyHouseException("주택 정보 조회 중 오류 발생");
		}
	}
	@Override
	public ArrayList<SidoCode> selectSido() {
		ArrayList<SidoCode> list = dao.searchSido();
		return list;
	}
	@Override
	public ArrayList<SidoCode> selectGugun(String sido) {
		ArrayList<SidoCode> list = dao.searchGugun(sido);
		return list;
	}
	@Override
	public ArrayList<HouseInfo> selectDong(String gugun) {
		ArrayList<HouseInfo> list = dao.searchDong(gugun);
		return list;
	}
	@Override
	public ArrayList<HouseInfo> selectApts(String dong) {
		ArrayList<HouseInfo> list = dao.searchHouseInfos(dong);
		return list;
	}
	@Override
	public ArrayList<HouseDeal> search(HouseInfoSearch houseInfoSearch) {
		ArrayList<HouseDeal> list = dao.searchDeals(houseInfoSearch);
		return list;
	}
}





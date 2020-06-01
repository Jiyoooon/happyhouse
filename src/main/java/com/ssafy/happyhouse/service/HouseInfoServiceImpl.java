package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.HappyHouseException;
import com.ssafy.happyhouse.dao.HouseInfoDao;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.HouseInfoSearch;

@Service
public class HouseInfoServiceImpl implements HouseInfoService {
	
	@Autowired
	private HouseInfoDao dao;

	@Override
	public List<HouseInfo> searchAllHouseInfo() {
		try {
			return dao.searchAll();
		} catch (Exception e) {
			throw new HappyHouseException("모든자료 검색 중 오류발생");
		}
	}

	@Override
	public HouseInfo search(int no) {
		try {
			return dao.searchByNo(no);
		} catch (SQLException e) {
			throw new HappyHouseException("no로 검색 중 오류발생");
		}
	}
	
	@Override
	public HouseInfo search(HouseInfoSearch houseInfoSearch) {
		try {
			return dao.searchByAptname(houseInfoSearch);
		} catch (SQLException e) {
			throw new HappyHouseException("dong+code+aptname으로 검색 중 오류발생");
		}
	}

	@Override
	public void add(HouseInfo houseinfo) {

		try {
			dao.insert(houseinfo);
		} catch (SQLException e) {
			throw new HappyHouseException("정보 추가 중 오류 발생");
		}
	}

	@Override
	public void remove(int no) {
		try {
			dao.delete(no);
		} catch (SQLException e) {
			throw new HappyHouseException("정보 삭제 중 오류발생");
		}		
	}

	@Override
	public void update(HouseInfo houseinfo) {
		try {
			dao.update(houseinfo);
		} catch (SQLException e) {
			throw new HappyHouseException("정보 수정중 오류발생");
		}		
	}

	

}

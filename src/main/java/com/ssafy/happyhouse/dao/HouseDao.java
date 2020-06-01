package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.HouseInfoSearch;
import com.ssafy.happyhouse.dto.HousePageBean;
import com.ssafy.happyhouse.dto.SidoCode;

@Mapper
public interface HouseDao {
		
	public HouseDeal searchDealByNo(int no) throws SQLException;
	public ArrayList<SidoCode> searchSido();
	public ArrayList<SidoCode> searchGugun(String sido);
	public ArrayList<HouseInfo> searchDong(String gugun);
	public ArrayList<HouseInfo> searchHouseInfos(String dong);
	public ArrayList<HouseDeal> searchDeals(HouseInfoSearch houseInfoSearch);

	/**
	 * 검색 조건(key) 검색 단어(word)에 해당하는 아파트 거래 정보(HouseInfo)를  검색해서 반환.  
	 * @param bean  검색 조건과 검색 단어가 있는 객체
	 * @return 조회한 식품 목록
	 */
//	public List<HouseDeal> searchAll(HousePageBean  bean) throws SQLException;
//	public int countSearchAll(HousePageBean  bean) throws SQLException;
	/**
	 * 아파트 식별 번호에 해당하는 아파트 거래 정보를 검색해서 반환. 
	 * @param no	검색할 아파트 식별 번호
	 * @return		아파트 식별 번호에 해당하는 아파트 거래 정보를 찾아서 리턴한다, 없으면 null이 리턴됨
	 */
}

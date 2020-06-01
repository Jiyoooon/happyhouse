package com.ssafy.happyhouse.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.HouseInfoSearch;

@Mapper
public interface HouseInfoDao {

	/**HouseInfo DB에 위도 경도 입력하기 위해서  등록된 모든 집의 동과 지번을 추출한다.  */
	public List<HouseInfo> searchAll() throws  SQLException;
	public HouseInfo searchByNo(int no) throws SQLException;
	public HouseInfo searchByAptname(HouseInfoSearch houseInfoSearch) throws SQLException;
	public void insert (HouseInfo houseinfo) throws SQLException;
	public void delete (int no) throws SQLException;
	public void update(HouseInfo houseinfo) throws SQLException;
}

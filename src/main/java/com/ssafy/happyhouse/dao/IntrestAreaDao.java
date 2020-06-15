package com.ssafy.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.IntrestArea;
import com.ssafy.happyhouse.dto.SidoCode;

@Mapper
public interface IntrestAreaDao {
	public int insertArea(IntrestArea area);
	public List<IntrestArea> searchAreaById(String userid);
	public SidoCode searchAreaInfo(IntrestArea area);
	public int deleteArea(IntrestArea area);
}
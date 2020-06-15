package com.ssafy.happyhouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.IntrestArea;

@Mapper
public interface IntrestAreaDao {
	public int insertArea(IntrestArea area);
	public List<IntrestArea> searchAreaById(String userid);
	public int deleteArea(IntrestArea area);
}
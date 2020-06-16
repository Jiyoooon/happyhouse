package com.ssafy.happyhouse.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.dto.SchoolInfo;

@Mapper
public interface SchoolInfoDao {
	public List<SchoolInfo> searchSchoolByDong(String dong);
}

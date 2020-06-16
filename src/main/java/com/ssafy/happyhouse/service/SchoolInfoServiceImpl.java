package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.SchoolInfoDao;
import com.ssafy.happyhouse.dto.SchoolInfo;

@Service
public class SchoolInfoServiceImpl implements SchoolInfoService {
	
	@Autowired
	private SchoolInfoDao schoolInfoDao;
	
	public List<SchoolInfo> searchSchoolByDong(String dong){
		return schoolInfoDao.searchSchoolByDong(dong);
	}

}

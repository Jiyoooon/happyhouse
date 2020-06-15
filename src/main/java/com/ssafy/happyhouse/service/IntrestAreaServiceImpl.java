package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.IntrestAreaDao;
import com.ssafy.happyhouse.dto.IntrestArea;

@Service
public class IntrestAreaServiceImpl implements IntrestAreaService{
	@Autowired
	private IntrestAreaDao intrestAreaDao;
	
	@Override
	public int insertArea(IntrestArea area) {
		return intrestAreaDao.insertArea(area);
	}

	@Override
	public List<IntrestArea> searchAreaById(String userid) {
		return intrestAreaDao.searchAreaById(userid);
	}

	@Override
	public int deleteArea(IntrestArea area) {
		return intrestAreaDao.deleteArea(area);
	}

}

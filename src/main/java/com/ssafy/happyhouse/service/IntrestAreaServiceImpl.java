package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.dao.IntrestAreaDao;
import com.ssafy.happyhouse.dto.IntrestArea;
import com.ssafy.happyhouse.dto.SidoCode;

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
		List<IntrestArea> areaList = intrestAreaDao.searchAreaById(userid);
		for(IntrestArea area : areaList) {
			area.setSido_name(intrestAreaDao.searchAreaInfo(area));
		}
		return areaList;
	}

	@Override
	public int deleteArea(IntrestArea area) {
		return intrestAreaDao.deleteArea(area);
	}

}

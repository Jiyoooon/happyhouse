package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.dto.IntrestArea;
import com.ssafy.happyhouse.dto.SidoCode;

public interface IntrestAreaService {
	public int insertArea(IntrestArea area);
	public List<IntrestArea> searchAreaById(String userid);
	public int deleteArea(IntrestArea area);
}

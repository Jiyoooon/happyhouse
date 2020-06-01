package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.HouseDeal;
import com.ssafy.happyhouse.dto.HouseInfo;
import com.ssafy.happyhouse.dto.HouseInfoSearch;
import com.ssafy.happyhouse.dto.SidoCode;
import com.ssafy.happyhouse.service.HouseInfoService;
import com.ssafy.happyhouse.service.HouseService;

@RestController
@RequestMapping("/api")
public class MainController {

	@Autowired
	HouseService houseService;

	@Autowired
	HouseInfoService houseInfoService;

	@RequestMapping(value = "/sido", method = RequestMethod.GET)
	public ResponseEntity<List<SidoCode>> findAllSido() throws Exception {
		List<SidoCode> sidos = houseService.selectSido();
		if (sidos.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<SidoCode>>(sidos, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/gugun/{sido}", method = RequestMethod.GET)
	public ResponseEntity<List<SidoCode>> findGugunBySido(@PathVariable("sido") String sido) throws Exception {
		List<SidoCode> guguns = houseService.selectGugun(sido);
		if (guguns.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<SidoCode>>(guguns, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/dong/{gugun}", method = RequestMethod.GET)
	public ResponseEntity<List<HouseInfo>> findDongByGugun(@PathVariable("gugun") String gugun) throws Exception {
		List<HouseInfo> dongs = houseService.selectDong(gugun);
		if (dongs.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<HouseInfo>>(dongs, HttpStatus.OK);
	}

	@RequestMapping(value = "/houseinfo/{dong}", method = RequestMethod.GET)
	public ResponseEntity<List<HouseInfo>> findHouseInfoByDong(@PathVariable("dong") String dong) throws Exception {

		List<HouseInfo> houseInfos = houseService.selectApts(dong);
		if (houseInfos.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);//해당 지역에 거래중인 집이 X
		}
		return new ResponseEntity<List<HouseInfo>>(houseInfos, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/houseinfo/{dong}/{code}/{aptName}", method = RequestMethod.GET)
	public ResponseEntity<List<HouseDeal>> detailHouseInfo
				(@PathVariable("dong") String dong, @PathVariable("code") int code
						, @PathVariable("aptName") String aptName) throws Exception {
		
		HouseInfoSearch searchInfo = new HouseInfoSearch(dong, code, aptName);
		
		List<HouseDeal> houseDeals = houseService.search(searchInfo);
		if (houseDeals.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);//해당 지역에 거래중인 집이 X
		}
		return new ResponseEntity<List<HouseDeal>>(houseDeals, HttpStatus.OK);
	}

}

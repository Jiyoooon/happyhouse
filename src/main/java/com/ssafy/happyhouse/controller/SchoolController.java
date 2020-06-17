package com.ssafy.happyhouse.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.SchoolInfo;
import com.ssafy.happyhouse.service.SchoolInfoService;

@RestController
public class SchoolController {
	
	@Autowired
	private SchoolInfoService schoolInfoService;
	
	@GetMapping("api/school/{dong}")
	public List<SchoolInfo> findSchoolByDong(@PathVariable("dong") String dong){
		
		List<SchoolInfo> schools = schoolInfoService.searchSchoolByDong(dong);
//		System.out.println(schools.toString());
		return schools;
	}
}

package com.ssafy.happyhouse.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.dto.IntrestArea;
import com.ssafy.happyhouse.dto.Member;
import com.ssafy.happyhouse.service.IntrestAreaService;

@RestController
public class IntrestAreaController {
	
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private IntrestAreaService intrestAreaService;
	
	@GetMapping("api/area/{id}")
	public List<IntrestArea> findAreasById(@PathVariable("id") String userid){
		return intrestAreaService.searchAreaById(userid);
	}
	
	@PostMapping("api/area")
	public ResponseEntity<String> addArea(@RequestBody IntrestArea area, HttpSession session) {
		Member curUser = (Member)session.getAttribute("userinfo");
		if(curUser == null) return new ResponseEntity<String>(FAIL, HttpStatus.NOT_ACCEPTABLE);
		
		area.setArea_userid(curUser.getUserid());
		int result = intrestAreaService.insertArea(area);

		if(result == 1) return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		else return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
	
	
	@DeleteMapping("api/area/{id}/{dong}")
	public ResponseEntity<String> removeArea(@PathVariable("id") String userid, @PathVariable("dong") String dong){
		IntrestArea area = new IntrestArea();
		area.setArea_userid(userid);
		area.setArea_dong(dong);
		
		int result = intrestAreaService.deleteArea(area);
		
		if(result == 1) return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		else return new ResponseEntity<String>(FAIL, HttpStatus.NO_CONTENT);
	}
}
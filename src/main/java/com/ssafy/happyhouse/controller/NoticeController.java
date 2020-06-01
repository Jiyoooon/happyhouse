package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.service.NoticeService;

@Controller
public class NoticeController {
	
	@Autowired
	NoticeService service;
	
	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView mav = new ModelAndView("error/error");
		mav.addObject("msg"+e.getMessage());
		return mav;
	}
	
	@GetMapping("noticelist")
	 public String boardList( Model model) {
		String key= (String)model.getAttribute("key");
		String word= (String)model.getAttribute("word");
		try {
			model.addAttribute("notices", service.listNotice(key,word));
			return "notice/list";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","목록을 얻어오는 중 문제 발생");
			return "error/error";
		}
	 }
}

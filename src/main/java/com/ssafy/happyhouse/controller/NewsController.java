package com.ssafy.happyhouse.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.service.NewsService;

@Controller
public class NewsController {
	
	@Autowired
	NewsService newsservice;
	
	
	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView mav = new ModelAndView("error/error");
		mav.addObject("msg"+e.getMessage());
		return mav;
	}
	
	@RequestMapping("newslist")
	public String newsList(Model model) {
	
		try {
//			System.out.println("출력 한번해보자 ");
			model.addAttribute("newslist", newsservice.getNewsDatas());
			return "news/newslist";	
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","크롤링 하는 중 문제 발생");
			return "error/error";
		}
		
	}
	

}

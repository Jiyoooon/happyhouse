package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.dto.Member;
import com.ssafy.happyhouse.dto.NoticeDto;
import com.ssafy.happyhouse.service.NoticeService;
@CrossOrigin(origins = { "*" }, maxAge = 6000)
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
	
	@GetMapping("qna")
	public String qnaTap() {
		return "qna/qna";
	}
	@GetMapping("noticelist")
	 public String boardList( Model model,String key, String word) {
		try {
			model.addAttribute("notices", service.listNotice(key,word));
			return "notice/list";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","목록을 얻어오는 중 문제 발생");
			return "error/error";
		}
	 }
	@GetMapping("movewrite")
	 public String writeform() {
		 return "notice/write";
	 }
	
	@GetMapping("mvnoticemodify")
	 public String moveModifyNotice(HttpServletRequest request) {
		int bookno =Integer.parseInt(request.getParameter("bookno"));
		try {
			NoticeDto dto = service.getNotice(bookno);
			request.setAttribute("notice", dto);
			return "notice/modify";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg","글 수정페이지 이동  중 문제 발생");
			return "error/error";
		}
	}
	
	@PostMapping("noticesave")
	public String savenotice(NoticeDto notice, Model model,HttpSession session) {
		try {
			Member member = (Member) session.getAttribute("userinfo");
			notice.setUserid(member.getUserid());
			notice.setUsername(member.getUsername());
			service.writeNotice(notice);
			return "redirect:/noticelist";
			
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg","글 저장 중 문제 발생");
			return "error/error";
		} 
	}
	
	
	@RequestMapping("noticemodify")
	 public String modifyNotice(@ModelAttribute NoticeDto notice, HttpServletRequest request){
		
		try {
//			notice.setBookno(Integer.parseInt(request.getParameter("bookno")));
			notice.setSubject((request.getParameter("subject")));
			notice.setContext((request.getParameter("context")));
			service.modifyNotice(notice);
			return "redirect:/noticelist";
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg","글수정 처리중 문제발생");
			return "error/error/";
		}

	}
	@RequestMapping("noticedelete")
	 public String deleteNotice(HttpServletRequest request) {
		int bookno =Integer.parseInt(request.getParameter("bookno"));
		try {
			service.deleteNotice(bookno);
			return "redirect:/noticelist";
			
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg","글 수정 중 문제 발생");
			return "error/error";
		}
	}
	
}

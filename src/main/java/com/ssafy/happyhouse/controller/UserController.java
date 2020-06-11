package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.dto.Member;
import com.ssafy.happyhouse.service.MemberService;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@Controller
public class UserController {
	@Autowired
	private MemberService service;

	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		e.printStackTrace();
		ModelAndView mav = new ModelAndView("error/error");
		mav.addObject("msg", e.getMessage());
		return mav;
	}

	@GetMapping("mvlogin")
	public String loginform() {
		return "user/login";
	}
	@GetMapping("mvjoin")
	public String joinform() {
		return "user/join";
	}
	@GetMapping("mypage")
	public String mypage(Model model) {
		model.addAttribute("disable", true);//수정 불가
		return "user/mypage";
	}
	@GetMapping("mvmodify")
	public String moveModify(Model model) {//회원정보 수정 및 삭제 page
		model.addAttribute("disable", false);//수정 가능
		return "user/mypage";
	}
	@PostMapping("login")
	 public String login(String userid, String userpwd, Model model, HttpSession session) {
		 try {
			Member member = service.login(userid, userpwd);
//			System.out.println(userid+", "+userpwd+", "+member);
			if(member != null) {//로그인 성공
				session.setAttribute("userinfo", member);
				return "redirect:/";
			}else {//로그인 실패
				model.addAttribute("msg", "아이디나 비밀번호를 다시 확인해주세요");
				return "user/login";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		 
	 }
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";//메인페이지로
	}
	
	@PostMapping("join")
	 public String join(Member member, Model model) {
		if(member.getUserid() == "" || member.getUserpwd() == "" 
				|| member.getUsername() == "" || member.getEmail() == "" 
				|| member.getTel() == "") {
			
			model.addAttribute("msg", "입력을 확인하고 다시 시도해주세요.");
			return "user/join";
		}else {
			service.add(member);
			return "user/login";//로그인 화면으로
		}
	 }
	
	//수정
	@PostMapping("modify")
	public String modifyMember(Member member, Model model, HttpSession session) {
		Member curUser = (Member) session.getAttribute("userinfo");
		member.setUserid(curUser.getUserid());

//		System.out.println("수정 전 id : "+member.getUserid());
		service.update(member);
		session.setAttribute("userinfo", member);//세션 멤버정보 갱신
		
		return "redirect:/mypage";//마이페이지로 이동
	}
	
	//삭제
	@GetMapping("delete")
	public String deleteMember(HttpSession session) {
		Member member = (Member) session.getAttribute("userinfo");
		service.remove(member.getUserid());
		
		session.invalidate();//세션정보 다 지움
		return "redirect:/";//회원정보 삭제 후 메인페이지로
	}
	
	//아이디체크
	@GetMapping("checkid/{userid}")
	public @ResponseBody HashMap<String, Boolean> checkId(@PathVariable("userid") String userid){
		HashMap<String, Boolean> map = new HashMap<String, Boolean>();
//		System.out.println("아이디체크 : "+userid);

		if(service.checkId(userid)) {
			map.put("idExist", false);
		}else {//이미 있는 아이디
			map.put("idExist", true);
		}
		System.out.println(map.get("idExist"));
		return map;
	}
	
	//현재 로그인 정보 리턴
	@GetMapping("userinfo")
	public @ResponseBody HashMap<String, Member> userInfo(HttpSession session){
		HashMap<String, Member> map = new HashMap<String, Member>();
		Member curUser = (Member) session.getAttribute("userinfo");
		
		map.put("curUser", curUser);

		return map;
	}
	
	//멤버리스트
	@GetMapping("memberlist")
	public String listMember(Model model, String key, String word) {
		try {
			List<Member> list = service.listMember(key, word);
			model.addAttribute("members", list);
			return "user/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "회원정보 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}

}

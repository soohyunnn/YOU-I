package com.example.springpjt.member.web;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.example.springpjt.member.model.dto.MemberVO;
import com.example.springpjt.member.service.MemberService;
import com.example.springpjt.scheduler.web.SchedulerController;

@Controller
public class MemberController {

	//로그 준비(접속이 잘되는지 확인)
	private static final Logger logger = LoggerFactory.getLogger(SchedulerController.class);
	
	@Inject
	private MemberService memberService;
	
	//01.로그인 처리
	@RequestMapping(value="/loginCheck.do" ,method=RequestMethod.POST )
	public String loginCheck(@ModelAttribute MemberVO memberVO,Model model, HttpServletRequest request)throws Exception{
		System.out.println("loginCheck()");
		logger.info("MemberController loginCheck");
		System.out.println(memberVO.getUserId());
		
		HashMap<String,Object> loginresultMap = new HashMap<String,Object>();
		
		loginresultMap = memberService.loginCheck(memberVO ,request);
		
		model.addAttribute("loginresultMap", loginresultMap);
			
		return "jsonView";
	}
	
	//02.로그아웃 처리
	@RequestMapping(value="logout.do")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();	//세션 전체를 날려버린다
		return "redirect:/";	//로그아웃 버튼을 누르면 바로 메인페이지로 리다이렉트함
	}
	
	//03.회원가입 처리
	@RequestMapping(value="memberJoin.do",method=RequestMethod.POST )
	public String memberJoin(@ModelAttribute MemberVO memberVO,Model model)throws Exception{
		System.out.println("memberJoin()");
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		resultMap = memberService.memberJoin(memberVO);
		
		model.addAttribute("resultMap", resultMap);
		
		return "jsonView";
		
	}
	
	//04.중복ID체크 처리
		@RequestMapping(value="duplicateIdCheck.do",method=RequestMethod.POST )
		public String duplicateIdCheck(@ModelAttribute MemberVO memberVO,Model model)throws Exception{
			System.out.println("viewMember()");

			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			resultMap = memberService.duplicateIdCheck(memberVO);

			model.addAttribute("resultMap", resultMap);

			return "jsonView";

		}
		
		
	

	
}

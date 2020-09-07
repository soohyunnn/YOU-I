package com.example.springpjt.member.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.example.springpjt.member.model.dto.MemberVO;

public interface MemberService {

	//1.회원 로그인 체크
	public HashMap<String,Object> loginCheck(MemberVO memberVO, HttpServletRequest request)throws Exception;
	
	//2.회원 로그아웃
	public void logout(HttpSession session);
	
	//3.회원 회원가입
	public HashMap<String, Object> memberJoin(MemberVO memberVO) throws Exception;
	
	//4.중복 ID 체크
	public HashMap<String, Object> duplicateIdCheck(MemberVO memberVO) throws Exception;
	
}

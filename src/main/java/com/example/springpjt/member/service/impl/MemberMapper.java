package com.example.springpjt.member.service.impl;

import javax.servlet.http.HttpSession;

import com.example.springpjt.member.model.dto.MemberVO;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("memberMapper")
public interface MemberMapper {
	
		//1.회원 로그인 체크
		public MemberVO loginCheck(MemberVO memberVO);	//로그인 성공 시 회원 모든 정보를 담는다
		
		//2.회원 로그아웃
		public void logout(HttpSession session);
	
		//3.회원 회원가입
		public void memberJoin(MemberVO memberVO);
	
		//4.중복체크
		public int duplicateIdCheck(MemberVO memberVO);
	
}

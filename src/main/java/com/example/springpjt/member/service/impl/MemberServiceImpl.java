package com.example.springpjt.member.service.impl;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.springpjt.member.model.dto.MemberVO;
import com.example.springpjt.member.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberMapper memberDAO;
	
	//1.회원 로그인 체크
	@Override
	public HashMap<String,Object> loginCheck(MemberVO memberVO, HttpServletRequest request) throws Exception{
		
		HashMap<String,Object> loginresultMap = new HashMap<String,Object>();
		MemberVO login = null;
		try{
				
			login = memberDAO.loginCheck(memberVO);		//db에서 가져온 로그인 회원 정보의 모든 객체를 login에 저장
			request.getSession().setAttribute("login",login);	//login 객체를 login이라는 이름으로 세션에 저장(스케줄페이지가 로그인만 하면 뜨기때문에 필요)
			request.getSession().setAttribute("userName",login.getUserName());
			loginresultMap.put("result", "success");	//로그인 성공시를 판단 result이름으로 success를 map에 저장
			loginresultMap.put("loginCheck",login );	//login에 받아온 회원정보 객체를 loginCheck이름으로 map에 저장
					
		}catch(Exception e){
			e.printStackTrace();
		}
		return loginresultMap;		
		
	}

	//2.회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	
	//3.회원 회원가입
	@Override
	public HashMap<String, Object> memberJoin(MemberVO memberVO) throws Exception {

		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		
		try{
			memberDAO.memberJoin(memberVO);
			
			resultMap.put("result", "success");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
	
	// 4.중복아이디 체크
		@Override
		public HashMap<String, Object> duplicateIdCheck(MemberVO memberVO) throws Exception  {
			HashMap<String,Object> resultMap = new HashMap<String,Object>();

			try{
				int check = memberDAO.duplicateIdCheck(memberVO);

				if(check > 0) {
					resultMap.put("duplicateYn", "Y");
				} else {
					resultMap.put("duplicateYn", "N");
				}
			}catch(Exception e){
				e.printStackTrace();
			}

			return resultMap;
		}
	
}












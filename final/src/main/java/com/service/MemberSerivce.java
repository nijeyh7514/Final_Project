package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberSerivce {
	@Autowired
	MemberDAO dao;
	
	//아이디
	public MemberDTO login(String userid) {
		MemberDTO dto = dao.login(userid); 
			return dto;
		}
	//회원가입
	public void memberAdd(MemberDTO m) {	
		System.out.println("MemberService==="+m);
		dao.memberAdd(m);
		System.out.println("회원가입==memberService에서 DAO호출");
		System.out.println("dao.memberAdd==="+m);
		
	}
	//회원가입시 아이디체크
	public int idCheck(String userid) {
		System.out.println("MemberService==="+userid);
		int dto = dao.idCheck(userid);
		System.out.println("아이디중복체크==memberService에서 DAO호출");
		System.out.println("MemberService==="+dto);
		return dto;
	}
	//마이페이지
	public MemberDTO myPage(MemberDTO param) {
		MemberDTO dto = dao.myPage(param);
		System.out.println("마이페이지service return===="+dto);
		return dto;
	}
	//회원정보수정
	public void memberUpdate(MemberDTO m) {
		dao.memberUpdate(m);	
	}
}

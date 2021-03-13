package com.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate template;//자동주입
	
	//회원가입
	public void memberAdd(MemberDTO m) {
		int n = template.insert("MemberMapper.memberAdd", m);
	}
	//회원가입시 아이디체크
	public int idCheck(String userid) {
		int n = template.selectOne("MemberMapper.idCheck", userid);
		return n;
	}
	
	//로그인
	public MemberDTO login(String userid) {
		MemberDTO dto = template.selectOne("MemberMapper.login", userid);
		return dto;
	}
	//마이페이지 
	public MemberDTO myPage(MemberDTO param) {
		MemberDTO dto = template.selectOne("MemberMapper.mypage", param);
		System.out.println("마이페이지DAO return===="+dto);
		return dto;
	}

	//회원정보수정
	public void memberUpdate(MemberDTO m) {
	int n =	template.update("MemberMapper.memberUpdate", m);
	}
	

}

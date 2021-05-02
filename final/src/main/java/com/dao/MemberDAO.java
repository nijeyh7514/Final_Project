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
		System.out.println("MemberDAO의 memberAdd(MemberDTO)"+m);
		System.out.println("회원가입 ==MemberDAO에서 insert호출==id memberAdd가져옴");
		int n = template.insert("MemberMapper.memberAdd", m);
		System.out.println("template ==>DAO 쿼리실행결과값"+ n);
		//쿼리 실행결과값이 담기고 Service로 리턴될 때 파라미터 MemberDTO m 값이 리턴되는 건가.. 
	}
	//회원가입시 아이디체크
	public int idCheck(String userid) {
		int n = template.selectOne("MemberMapper.idCheck", userid);
		System.out.println("MemberDAO에서 Template의 selectOne 쿼리호출값"+n);
		return n;
	}
	
	//로그인
	public MemberDTO login(String userid) {
		MemberDTO dto = template.selectOne("MemberMapper.login", userid);
		return dto;
	}
	//마이페이지 아이디 하나(selectOne)로 회원정보 가져오기
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

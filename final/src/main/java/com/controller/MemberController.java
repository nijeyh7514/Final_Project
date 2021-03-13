package com.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.MemberDTO;
import com.service.MemberSerivce;

@Controller
public class MemberController {
	@Autowired
	MemberSerivce service;
	
	//회원가입기능
	@RequestMapping(value = "/memberAdd")
	public String memberAdd(MemberDTO m,Model model) {
		System.out.println("member===="+m);
		service.memberAdd(m);
		model.addAttribute("success", "회원가입되었습니다");
		return "main";
	}
	
	//회원가입시 아이디중복체크기능
	@RequestMapping(value = "/idDuplicateCheck", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String idCheck(@RequestParam("userid")String userid) {	
		int n = service.idCheck(userid);
		String mesg = "아이디 사용가능";
		if(n!=0) {
			mesg = "아이디 중복";
		}
		return mesg; //메세지 전달
	}
	//마이페이지 진입시 비밀번호 재확인 기능
	@RequestMapping(value = "/loginCheck/mypagePw")
	public String mypagePw(@RequestParam HttpSession session, String passwd) {
		MemberDTO dto = (MemberDTO) session.getAttribute("login");// NullPointExption
		System.out.println("마이페이지service return===="+dto);
		System.out.println("세션정보"+session.getAttribute("login"));
		dto = service.myPage(dto);
		String userid = dto.getUserid();
		session.setAttribute("login", dto);
		if (dto != null) {
			if (!passwd.equals(dto.getPasswd())) {
				
			} else {				
				System.out.println("비밀번호 재확인완료");
				return "redirect:../mypage";// servlet=context에 등록된 페이지로 이동->마이페이지
			}
		}
		return "redirect:../mypagePw";// servlet=context에 등록->마이페이지 비밀번호 재확인페이지
	}
	//mypage기능
	/*@RequestMapping(value = "/loginCheck/mypage")
	public String mypage(@RequestParam Map<String, String> map, HttpSession session) {
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userid = dto.getUserid();
		dto=service.myPage(dto);
		session.setAttribute("login", dto);
		System.out.println("마이페이지로 넘어감");
	
		return "redirect:../mypage"; //servlet=context에 등록
	}*/
	
	
	//회원정보수정기능
	@RequestMapping(value = "/loginCheck/memberUpdate")
	public String memberUpdate(MemberDTO m, HttpSession session) {
		System.out.println("memberUpdate===="+m);
		service.memberUpdate(m);
		session.setAttribute("login", m);
		return "redirect:../loginCheck/mypage"; //mypage호출
		
	}
}

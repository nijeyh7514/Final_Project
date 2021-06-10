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
	
	//*(회원가입) 회원등록기능
	@RequestMapping(value = "/memberAdd")
	public String memberAdd(MemberDTO m, Model model) {
		System.out.println("회원가입 == Controller DTO 파라미터값 확인===="+m);
		System.out.println("회원가입 == Controller Service호출==>"+m);
		service.memberAdd(m);		
		model.addAttribute("success", "회원가입되었습니다");
		System.out.println("회원가입성공");
		System.out.println("메인이동");
		return "main";
	}
	
	//회원가입시 아이디중복체크기능
	@RequestMapping(value = "/idDuplicateCheck", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String idCheck(
			@RequestParam("userid")String userid) {	
		int n = service.idCheck(userid);
		System.out.println("아이디중복체크 Controller Service호출=="+n);
		String mesg = "사용가능한 아이디입니다";
		System.out.println("MemberController===사용가능한 아이디입니다");
		if(n!=0) {
			mesg = "중복된 아이디입니다";
			System.out.println("MemberController===중복된 아이디입니다");
		}
		return mesg; //메세지 전달
	}
	//마이페이지 진입시 로그인정보 재확인 페이지구현(아이디와 비밀번호입력 페이지)
	//(value="param", required = false)
/*	@RequestMapping(value = "/loginCheck/mypageId")
	public String mypagePw(
			@RequestParam HttpSession session, String passwd, String userid) 
	{
		System.out.println(session.getAttribute("login"));
		MemberDTO dto = (MemberDTO) session.getAttribute("login");// NullPointExption
		System.out.println("마이페이지service return===="+dto);
		System.out.println("세션정보"+session.getAttribute("login"));
		dto = service.myPage(dto);
		session.setAttribute("login", dto);
		
		//dto에 값이 존재한다면 (null이 아니라면)
		if (dto != null) {
			//dto에서 가져온 비번값이 입력값과 같지 않다면
			if (!passwd.equals(dto.getPasswd())) {		
				System.out.println("로그인정보와 일치하지 않습니다.");
				//같을 경우
			} else {				
				//마이페이지로 넘어감
				return "redirect:../mypage";// servlet=context에 등록된 페이지로 이동->마이페이지
			}
		}
		return "redirect:../mypageId";// servlet=context에 등록->마이페이지 비밀번호 재확인페이지
	}*/
	//mypage열기
	@RequestMapping(value = "/loginCheck/mypage")
	public String mypage(@RequestParam Map<String, String> map, HttpSession session) {
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userid = dto.getUserid();
		dto=service.myPage(dto);
		session.setAttribute("login", dto);
		System.out.println("마이페이지로 넘어감");
	
		return "redirect:../mypage"; //servlet=context에 등록
	}
	
	//회원정보수정기능
	@RequestMapping(value = "/loginCheck/memberUpdate")
	public String memberUpdate(MemberDTO m, HttpSession session) {
		System.out.println("memberUpdate===="+m);
		service.memberUpdate(m);
		session.setAttribute("login", m);
		return "redirect:../mypage"; //mypage호출
		
	}
}

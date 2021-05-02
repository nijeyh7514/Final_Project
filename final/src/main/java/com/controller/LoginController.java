package com.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.service.MemberSerivce;

@Controller
public class LoginController {
	@Autowired
	MemberSerivce service;

	// 로그인시 아이디의 비밀번호 일치여부 
	@RequestMapping(value = "/login")
	public String login(@RequestParam(value="login_seq", required=false) Model model, HttpSession session, String passwd, String userid) 
		{
		MemberDTO dto = service.login(userid);
		if (dto != null) {//dto에 아이디가 저장되어있을 경우
			if (!passwd.equals(dto.getPasswd())) {// (!=와 equals의 차이점 알아보기!
				System.out.println("dto의 비번값과 일치하지 않음");
				/*model.addAttribute("mesg", "비밀번호가 일치하지 않습니다");*/ //이거 NPE 이유모름, 외얺되?
				System.out.println("로그인안됨");
			} else {
				session.setAttribute("login", dto);
				System.out.println("세선정보"+session.getAttribute("login"));
				System.out.println("로그인완료====" + dto);
				return "redirect:/goodsList?gCategory=meat";// 정상로그인 후 정해둔 메인화면으로 이동
			}
		}
		return "loginForm";// 로그인화면으로 이동
	}

	@RequestMapping(value = "/loginCheck/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../";
	}
}

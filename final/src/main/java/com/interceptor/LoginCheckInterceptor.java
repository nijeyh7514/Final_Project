package com.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor  extends HandlerInterceptorAdapter{
@Override
//    /loginCheck/**  //장바구니, 마이페이지, 장바구니에서 삭제, 수량업데이트, 주문 등 회원전용 메뉴에서 선동작 하도록 구현
public boolean preHandle(
		HttpServletRequest request, 
		HttpServletResponse response, 
		Object handler) throws Exception {
	
	System.out.println("preHandle동작     ================");
	
	HttpSession session = request.getSession();
	System.out.println("logincheck확인==>" + session.getAttribute("login"));
	
	 //로그인 검사 (로그인시 세션에 넣어준 dto객체 존재여부)
	//로그인정보가 없을 시 
	
	if(session.getAttribute("login") == null) { //getAttribute역할: 로그인정보 조회 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();		
		out.println("<script language='javascript'>");
		out.println("alert('로그인 후 이용가능합니다'); location.href='../loginForm';");
		/*out.println("history.back;");*/
		out.println("</script>");
	/*	out.close();*/
		/*response.sendRedirect("../loginForm");*///servlet-context.xml //로그인 페이지로 이동한다		
	 System.out.println("여기는?");
		return false;  //주의  //이후 작업 진행 금지
	}else {
		System.out.println("로그인정보확인");
		/*response.sendRedirect("../boardWrite");*///servlet-context.xml //마이페이지 회원정보페이지로 이동
		return true; //주의 //로그인 정보가 있는 경우 이후 작업 계속 진행
	}
}

@Override
	public void postHandle(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler,
			ModelAndView modelAndView) throws Exception {
	System.out.println("postHandle");//왜 너는 동작안해?
		
	}
@Override
	public void afterCompletion(
			HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler, 
			Exception ex) throws Exception {
	System.out.println("afterCompletion");
	}

}

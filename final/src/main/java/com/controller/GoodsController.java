package com.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.MemberDTO;
import com.dto.OrderDTO;
import com.dto.PageDTO;
import com.service.GoodsService;
import com.service.MemberSerivce;

@Controller
public class GoodsController {

	
	@Autowired
	GoodsService service;
	
	@Autowired
	MemberSerivce mService;
	
	//상품목록기능
	@RequestMapping(value = "/goodsList")
	public ModelAndView goodsList(@RequestParam("gCategory") String gCategory, @RequestParam(required = false, defaultValue = "all") String gUCategory) {
		System.out.println("goodsList/gCategory==="+gCategory);
		System.out.println("goodsList/gUCategory==="+gUCategory);
		if(gCategory==null) {
			gCategory = "meat";
			
		}
		if(gUCategory==null) {
			gUCategory = "all";
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("gCategory", gCategory);
		map.put("gUCategory", gUCategory);
		List<GoodsDTO>list = service.goodsList(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("goodsList", list);
		mav.setViewName("main");
		return mav;
	}
	
	//상품상세보기기능
	@RequestMapping(value = "/goodsRetrieve") //view가 (.jsp)가 없으므로 주소값이 된다
	@ModelAttribute("goodsRetrieve")//goodsRetrieve가 키값이 된다.
	public GoodsDTO goodsRetrieve(@RequestParam("gCode") String gCode) {
		GoodsDTO dto = service.goodsRetrieve(gCode);
		return dto;
	}
	
	//장바구니 기능
	@RequestMapping(value = "/loginCheck/cartAdd")
	public String cartAdd(CartDTO cDTO, HttpSession session) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		cDTO.setUserid(mDTO.getUserid());
		session.setAttribute("mesg", cDTO.getgCode());
		service.cartAdd(cDTO);
		return "redirect:../goodsRetrieve?gCode="+cDTO.getgCode();
	}
	
	//장바구니목록
	@RequestMapping(value = "/loginCheck/cartList")
	//Redirect시 원하는 값들을 전달하고 싶다면 RedirectAttributes를 사용해서 추가할 수 있다.
	public String cartList(RedirectAttributes attr, HttpSession session) {
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		String userid = dto.getUserid();
		List<CartDTO> list = service.cartList(userid);
		attr.addFlashAttribute("cartList", list); //redirect시 데이터 유지
		return "redirect:../cartList"; //servlet-context 등록
	}
	
	//장바구니상품삭제
	@RequestMapping(value = "/loginCheck/cartDelete")
	@ResponseBody //스프링에서 비동기 처리를 할 경우에 @Responsebody나 @RequestBody를 사용
	public void cartDelete(@RequestParam("num") int num) {
		System.out.println("cartDelete_Controller==="+num);
		service.cartDelete(num);
	}
	
	//상품전체삭제하기
	@RequestMapping(value = "/loginCheck/delAllCart")
	public String delAllCart(@RequestParam("check") ArrayList<String>list) {
		service.delAllCart(list);
		return "redirect:../cartList";
		
	}
	
	//상품주문확인페이지
	@RequestMapping(value = "/loginCheck/orderConfirm")
	public String orderConfirm(@RequestParam("num") int num, HttpSession session, RedirectAttributes xxx) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String userid = mDTO.getUserid();
		mDTO = mService.myPage(mDTO); //사용자 정보 가져오기
		CartDTO cDTO = service.orderConfirmByNum(num); //장바구니 정보가져오기
		xxx.addFlashAttribute("mDTO", mDTO); //request에 회원정보저장
		xxx.addFlashAttribute("cDTO", cDTO); //request에 카트정보저장
		return "redirect:../orderConfirm"; //servlet-context에 등록
		
	}
	
	
	//상품주문완료
	@RequestMapping(value = "/loginCheck/orderDone")
	public String orderDone(OrderDTO oDTO, int orderNum, HttpSession session, RedirectAttributes xxx) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		oDTO.setUserid(mDTO.getUserid());
		service.orderDone(oDTO, orderNum); //tx처리(service에서)
		xxx.addFlashAttribute("oDTO", oDTO);
		return "redirect:../orderDone";
	}
	 	
	//전체주문확인페이지
	@RequestMapping(value = "/loginCheck/orderAllConfirm")
	public String orderAllConfirm(@RequestParam("check") String [] num, HttpSession session, RedirectAttributes xxx) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String userid = mDTO.getUserid();
		mDTO = mService.myPage(mDTO);
		List<String>list = Arrays.asList(num);
		List<CartDTO> cList = service.orderAllConfirm(list);
		xxx.addFlashAttribute("cList", cList);
		xxx.addFlashAttribute("mDTO", mDTO);
		return "redirect:../orderAllConfirm";
	}
	  
	//전체주문
	@RequestMapping(value = "/loginCheck/orderAllDone")
	public String orderAllDone(OrderDTO oDTO ,@RequestParam("num")String [] orderNums, HttpSession session, RedirectAttributes xxx, HttpServletRequest request) {
	
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String [] nums = request.getParameterValues("num");
		System.out.println("orderAllDone/nums==="+nums);
		List<String>list = Arrays.asList(nums);
		System.out.println("orderAllDone/orderNums==="+list);
		String userid = mDTO.getUserid();
		
		List<CartDTO> cList = service.orderAllConfirm(list);
		System.out.println("cLIst===="+cList);
		System.out.println("orderAllDone/oDTO==="+ oDTO);
		List<OrderDTO> oList = new ArrayList<>();
	
		for(int i=0;i<cList.size();i++) {
			OrderDTO oDTOList = new OrderDTO();
			oDTOList.setUserid(cList.get(i).getUserid());
			oDTOList.setNum(cList.get(i).getNum());   
			oDTOList.setgCode(cList.get(i).getgCode());      
			oDTOList.setgName(cList.get(i).getgName());
			oDTOList.setgPrice(cList.get(i).getgPrice());      
			oDTOList.setgAmount(cList.get(i).getgAmount());   
			oDTOList.setgImage(cList.get(i).getgImage());
			oDTOList.setOrderName(oDTO.getOrderName());
			oDTOList.setPost(oDTO.getPost());
			oDTOList.setAddr1(oDTO.getAddr1());
			oDTOList.setAddr2(oDTO.getAddr2());
			oDTOList.setPhone(oDTO.getPhone());
			oDTOList.setPayMethod(oDTO.getPayMethod());

	         oList.add(oDTOList);
	      }
			System.out.println("orderAllDone==="+oList);
	     
			service.orderAllDone(oList, list);
			session.setAttribute("oList", oList);
			xxx.addFlashAttribute("oList", oList);

			System.out.println(oList);
			return "redirect:../orderAllDone ";
	}
	
	//상품검색기능
	@RequestMapping(value = "/goodsSearchList")
	public String goodsSearch(HttpSession session, HttpServletRequest request) {
		String curPage = request.getParameter("curPage");
		if(curPage==null) curPage= "1";
		
		String searchName = request.getParameter("searchName");//상품명 또는 상품내용
		String searchValue = request.getParameter("searchValue"); //입력값
		System.out.println("servlet에서==="+searchName+"\t"+searchValue+"\t"+curPage);
		PageDTO pDTO = service.goodsSearchList(searchName, searchValue, Integer.parseInt(curPage));
		System.out.println("goodsSearchList/Controller===="+pDTO);
		request.setAttribute("pDTO", pDTO);
		request.setAttribute("searchName", searchName);
		request.setAttribute("searchValue", searchValue);
//		xxx.addFlashAttribute("pDTO", pDTO);
//		xxx.addFlashAttribute("test", "abcd");
		
		return "goodsSearchList"; //goodsSearchList.jsp
	}
	
	//카테코리별 가격 검색 기능
	@RequestMapping(value = "/searchPC") 
	public String searchPC(HttpSession session, HttpServletRequest request) {
		
		String searchPrice1 = request.getParameter("searchPrice1");
		String searchPrice2 = request.getParameter("searchPrice2");
		String gCategory1 = request.getParameter("gCategory1");
		String gCategory2 = request.getParameter("gCategory2");
		String gCategory3 = request.getParameter("gCategory3");
		String gCategory4 = request.getParameter("gCategory4");
		
		if(searchPrice1.equals("undefined")) searchPrice1=searchPrice2;
		if(searchPrice2.equals("undefined")) searchPrice2=searchPrice1;
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchPrice1", searchPrice1);
		map.put("searchPrice2", searchPrice2);
		map.put("gCategory1", gCategory1);
		map.put("gCategory2", gCategory2);
		map.put("gCategory3", gCategory3);
		map.put("gCategory4", gCategory4);
		
		System.out.println(map);
		
		
		List<GoodsDTO>list = service.searchPC(map);
		//PageDTO pDTO = service.searchPC(list, Integer.parseInt(curPage));
		request.setAttribute("priceCategory", list);
		return "searchPC";
	}
}

package com.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dao.GoodsDAO;
import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrderDTO;
import com.dto.PageDTO;

@Service
public class GoodsService {

	@Autowired
	GoodsDAO dao;

//*(상품목록) - map	
	public List<GoodsDTO> goodsList(Map<String, String> map) {
		List<GoodsDTO>list = dao.goodsList(map);
		return list;
	}
	
//*(상세페이지) - 상품코드
	public GoodsDTO goodsRetrieve(String gCode) {
		GoodsDTO dto = dao.goodsRetrieve(gCode);		
		return dto;
	}
	
//*(상세페이지 바로구매) - 상품코드
	public CartDTO buyNow(String gCode) {
		CartDTO dto = dao.buyNow(gCode);
		return dto;
	}
	
//*(장바구니추가) - cDTO
	public void cartAdd(CartDTO cDTO) {
		dao.cartAdd(cDTO);
		
	}
//*(장바구니목록) - 유저아이디
	public List<CartDTO> cartList(String userid) {
		List<CartDTO>list = dao.cartList(userid);
		return list;
	}
	
//*(장바구니 상품삭제) - 상품번호
	public void cartDelete(int num) {
		dao.cartDelete(num);		
	}
	
//*(장바구니 모든상품삭제) - list
	public void delAllCart(ArrayList<String> list) {
		dao.delAllCart(list);		
	}
	
//*(상품주문) - 상품번호	
	public CartDTO orderConfirmByNum(int num) {
		CartDTO cDTO = dao.orderConfirmByNum(num);
		return cDTO;
	}
	
//*(주문완료) - oDTO, orderNum
	@Transactional
	public void orderDone(OrderDTO oDTO, int orderNum) {
		dao.orderDone(oDTO);//주문정보저장 - insert
		dao.cartDelete(orderNum); //카트에서 삭제 두 처리를 tx 처리함 root-context.xml에 tx-Manager등록필요
		
	}

//*(전체주문확인) - list	
	public List<CartDTO> orderAllConfirm(List<String> list) {
		List<CartDTO> cDTO = dao.orderAllConfirm(list);
		return cDTO;
	}

//*(모든주문완료) - oDTO, list 	
	@Transactional
	public void orderAllDone(List<OrderDTO> oDTO, List<String> list) {
		System.out.println("orderAllDoneService=="+oDTO);
		dao.orderAllDone(oDTO);
		System.out.println("orderAllDoneService=="+oDTO);
		dao.delAllCart(list);
		System.out.println("orderAllDoneService=="+list);
	}

	//(상품명/설명검색) - map, curPage
	public PageDTO goodsSearchList(String searchName, String searchValue, int curPage) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		PageDTO list = null;
		list = dao.goodsSearchList(map,curPage);
		System.out.println("goodsSearchList/Service===="+list);
		return list;
	}

	//(상품가격검색) - map
	public List<GoodsDTO> searchPC(String searchPrice1, String searchPrice2, String gCategory1, String gCategory2,
	    String gCategory3, String gCategory4) {
	    HashMap<String, String> map = new HashMap<>();
		map.put("searchPrice1", searchPrice1);
	    map.put("searchPrice2", searchPrice2);
		map.put("gCategory1", gCategory1);
		map.put("gCategory2", gCategory2);
		map.put("gCategory3", gCategory3);
		map.put("gCategory4", gCategory4);
		List<GoodsDTO> list = null;
		list = dao.searchPC(map);
		return list;
	}

	public List<GoodsDTO> searchPC(HashMap<String, String> map) {
		List<GoodsDTO> list =dao.searchPC(map);
		return list;
	}
	
	}

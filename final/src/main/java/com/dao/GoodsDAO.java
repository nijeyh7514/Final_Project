package com.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.CartDTO;
import com.dto.GoodsDTO;
import com.dto.OrderDTO;
import com.dto.PageDTO;

@Repository
public class GoodsDAO {
	@Autowired
	SqlSessionTemplate template;
	
//*(상품목록보기) - map
	public List<GoodsDTO> goodsList(Map<String, String> map) {
		List<GoodsDTO> list = template.selectList("GoodsMapper.goodsList", map);
		return list;
	}
	
//*(상세페이지) - 상품코드
	public GoodsDTO goodsRetrieve(String gCode) {
		GoodsDTO dto = template.selectOne("GoodsMapper.goodsRetrieve", gCode);
		return dto;
	}
	
//*(상세페이지-바로구매) - 상세페이지상품 상품번호
	public CartDTO buyNow(String gCode) {
		CartDTO dto = template.selectOne("CartMapper.buyNow",gCode);
		return dto;
	}

//*(장바구니추가) -  cDTO
	public void cartAdd(CartDTO cDTO) {
		template.insert("CartMapper.cartAdd", cDTO);		
	}

//*(장바구니 목록) - 유저아이디	
	public List<CartDTO> cartList(String userid) {
		List<CartDTO>list = template.selectList("CartMapper.cartList",userid);
		return list;
	}

//*(장바구니 수량변경) - map
	public void cartUpdate(Map<String, String> map) {
		int n = template.update("CartMapper.cartUpdate", map);
	}
	
//*(장바구니상품 개별체크 삭제) - 상품번호 
	public void cartDelete(int num) {
		template.delete("CartMapper.cartDelete", num);
		System.out.println("cartDelete/DAO==="+num);
	}
	
//*(장바구니상품 전체삭제) - list	
	public void delAllCart(List<String> list) {
		template.delete("CartMapper.cartAllDel",list);		
	}
	
//*(개별주문 확인페이지) - 장바구니상품 주문번호	
		public CartDTO orderConfirmByNum(int num) {
			CartDTO cDTO = template.selectOne("CartMapper.cartByNum", num);
			return cDTO;
		}
		
//*(개별주문완료 페이지) - oDTO
	public void orderDone(OrderDTO oDTO) {
		int n = template.insert("CartMapper.orderDone", oDTO);		
	}

//*(다중 선택주문 확인페이지) - list
	public List<CartDTO> orderAllConfirm(List<String> list) {
		List<CartDTO> cDTO = template.selectList("CartMapper.orderAllConfirm",list);
		return cDTO;
	}
	
//*(모든 주문완료 페이지) - oDTO
	public void orderAllDone(List<OrderDTO> oDTO) {
		System.out.println("orderAllDoneDAO==="+oDTO);
		int n = template.insert("CartMapper.orderAllDone",oDTO);
		System.out.println("orderAllDoneDAO==="+n);		
	}

//*(장바구니 상품 총 합계) - map	
	public int totalCount(HashMap<String, String>map) {
		int n =  template.selectOne("GoodsMapper.totalCount", map);
		return n;
	}

//*(상품명 /상품내용 검색)
	public PageDTO goodsSearchList(HashMap<String, String> map, int curPage) {
		
		PageDTO pDTO = new PageDTO();
		int perPage = pDTO.getPerPage();
		int offset = (curPage - 1) * perPage;
		
		List<GoodsDTO> list = template.selectList("GoodsMapper.search", map, new RowBounds(offset, perPage));
		
		pDTO.setCurPage(curPage);
		pDTO.setList(list);
		pDTO.setTotalCount(totalCount(map));
		
		System.out.println("Dao에서======="+list.size());
		return pDTO;
	}

//*(상품가격으로 검색)	
	public List<GoodsDTO> goodsPriceSearch(HashMap<String, String> map) {
		List<GoodsDTO> list = template.selectList("GoodsMapper.goodsPriceSearch",map);
		return list;
	}
} //GoodsDAO

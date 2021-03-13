package com.dto;

import java.util.List;

public class PageDTO {


	private List<GoodsDTO> list; //상품정보 리스트
	private int curPage; //현재 페이지
	private int perPage=2; //페이지당 게시물 개수
	private int totalCount; //전체 게시물 개수
	
	public PageDTO() {
		// TODO Auto-generated constructor stub
	}

	public List<GoodsDTO> getList() {
		return list;
	}

	public void setList(List<GoodsDTO> list) {
		this.list = list;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}



	@Override
	public String toString() {
		return "PageDTO [list=" + list + ", curPage=" + curPage + ", perPage=" + perPage
				+ ", totalCount=" + totalCount + "]";
	}

	
	
	
}

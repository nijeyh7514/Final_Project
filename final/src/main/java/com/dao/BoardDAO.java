package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.BoardDTO;
import com.dto.BoardReplyDTO;


@Repository
public class BoardDAO {

	@Autowired
	SqlSessionTemplate template;
	
	//*(게시판) 목록구현
	public List<BoardDTO> boardList(HashMap<String, String> map) {
		List<BoardDTO> boardList = template.selectList("BoardMapper.boardList", map);
		System.out.println("게시판리스트보이기DAO====>"+boardList);
		return boardList;
	}
	
	//*(게시판) 게시글작성
	public void boardWrite(BoardDTO bDTO) {
		int n = template.insert("BoardMapper.boardWrite", bDTO);
		System.out.println("게시판글쓰기BoardDAO====>"+n);
		
	}
	
	//*(게시판) 게시글 상세보기
	public BoardDTO boardRetrieve(String num) {
		BoardDTO boardDTO = template.selectOne("BoardMapper.boardRetrieve", Integer.parseInt(num));
		return boardDTO;
	}
	

	//*(게시판) 게시글 수정
	public void boardUpdate(BoardDTO bDTO) {
		template.update("BoardMapper.boardUpade", bDTO);
		
	}
	//*(게시판) 게시글 삭제
	public void boardDelete(int num) {
		template.delete("BoardMapper.boardDelete", num);
		
	}

	//*(게시판) 조회수 증가
	public void readcnt(int num) {
		template.update("BoardMapper.readcnt",num);
		
	}
	//*(게시판) 게시글 댓글
	public List<BoardReplyDTO> boardReply(String num) {
		template.selectList("BoardMapper.boardReply", Integer.parseInt(num));
		return null;
	}


	

	

}

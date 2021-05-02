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
	
	//게시판리스트보이기
	public List<BoardDTO> boardList(HashMap<String, String> map) {
		List<BoardDTO> boardList = template.selectList("BoardMapper.boardList", map);
		System.out.println("게시판리스트보이기DAO====>"+boardList);
		return boardList;
	}
	//게시판 글쓰기
	public void boardWrite(BoardDTO bDTO) {
		int n = template.insert("BoardMapper.boardWrite", bDTO);
		System.out.println("게시판글쓰기BoardDAO====>"+n);
		
	}
	
	public BoardDTO boardRetrieve(String num) {
		BoardDTO boardDTO = template.selectOne("BoardMapper.boardRetrieve", Integer.parseInt(num));
		return boardDTO;
	}
	
	
	/*private void readcnt(String num) {
		// TODO Auto-generated method stub
		SqlSessionTemplate.update("BoardMapper.readcnt",Integer.parseInt(num));
		
	}*/

	public void boardUpdate(BoardDTO bDTO) {
		template.update("BoardMapper.boardUpade", bDTO);
		
	}

	public void boardDelete(int num) {
		template.delete("BoardMapper.boardDelete", num);
		
	}

	public List<BoardReplyDTO> boardReply(String num) {
		template.selectList("BoardMapper.boardReply", Integer.parseInt(num));
		return null;
	}


	

	

}

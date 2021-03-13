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
	SqlSessionTemplate SqlSessionTemplate;
	
	//게시판리스트
	public List<BoardDTO> boardList(HashMap<String, String> map) {
		List<BoardDTO> boardList = SqlSessionTemplate.selectList("BoardMapper.boardList", map);
		return boardList;
	}

	public BoardDTO boardRetrieve(String num) {
		BoardDTO boardDTO = SqlSessionTemplate.selectOne("BoardMapper.boardRetrieve", Integer.parseInt(num));
		return boardDTO;
	}
	
	public void boardWrite(BoardDTO bDTO) {
		SqlSessionTemplate.insert("BoardMapper.boardWrite", bDTO);
		
	}
	
	private void readcnt(String num) {
		// TODO Auto-generated method stub
		SqlSessionTemplate.update("BoardMapper.readcnt",Integer.parseInt(num));
		
	}

	public void boardUpdate(BoardDTO bDTO) {
		SqlSessionTemplate.update("BoardMapper.boardUpade", bDTO);
		
	}

	public void boardDelete(int num) {
		SqlSessionTemplate.delete("BoardMapper.boardDelete", num);
		
	}

	public List<BoardReplyDTO> boardReply(String num) {
		SqlSessionTemplate.selectList("BoardMapper.boardReply", Integer.parseInt(num));
		return null;
	}


	

	

}

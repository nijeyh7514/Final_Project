package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.BoardDAO;
import com.dto.BoardDTO;
import com.dto.BoardReplyDTO;


@Service
public class BoardService {

	@Autowired
	BoardDAO BoardDAO;
	
//게시판리스트보이기
	public List<BoardDTO> boardList(HashMap<String, String> map) {
		List<BoardDTO> boardList = BoardDAO.boardList(map);
		System.out.println("게시판리스트보이기Service====>BoardDAO.boardLsit()호출"+boardList);
		return boardList;
	}

//게시판글쓰기
	public void boardWrite(BoardDTO bDTO) {
		BoardDAO.boardWrite(bDTO);
		System.out.println("게시판글쓰기BoardService===>BoardDAO호출");
	}
	
	public BoardDTO boardRetrieve(String num) {
		BoardDTO boardDTO = BoardDAO.boardRetrieve(num);
		return boardDTO;
	}

	

	public void boardUpdate(BoardDTO bDTO) {
		BoardDAO.boardUpdate(bDTO);
		
	}

	public void boardDelete(int num) {
		BoardDAO.boardDelete(num);
		
	}

//	public List<BoardReplyDTO> boardReply(String num) {
//		List<BoardReplyDTO> BoardReplyDTO = BoardDAO.boardReply(num);
//		
//	}



	



	
	
	
}

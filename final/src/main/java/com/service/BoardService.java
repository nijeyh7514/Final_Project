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

	public List<BoardDTO> boardList(HashMap<String, String> map) {
		List<BoardDTO> boardList = BoardDAO.boardList(map);
		return boardList;
	}

	public BoardDTO boardRetrieve(String num) {
		BoardDTO boardDTO = BoardDAO.boardRetrieve(num);
		return boardDTO;
	}

	public void boardWrite(BoardDTO bDTO) {
		BoardDAO.boardWrite(bDTO);
		
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

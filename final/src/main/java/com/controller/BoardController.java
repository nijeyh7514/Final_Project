package com.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.BoardDTO;
import com.dto.BoardReplyDTO;
import com.dto.MemberDTO;
import com.service.BoardService;
import com.service.MemberSerivce;

@Controller
@RequestMapping("/loginCheck/*")
public class BoardController {
	
	@Autowired
	BoardService BoardService;
	
	@Autowired 
	MemberSerivce MemberSerivce;
	
	
	//게시판목록보여주기(안됨)
	@RequestMapping(value = "/loginCheck/boardList")
	public String boardList(RedirectAttributes attr, HttpSession session, HttpServletRequest request) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		System.out.println("BoardController게시판목록보여주기==> 로그인정보불러오기"+mDTO);
		String userid = mDTO.getUserid();
		System.out.println("BoardController게시판목록보여주기==>dto에서 꺼낸 userid변수에 넣기"+userid);
		if(mDTO !=null) {
			System.out.println("mDTO가 null이 아니면==userid있으면");
		String searchName = request.getParameter("searchName");
		String searchValue =request.getParameter("searchValue");
		System.out.printf("searchName(글제목,작성자)=="+searchName,"searchValue(값)요청=="+searchValue);
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("searchName", searchName);
		map.put("searchValue", searchValue);
		System.out.println("Hashmap에 put해주기=="+searchName+"=="+searchValue);
		List<BoardDTO> boardList = BoardService.boardList(map);
		attr.addFlashAttribute("boardList",boardList);
		System.out.println("attr이 뭐였지");
		
		}
		
		return "redirect:../boardList";
	}
	
	//게시판 글쓰기
	@RequestMapping(value = "/loginCheck/boardWrite")
	public String boardWrite(@ModelAttribute BoardDTO BoardDTO, HttpSession session, HttpServletRequest request){
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String userid = mDTO.getUserid();
		System.out.println("로그인연결 잘되고 userid잘 가져왔나?===>"+userid);
		
		if(mDTO !=null) {
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String content = request.getParameter("content");
			System.out.println("boardController게시판글쓰기 제목파싱==="+title);
			System.out.println("boardController게시판글쓰기 글쓴이파싱==="+author);
			System.out.println("boardController게시판글쓰기 내용파싱==="+content);
			
			BoardDTO bDTO = new BoardDTO();
			bDTO.setTitle(title);
			bDTO.setAuthor(author);
			bDTO.setContent(content);
			BoardService.boardWrite(bDTO);
			System.out.println("boardWrite게시판글쓰기===="+bDTO);
			}
		
		return "redirect:../loginCheck/boardWrite";
	}
	
	
	//게시판 글 자세히보기
	@RequestMapping(value = "/loginCheck/boardRetrieve")
	public String boardRetrieve(@RequestParam("num") String num, HttpSession session, RedirectAttributes attr, HttpServletRequest request) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String userid = mDTO.getUserid();
		
		if(mDTO != null) {
			String boardNum = request.getParameter("num");
			BoardDTO BoardDTO = BoardService.boardRetrieve(boardNum);
			attr.addFlashAttribute("boardRetrieve", BoardDTO);

 		}
		return "redirect:../boardRetrieve";
		
	}
	
	//게시판 글 수정
	@RequestMapping(value = "/loginCheck/boardUpdate")
	public String boardUpdate(HttpSession session, HttpServletRequest request) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String userid = mDTO.getUserid();
		
		if(mDTO!=null) {
			String num =request.getParameter("num");
			String title =request.getParameter("title");
			String author =request.getParameter("author");
			String content =request.getParameter("content");
			
			BoardDTO bDTO = new BoardDTO();
			bDTO.setNum(Integer.parseInt(num));
			bDTO.setTitle(title);
			bDTO.setAuthor(author);
			bDTO.setContent(content);
			
			BoardService.boardUpdate(bDTO);
		}
		return "redirect:../loginCheck/boardList";
	}
	
	
	//게시판 글 삭제
	@RequestMapping(value = "/loginCheck/boardDelete")
	public String boardDelete(HttpSession session, HttpServletRequest request) {
		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
		String userid = mDTO.getUserid();
		
		if(mDTO != null) {
			
			String num = request.getParameter("num");
			BoardService.boardDelete(Integer.parseInt(num));
		}
		
		return "redirect:../loginCheck/boardList";
	}
	
	
//	//게시판 댓글
//	@RequestMapping(value = "/loginCheck/boardReply")
//	public String boardReply(HttpServletRequest request, HttpSession session, RedirectAttributes attr) {
//		MemberDTO mDTO = (MemberDTO)session.getAttribute("login");
//		String userid = mDTO.getUserid();
//		
//		String contentNum = request.getParameter("num");
//		String author = request.getParameter("author");
//		String content = request.getParameter("content");
//		if(mDTO != null) {
//			BoardReplyDTO rDTO = new BoardReplyDTO(Integer.parseInt(contentNum), author, content, null);
//			BoardService.boardReply(rDTO);
//			attr.addFlashAttribute("boardRetrieve", rDTO);
//
// 		}
//		return "redirect:../boardReply";
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

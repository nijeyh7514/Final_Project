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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.BoardDTO;
import com.dto.BoardReplyDTO;
import com.dto.MemberDTO;
import com.service.BoardService;
import com.service.MemberSerivce;

@Controller
// @RequestMapping("/loginCheck/*")
public class BoardController {

	@Autowired
	BoardService BoardService;

	@Autowired
	MemberSerivce MemberSerivce;

	// *(게시판)목록구현 및 제목/내용 검색구현
	@RequestMapping(value = "/BoardList") // jsp주소와 동일하면 무한루프
	public String boardList(RedirectAttributes attr, HttpSession session, HttpServletRequest request) {
		/*MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		System.out.println("BoardController게시판목록보여주기==> 로그인정보불러오기" + mDTO);
		String userid = mDTO.getUserid();
		System.out.println("BoardController게시판목록보여주기==>mdto에서 꺼낸 userid변수에 넣기" + userid);
		if (mDTO != null) {*/
			System.out.println("BoardController/BoardList/게시판목록,검색기능");
			String searchName = request.getParameter("searchName");
			String searchValue = request.getParameter("searchValue");
			System.out.println("searchName(글제목,작성자)==" + searchName + ", searchValue(담긴값)파싱==" + searchValue);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("searchName", searchName);
			map.put("searchValue", searchValue);
			System.out.println("Hashmap에 put해주기==" + searchName + "==" + searchValue);
			List<BoardDTO> boardList = BoardService.boardList(map);
			System.out.println("게시판목록보기"+boardList);
			attr.addFlashAttribute("boardList", boardList);
			System.out.println("redirect:../boardList.jsp이동");
		/*}	*/
		return "redirect:./boardList";// .jsp페이지 이동// redirect./
	}

	// *(게시판) 게시글 작성 후 게시글 목록에 글올리기 구현
	@RequestMapping(value = "/BoardWrite")//boardWrite.jsp action ="BoardWrite" method="get"
	public String boardWrite(@ModelAttribute BoardDTO BoardDTO, RedirectAttributes attr, HttpSession session, HttpServletRequest request) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String userid = mDTO.getUserid();
		System.out.println("BoardWrite/사용자 아이디===>" + userid);
		
		if (mDTO != null) {
			System.out.println("BoardController/parsing시작");
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String bcontent = request.getParameter("bcontent");
			System.out.println("boardController게시판글쓰기 제목파싱===" + title);
			System.out.println("boardController게시판글쓰기 글쓴이파싱===" + author);
			System.out.println("boardController게시판글쓰기 내용파싱===" + bcontent);

			BoardDTO bDTO = new BoardDTO();
			bDTO.setTitle(title);
			bDTO.setBcontent(bcontent);
			bDTO.setAuthor(author);
			System.out.println(bDTO+"세팅완료");

			BoardService.boardWrite(bDTO);
			attr.addFlashAttribute("boardList", bDTO);
			System.out.println("boardWrite/게시글작성완료====" + bDTO);			
		
			HashMap<String, String> map = new HashMap<String, String>();
			List<BoardDTO> boardList = BoardService.boardList(map);
			attr.addFlashAttribute("boardList", boardList);
			System.out.println("BoardWrite/게시판목록구현"+boardList);
		}			
		return "redirect:./boardList";//jsp
	}

	// *(게시판) 게시글 상세보기
	@RequestMapping(value = "/BoardRetrieve")// boardList에서 호출받음
	public String boardRetrieve(@RequestParam("num") int num, HttpSession session, 
			RedirectAttributes attr,
			HttpServletRequest request) {
		
		System.out.println("Controller/BoardRetrieve/게시판글 자세히보기진입");
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String userid = mDTO.getUserid();//->비회원일 경우 여기서 NTE 발생
		System.out.println("Controller/BoardRetrieve/로그인정보입력");
		
		
		//if (mDTO != null) {
			String boardNum = request.getParameter("num");
			System.out.println("num = " + boardNum);
			BoardDTO bDTO = BoardService.boardRetrieve(boardNum);
			System.out.println("BoardDTO = " + bDTO);
			attr.addFlashAttribute("boardRetrieve", bDTO);	
			//*(게시판) 조회수 증가
			BoardService.readcnt(num);
			String clientIpAddress = request.getRemoteAddr();
			System.out.println("Ip"+clientIpAddress);
		//}
		return "redirect:./boardRetrieve";//다시 boardRetrieve.jsp 호출?
	}
		
	// *(게시판) 게시글 수정
	@RequestMapping(value = "/loginCheck/BoardUpdate")
	public String boardUpdate(HttpSession session, HttpServletRequest request,
			RedirectAttributes attr) {
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String userid = mDTO.getUserid();

		if (mDTO != null) {
			String num = request.getParameter("num");
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String bcontent = request.getParameter("bcontent");

			BoardDTO bDTO = new BoardDTO();
			bDTO.setNum(Integer.parseInt(num));
			bDTO.setTitle(title);
			bDTO.setAuthor(author);
			bDTO.setBcontent(bcontent);
			BoardService.boardUpdate(bDTO);
			
			System.out.println("BoardDelete/게시판목록구현");
			HashMap<String, String> map = new HashMap<String, String>();
			List<BoardDTO> boardList = BoardService.boardList(map);
			attr.addFlashAttribute("boardList", boardList);
		}
		return "redirect:../boardList";
	}

	// *(게시판) 게시글 삭제
	@RequestMapping(value = "/loginCheck/BoardDelete")//
	public String boardDelete(HttpSession session, HttpServletRequest request, 
				RedirectAttributes attr) {
		System.out.println("게시글 삭제 서블릿진입");
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String userid = mDTO.getUserid();
		System.out.println("BoardDelete/Controller/userid==="+userid);
		if (mDTO != null) {
			String num = request.getParameter("num");
			BoardService.boardDelete(Integer.parseInt(num));
			
			System.out.println("BoardDelete/게시판목록구현");
			HashMap<String, String> map = new HashMap<String, String>();
			List<BoardDTO> boardList = BoardService.boardList(map);
			attr.addFlashAttribute("boardList", boardList);
		}
		return "redirect:../boardList";//
	}

	// *(게시판) 게시글 댓글(x)
	@RequestMapping(value = "/BoardReply")
	public String boardReply(HttpServletRequest request, HttpSession session, RedirectAttributes attr) {
		System.out.println("BoardController/게시판댓글진입");
		MemberDTO mDTO = (MemberDTO) session.getAttribute("login");
		String userid = mDTO.getUserid();

		String contentNum = request.getParameter("num");
		String author = request.getParameter("author");
		String content = request.getParameter("content");
		if (mDTO != null) {
			BoardReplyDTO rDTO = new BoardReplyDTO(Integer.parseInt(contentNum), author, content, null);
			List<BoardReplyDTO> replyList = BoardService.boardReply(contentNum);
			System.out.println("replyList => " + replyList.toString());
			attr.addFlashAttribute("replyList", replyList);
		}
		return "redirect:../boardReply";
	}

}

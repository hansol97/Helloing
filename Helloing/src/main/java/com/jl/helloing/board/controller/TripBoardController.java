package com.jl.helloing.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class TripBoardController {
	
	/*
	@Autowired
	private TripBoardService tripboardService;
	*/
	
	@RequestMapping("selectTripBoard")
	public String selectTripBoard() {
		System.out.println(123);
		return "board/selectTripBoard";
	}
	
	@RequestMapping("enrollTripBoard")
	public String enrollTripBoard() {
		return "board/enrollFormTripBoard";
	}
	
	/*
	@RequestMapping("insertTripBoard")
	public String insertBoard(Board board, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) { // getOriginalFileName == filename필드의 값을 반환함
			

			board.setOriginName(upfile.getOriginalFilename()); // 원본명
			board.setChangeName("resources/uploadFiles/" + saveFile(upfile, session)); 
			// 바뀐파일명이 (changeName이 String이니 밑에 메서드에도 반환형 String으로 함)
			
		} // if end
		
		if(boardService.insertBoard(b) > 0) { // 성공 게시글 리스트 페이지
			session.setAttribute("alertMsg", "리뷰 등록이 완료되었습니다.");
			return "redirect:list.bo";
		} else {
			model.addAttribute("errorMsg", "리뷰 작성에 실패했어요...ㅠ");
			return "common/errorPage";
		}
		
	}
	*/
	
	
}

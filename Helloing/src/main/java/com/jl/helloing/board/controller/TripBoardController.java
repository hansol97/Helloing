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
	
	/** 여행리뷰 게시판 */
	
	@RequestMapping("tripBoard")
	public String selectTripBoard() {
		System.out.println(123);
		return "board/tripBoard";
	}
	
	@RequestMapping("enrollTripBoard")
	public String enrollTripBoard() {
		return "board/tripBoardEnrollForm";
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
	
	public String saveFile(MultipartFile upfile, HttpSession session) { // 실제 넘어온 파일의 이름을 변경해서 서버에 업로드
		// 파일 명 수정 작업 후 서버에 업로드 시키기("image.png" => 20221238123123.png)
		String originName = upfile.getOriginalFilename();
		// "20221226103530"(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // Date를 util로 뽑음
		// 12321(5자리 랜덤값)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		// 문자열 빼낼때  가장 뒤에있는 점 기준 (20221238123123.png의 .png의 점이다)
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자하는 폴더의 물리적인경로 알아내기 (webapp의 resources의 uploadFiles폴더 만들어놨다.)
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));  // transferTo : 서버 파일을 업로드해주는 메소드
			// File import : io
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	*/
	

	@RequestMapping("tripBoardDetail")
	public String selectTripBoardDetail() {
		return "board/tripBoardDetail";
	}

	@RequestMapping("updateTripBoard")
	public String updateTripBoard() {
		return "board/updateTripBoard";
	}
	
	@RequestMapping("deleteTripBoard")
	public String deleteTripBoard() {
		return "board/deleteTripBoard";
	}
	
	
	/** 맛집 게시판 */
	@RequestMapping("hotplace")
	public String hotplace() {
		return "board/hotplaceList";
	}
	
	
	
	
}

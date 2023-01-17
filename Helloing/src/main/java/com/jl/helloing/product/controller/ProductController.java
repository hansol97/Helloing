package com.jl.helloing.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.member.model.vo.AccommWish;
import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.product.model.service.ProductService;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.TicketCommand;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	// 숙소 리스트 사진 중복 제거용 메소드
	public ArrayList<Accomm> removeAcArray(ArrayList<Accomm> list) {
		
		for(int i = 0; i < list.size(); i++) {
			if(i+1 != list.size()) {
				if(list.get(i).getAccommNo() == list.get(i+1).getAccommNo()) {
					list.remove(i+1);
					i--;
				}
			} else { 
				break;
			}
		}
		
		return list;
	}

	// 숙소 메인
	@RequestMapping("accomm")
	public ModelAndView accommMain(ModelAndView mv) {
		
		ArrayList<Accomm> acList = removeAcArray(productService.selectAcList());
		
		mv.addObject("acList", acList)
		  .setViewName("product/accommMain");
		
		return mv;
	}
	
	// 숙소 검색
	@RequestMapping("search.accomm")
	public ModelAndView searchAccomm(Accomm ac, ModelAndView mv) {
		System.out.println("카테고리 : " + ac.getCategory());
		System.out.println("검색어 : " + ac.getAccommName());
		
		ArrayList<Accomm> list = removeAcArray(productService.searchAccomm(ac));
		
		System.out.println(list);
		
		if(list.isEmpty()) { // 검색 리스트가 비어있다면 다른 추천 리스트 보여주기
			ArrayList<Accomm> anoList = removeAcArray(productService.selectAcList());
			mv.addObject("anoList", anoList);
		} else {
			mv.addObject("accommList", list);
		}
		
		mv.addObject("keyword", ac.getAccommName())
		  .setViewName("product/accommSearch");
		
		return mv;
	}
	
	// 숙소 상세 페이지
	@RequestMapping("detail.accomm")
	public ModelAndView DetailAccomm(HttpSession session, int accommNo, ModelAndView mv, AccommWish aw) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Accomm ac = productService.selectAcDetail(accommNo);
		ArrayList<Attachment> at = productService.selectPhotoList(accommNo);
		
		ArrayList<String> photo = new ArrayList<String>();
		
		for(int i = 0; i < at.size(); i++) {
			photo.add(at.get(i).getAttachment());
		}
		
		ac.setCheckIn(ac.getCheckInout().split(" / ")[0]);
		ac.setCheckOut(ac.getCheckInout().split(" / ")[1]);
		
		if(loginUser != null) { // 로그인이 되어있을때만 위시리스트 확인하기
			aw.setMemNo(loginUser.getMemNo());
			
			mv.addObject("checkWish", productService.checkAcWish(aw));
		}
		
		mv.addObject("ac", ac) // 숙소 정보
		  .addObject("photo", photo) // 사진 정보
		  .addObject("roomList", productService.selectRoomList(accommNo)) // 객실 정보
		  .addObject("acReviewList", productService.selectAcReviewList(accommNo)) // 리뷰 정보
		  .setViewName("product/accommDetail");
		
		return mv;
	}
	
	// 숙소 예약(결제) 페이지
	@ResponseBody
	@RequestMapping(value="reserve.accomm")
	public ModelAndView reserveAccomm(HttpSession session, RoomPayment rp, ModelAndView mv) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) { // 로그인이 되어있는 상태에서만 결제 가능
			mv.addObject("rp", rp);
			mv.setViewName("product/accommReserve");
			
		} else {
			session.setAttribute("alertMsg", "로그인이 필요한 서비스입니다.");
			mv.setViewName("redirect:loginForm.me");
		}
		
		return mv;
	}
	
	// 숙소 결제 완료
	@RequestMapping("pay.accomm")
	public String payAccomm(HttpSession session, RoomPayment rp) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		rp.setMemNo(loginUser.getMemNo());
		
		int result = productService.insertRoomPayment(rp);
		
		System.out.println(result);
		
		return "product/paySuccess";
	}
	
	// 액티비티 메인
	@RequestMapping("activity")
	public ModelAndView activityMain(ModelAndView mv) {
		
		ArrayList<Activity> actList = productService.selectActList();
		
		for(int i = 0; i < actList.size(); i++) {
			if(i+1 != actList.size()) {
				if(actList.get(i).getActivityNo() == actList.get(i+1).getActivityNo()) {
					actList.remove(i+1);
					i--;
				}
			} else { 
				break;
			}
		}
		
		mv.addObject("actList", actList)
		  .setViewName("product/activityMain");
		
		return mv;
	}
	
	// 액티비티 검색
	@RequestMapping("search.activity")
	public String searchActivity() {
		return "product/activitySearch";
	}
	
	// 액티비티 상세 페이지
	@RequestMapping("detail.activity")
	public ModelAndView DetailActivity(ModelAndView mv, HttpSession session, int activityNo, ActivityWish aw) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) { // 로그인이 되어있을때만 위시리스트 확인하기
			aw.setMemNo(loginUser.getMemNo());
			
			mv.addObject("checkWish", productService.checkActWish(aw));
		}
		
		mv.addObject("act", productService.selectActDetail(activityNo))
		  .addObject("ticketList", productService.selectTicketList(activityNo))
		  .addObject("actReviewList", productService.selectReviewList(activityNo))
		  .setViewName("product/activityDetail");
		
		return mv;
	}
	
	// 액티비티 결제 페이지
	@RequestMapping("reserve.activity")
	public ModelAndView reserveActivity(HttpSession session,
								  		TicketCommand tk,
								  		Activity act,
								  		ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) { // 로그인 되어있는 유저만 결제 페이지 넘어가기
			
			for(int i = 0; i < tk.getTicketPayment().size(); i++) {
				
				if(tk.getTicketPayment().get(i).getCount() == 0) { // 티켓 수량이 0이면 리스트에서 제거하기
					tk.getTicketPayment().remove(i);
					tk.getTicketPayment().get(i).setMemNo(loginUser.getMemNo());
					i--;
					continue;
				}
			}
			
			mv.addObject("ticketList", tk.getTicketPayment())
			  .addObject("act", act)
			  .setViewName("product/activityReserve");
			
		} else {
			session.setAttribute("alertMsg", "로그인이 필요한 서비스입니다.");
			mv.setViewName("redirect:loginForm.me");
		}
		
		return mv;
	}
	
	// 액티비티 결제 완료
	@RequestMapping("pay.ticket")
	public String payActivity(HttpSession session,
						      TicketCommand tk,
						      ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		for(int i = 0; i < tk.getTicketPayment().size(); i++) {
			tk.getTicketPayment().get(i).setMemNo(loginUser.getMemNo());
		}
		
		// ticket payment 테이블에 행추가
		int result = productService.insertTicketPayment(tk.getTicketPayment());
		// ticket 테이블에 티켓 카운트 -1
		//productService.decreaseCount(tk.getTicketPayment());
		
		System.out.println(result);
		
		return "product/paySuccess";
	}
	
}


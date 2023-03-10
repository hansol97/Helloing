package com.jl.helloing.business.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestScope;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.jl.helloing.business.model.service.BusinessService;
import com.jl.helloing.business.model.service.BusinessServiceImpl;
import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.business.model.vo.BusinessPayment;
import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.product.model.service.ProductService;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.Room;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.Ticket;

@Controller
public class BusinessController {

	@Autowired
	private BusinessService businessService;

	@Autowired
	private ProductService productService;

	
	
	// 인호 시작---------------------------------------------------------------------------------------------


	// 숙소 조회 // 숙소조회하고 Room조회 한다음 같이 mv에 담아서 보내자.
	@RequestMapping("accommList.bu")
	public ModelAndView selectAccom(HttpSession session ,ModelAndView mv) {
		
		ArrayList<Accomm> accList = new ArrayList<Accomm>();
		Business loginCompany = (Business) session.getAttribute("loginCompany");// 로그인한 사업자 객체 세션에서 뽑기
		String businessNo = loginCompany.getBusinessNo();		// 사업자번호 뽑기
		accList = businessService.selectAccommList(businessNo); // 사업자 번호 보내서 숙소 리스트 가져오기
		
//		ArrayList<Integer> accommNoList = new ArrayList<Integer>();
		ArrayList<Room> roomList = new ArrayList<Room>();
		
		int accommNo;
		for (Accomm j : accList) { // 가져온 객실 리스트 각각의 Accomm VO에 방 리스트 넣어두기 

			accommNo = j.getAccommNo(); // 숙소번호 가져오기
//			accommNoList.add(accommNo); // 숙소 번호 빼내서 번호 리스트 만들기
			roomList = businessService.selectRoomList(accommNo); //숙소 번호  보내서 방 리스트 받아오기
			j.setRoomList(roomList); // Accomm vo에 받아온 객실들이 담긴 ArrayList 추가 
			
		}
		session.setAttribute("accList", accList);
		
		mv
//		.addObject("accList", accList)
		.setViewName("business/accommList");
		
		return mv;
	}
	
	// 액티비티 조회 + 티켓 조회 후 같이 보내자
	@RequestMapping("activityList.bu")
	public ModelAndView selectActivity(HttpSession session ,ModelAndView mv) {
		
		ArrayList<Activity> actList = new ArrayList<Activity>();
		Business loginCompany = (Business) session.getAttribute("loginCompany");// 로그인한 사업자 객체 세션에서 뽑기
		String businessNo = loginCompany.getBusinessNo();	// 사업자번호 뽑기
		actList = businessService.selectActivityList(businessNo); // 사업자 번호 보내서 객실 리스트 가져오기
		
		ArrayList<Integer> actNoList = new ArrayList<Integer>();
		ArrayList<Ticket> ticketList = new ArrayList<Ticket>();
		
		for (Activity j : actList) { // 가져온 객실 리스트 각각의 Accomm VO에 방 리스트 넣어두기 

			int activityNo = j.getActivityNo(); // 액티비티 번호 가져오기
			actNoList.add(activityNo); // 액티비티 번호 빼내서 번호 리스트 만들기
			
			ticketList = businessService.selectTicketList(activityNo); //숙소 번호 리스트 보내서 방 리스트 받아오기
			j.setTicketList(ticketList); // Activity vo에 받아온 객실들이 담긴 ArrayList 추가 
		}
		System.out.println("포문 돌려서 방 집어넣은 actList : " + actList);
		
		session.setAttribute("actList", actList);

		mv
//		.addObject("actList", actList)
		.setViewName("business/activityList");
		
		return mv;
	}
	
	
	// 숙소등록화면으로 이동
	@RequestMapping("goInsertAccom.bu")
	public String goInsertAccom() {
		return "business/insertAccomm";
	}
    
    // 숙소 등록!!! insertAccom()
    // 3 files
    @RequestMapping("insertAccom.bu")
	public String insertAccom(Accomm acc, MultipartFile[] upfile, HttpSession session, Model model) {
		// filename이 빈 문자열인가 아닌가로 첨부파일 유무를 판단할 수 있다 (첨부해도 파일사이즈가 0일수 있음)
		// System.out.println(b); 
		// System.out.println(upfile); //첨부파일이 있든 없든 객체가 무조건 생성된다 - 차이점은 filename에 원본명이 존재하는가, 혹은 ""(빈문자열)인가
		
		// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버 업로드
		// => 원본명, 서버에 업로드된 경로를 b에 이어서 담기(파일이 존재할 경우에만)

    	ArrayList<Attachment> list = new ArrayList<Attachment>();
    	for (int i = 0; i < upfile.length; i++) {
			
	    		if (!upfile[i].getOriginalFilename().equals("") ) { // getOriginalFileName == filename필드의 값을 반환함.
				
					Attachment at = new Attachment();
					at.setOriginName( upfile[i].getOriginalFilename());
					at.setChangeName( saveFile(upfile[i], session) );
					at.setFilePath( "resources/uploadFiles/"  );
					list.add(at);
	    		}
		}

		if (businessService.insertAccom(acc) > 0) { // 성공 => 게시글 리스트 페이지
			// 포워딩으로 보낸다면?? boardListView.jsp // 리스트 달라고 요청을 한게 아니기 때문에 리스트 조회가 되지 않는다. => DB에 들렀다 와야한다.
			// return "board/boardListView";
			if(businessService.insertAccomPhoto(list)>0) {
				session.setAttribute("alertMsg", "숙소 등록 성공!");
				return "redirect:accommList.bu";
			}else {
				model.addAttribute("errorMsg", "숙소 등록에 실패했어요...");
				return "common/errorPage";
			}
		} else {// 실패 => 에러 페이지로
			model.addAttribute("errorMsg", "숙소 등록에 실패했어요...");
			return "common/errorPage";
		}
	}
    
    // 숙소 수정 (UPDATE)
    @RequestMapping("updateAccomm.bu")
    public String updateAccomm(Accomm acc, Attachment at, MultipartFile[] reUpfile, HttpSession session) {
    	
    	ArrayList<Attachment> list = new ArrayList<Attachment>();
    	
    	// 파일 관리
    	for (int i = 0; i < reUpfile.length; i++) { 
			
			if (!reUpfile[i].getOriginalFilename().equals("")) { // 새로운 첨부파일이 있다.
				
				//기존 첨부파일이 있었을 경우 ? => 기존 첨부파일을 삭제 
				if(at.getOriginName() != null) {
					new File(session.getServletContext().getRealPath(at.getAttachment())).delete();
				}
				// 새로 넘어온 첨부파일 서버 업로드 시키기
				// 만들어놓은 saveFile()호출해서 첨부파일을 업로드
				at.setOriginName( reUpfile[i].getOriginalFilename());
				at.setChangeName( saveFile(reUpfile[i], session) );
				at.setFilePath( "resources/uploadFiles/"  );
				list.add(at);
				
			} 
    	}
    	
		if (businessService.updateAccomm(acc) > 0) {
			if (businessService.insertAccomPhoto(list)>0) {
				session.setAttribute("alertMsg", "수정 성공");
			}
		} else {
			session.setAttribute("alertMsg", "망했어~~~");
		}
    	
		return "redirect:accommList.bu";
    }
    
    // 숙소 삭제 (UPDATE)
    @RequestMapping("deleteAccomm.bu")
    public String deleteAccomm(int accommNo, HttpSession session) {
    	
    	int result = businessService.deleteAccomm(accommNo);
 
    	if (result > 0) { // 숙소삭제 성공시  - 숙소 파일 삭제하기
    		
    		ArrayList<Attachment> atList = productService.selectPhotoList(accommNo);
    		ArrayList<String> filePathList = new ArrayList<String>();
    		ArrayList<Accomm> accList = (ArrayList<Accomm>)session.getAttribute("accList");
    		
    		// attachment 필드들 가져와서 리스트에 집어넣기
    		for(int i = 0; i < atList.size(); i++) {
    			filePathList.add( atList.get(i).getAttachment() );
    		}
    		for (int j = 0; j < filePathList.size(); j++) {
				
    			String filePath = filePathList.get(j); // filePath를 얻었다. 지우자.
    			// System.out.println("숙소 파일패스 : " + filePath);
    			if (!filePath.equals("")) { // 파일이 있으면 지우자
					new File(session.getServletContext().getRealPath(filePath)).delete();
				}
			}
    		// 숙소에 딸린 방 지우기
    		int result2 = businessService.deleteRoomA(accommNo); 
    		
    		if (result2 > 0) { // 방 지워졌으면 방 파일 지우기
    			
    			ArrayList<Room> roomList = new ArrayList<Room>();
        		ArrayList<Attachment> roomAtList = new ArrayList<Attachment>();
        		ArrayList<String> roomFilePathList = new ArrayList<String>();
    			for (int j = 0; j < accList.size(); j++) {
    				if (accList.get(j).getAccommNo() == accommNo) {
						roomList = accList.get(j).getRoomList(); // 방 두개면 방 두개 들어가 있음.
					} 
				}
    			// System.out.println("roomList : " + roomList);
    			if (roomList != null) { // 방이 있으면
    				
    				for (int i = 0; i < roomList.size(); i++) { // roomNo 찾아와서 파일 지워야 함
    					int roomNo = roomList.get(i).getRoomNo();
    					//름넘버 가져가서 ATTACHMENT 가져와서 ATTACHMENT리스트 에 담기
    					roomAtList = productService.selectRoomPhotoList(roomNo); // roomFilePath(filePath + changeName)
    					// 한 방번호당 여러개의 AtList 생성 -> 여기서는 방번호 하나당 roomAtList두개 생성될것. 
    					// 그럼 두번 돌려서 roomFilePathList 두개 씩 두번 
    					for (int j = 0; j < roomAtList.size(); j++) {
							String path1 = roomAtList.get(j).getAttachment(); // 파일패스(문자열) 1개 얻어서 파일패스 리스트에 집어넣기
							roomFilePathList.add( path1 ); 
						} // 이 for문이 한번 끝나면  roomFilePathList 1개 경로 추가됨. 태스트때는 두번 도니까 두개의 경로가 추가
    					  // System.out.println("roomFilePathList : 2개 예상  : " + roomFilePathList);
    				}
    				// System.out.println("roomFilePathList : 4개 예상 : " + roomFilePathList);
    				
    				// 파일패스 4개 얻었으니 roomFilePathList의 크기인 4번 돌면서 파일을 지워주자
    				for (int i = 0; i < roomFilePathList.size(); i++) {
    					String path = roomFilePathList.get(i); 
    					if (!path.equals("")) { // 파일이 있으면 지우자
    						new File(session.getServletContext().getRealPath(path)).delete();
    						if ( path.equals("") ) session.setAttribute("alertMsg", "숙소와 파일을 삭제하였습니다.");
    						else  				   session.setAttribute("alertMsg", "숙소는 삭제되었지만 파일이 삭제되지 않았습니다.");   					
    					}
					}
    			}
			}
		} else {
			session.setAttribute("errorMsg", "아.. 삭제에 실패하였습니다....");
		}
    	return "redirect:accommList.bu";
    }
    
	// 액티비티 등록 화면으로 이동
	@RequestMapping("goInsertAct.bu")
	public String goInsertAct() {
		return "business/insertActivity";
	}
	// 액티비티 등록!!! 
	@RequestMapping("InsertAct.bu")
	public String InsertAct(Activity act, MultipartFile[] upfile, HttpSession session, Model model) {
		
    	ArrayList<Attachment> list = new ArrayList();
    	for (int i = 0; i < upfile.length; i++) {
			
	    		if (!upfile[i].getOriginalFilename().equals("") ) { 
				
					Attachment at = new Attachment();
					at.setOriginName( upfile[i].getOriginalFilename());
					at.setChangeName( saveFile(upfile[i], session) );
					at.setFilePath( "resources/uploadFiles/"  );
					list.add(at);
	    		}
		}

    	if (businessService.InsertAct(act) > 0) { // 성공 => 게시글 리스트 페이지

			if(businessService.InsertActPhoto(list)>0) {
				session.setAttribute("alertMsg", "액티비티 등록 성공!");
				return "redirect:activityList.bu";
			} else {
				model.addAttribute("errorMsg", "액티비티 등록에 실패했어요...");
				return "common/errorPage";
			}
		} else {// 실패 => 에러 페이지로
			model.addAttribute("errorMsg", "액티비티 등록에 실패했어요...");
			return "common/errorPage";
		}
	}
	
    
    // 액티비티 수정 (UPDATE)
	
    
    
    // 액티비티 삭제 (UPDATE)
//    @RequestMapping("deleteAct.bu")
//    public String deleteActivity(int activityNo, HttpSession session) {
//    	
//    	int result = businessService.deleteActivity(activityNo); //액티비티 삭제
//    	
//    	if (result > 0) {// 액티 삭제 성공시  - 액티 사진 파일 삭제하기
//    		
//    		ArrayList<Attachment> atList = productService.selectActPhotoList(activityNo);
//    		ArrayList<String> filePathList = new ArrayList<String>();
//    		ArrayList<Activity> actList = (ArrayList<Activity>)session.getAttribute("actList");
//    		
//    		// attachment 필드들 가져와서 리스트에 집어넣기
//    		for(int i = 0; i < atList.size(); i++) {
//    			filePathList.add( atList.get(i).getAttachment() );
//    		}
//    		for (int j = 0; j < filePathList.size(); j++) {
//				
//    			String filePath = filePathList.get(j); // 숙소 filePath를 얻었다. 지우자.
//    			System.out.println("액티 파일패스 : " + filePath);
//    			if (!filePath.equals("")) { // 파일이 있으면 지우자
//					new File(session.getServletContext().getRealPath(filePath)).delete();
//				}
//			}
//    		// 액티 에 딸린 티켓 지우기
//    		int result2 = businessService.deleteTicketA(activityNo); 
//    		
//    		if (result2 > 0) { // 티켓은 사진이 없다....
//    			session.setAttribute("alertMsg", "액티비티와 티켓을  삭제하였습니다.");
//			}
//		} else {
//			session.setAttribute("errorMsg", "아.. 삭제에 실패하였습니다....");
//		}
//    	return "redirect:activityList.bu";
//    }
    // 불린으로 받을 경우. 
    @RequestMapping("deleteAct.bu")
    public String deleteActivity(int activityNo, HttpSession session) {
        boolean isDeleted;
        
        if (businessService.deleteActivity(activityNo) == 1) isDeleted = true;
		else	isDeleted = false;
        businessService.deleteActivity(activityNo);
        
        if (isDeleted) {
            deleteRelatedPhotos(activityNo, session);
            boolean isTicketDeleted;

            if (businessService.deleteTicketA(activityNo)==1) isTicketDeleted = true ;
            else isTicketDeleted = false;
            if (isTicketDeleted) session.setAttribute("alertMsg", "액티비티와 티켓이 성공적으로 삭제되었음.음.");
            
        } else {
            session.setAttribute("errorMsg", "액티비티 삭제 실패.");
        }
        return "redirect:activityList.bu";
    }
    
    private void deleteRelatedPhotos(int activityNo, HttpSession session) {
        ArrayList<Attachment> attachments = productService.selectActPhotoList(activityNo);
        for (Attachment attachment : attachments) {
            String filePath = attachment.getAttachment();
            if (!filePath.isEmpty()) {
                new File(session.getServletContext().getRealPath(filePath)).delete();
            }
        }
    }
     
	
	// 객실 등록화면으로 이동
	@RequestMapping("goInsertRoom.bu")
	public ModelAndView goInsertRoom(int accommNo, String accommName, ModelAndView mv) {
		mv.addObject("accommNo", accommNo).addObject("accommName", accommName).setViewName("business/insertRoom");
		return mv;
	}
	// 객실등록
	@RequestMapping("insertRoom.bu")
	public String InsertRoom(int accommNo ,Room room, MultipartFile[] upfile, HttpSession session, Model model) {

    	ArrayList<Attachment> list = new ArrayList();
    	for (int i = 0; i < upfile.length; i++) {
			
    		if (!upfile[i].getOriginalFilename().equals("") ) { 
			
				Attachment at = new Attachment();
				at.setOriginName( upfile[i].getOriginalFilename());
				at.setChangeName( saveFile(upfile[i], session) );
				at.setFilePath( "resources/uploadFiles/"  );
				list.add(at);
    		}
		}

		if (businessService.InsertRoom(room) > 0) { // 성공 => 게시글 리스트 페이지

			if(businessService.InsertRoomPhoto(list)>0) {
				session.setAttribute("alertMsg", "객실 등록 성공!");
				return "redirect:accommList.bu";
			} else {
				model.addAttribute("errorMsg", "객실 등록에 실패했어요...");
				return "common/errorPage";
			}
		} else {// 실패 => 에러 페이지로
			model.addAttribute("errorMsg", "객실 등록에 실패했어요...");
			return "common/errorPage";
		}
	}
	
    // 객실 수정 (UPDATE)

    
    // 객실  삭제 (UPDATE)
	@RequestMapping("deleteRoom.bu")
    public String deleteRoom(int roomNo, HttpSession session) {
    	
    	int result = businessService.deleteRoom(roomNo);
    	
    	if (result > 0) {
    		
			ArrayList<Attachment> roomAtList = productService.selectRoomPhotoList(roomNo); // roomFilePath(filePath + changeName)
			ArrayList<String> roomFilePathList = new ArrayList<String>();
			// 한 방번호당 여러개의 AtList 생성 -> 여기서는 방번호 하나당 roomAtList두개 생성될것. 
			// 그럼 두번 돌려서 roomFilePathList 두개 씩 두번 
			for (int j = 0; j < roomAtList.size(); j++) {
				String path1 = roomAtList.get(j).getAttachment(); // 파일패스(문자열) 1개 얻어서 파일패스 리스트에 집어넣기
				roomFilePathList.add( path1 ); 
			} // 이 for문이 한번 끝나면  roomFilePathList 1개 경로 추가됨. 태스트때는 두번 도니까 두개의 경로가 추가
			System.out.println("roomFilePathList : 2개 예상  : " + roomFilePathList);

			for (int i = 0; i < roomFilePathList.size(); i++) {
				String path = roomFilePathList.get(i); 
				if (!path.equals("")) { // 파일이 있으면 지우자
					new File(session.getServletContext().getRealPath(path)).delete();
				}
				System.out.println("지워진 " + i + "번째  파일의 경로 : " + path );
			}
			session.setAttribute("alertMsg", "객실를 삭제하였습니다.");
		} else {
			session.setAttribute("errorMsg", "아.. 삭제에 실패하였습니다....");
		}
    	return "redirect:accommList.bu";
    }
	

	// 티켓 등록 화면으로 이동 
	@RequestMapping("goInsertTicket.bu")
	public ModelAndView goInsertTicket(int activityNo,String activityName, ModelAndView mv) {
		mv.addObject("activityNo", activityNo).addObject("activityName", activityName).setViewName("business/insertTicket");
		
		return mv;
	}
	// 티켓등록하기
	@RequestMapping("insertTicket.bu")
	public String insertTicket(int activityNo, Ticket t, Model m) {
		
		t.setActivityNo(activityNo);
		System.out.println("actNo : " +activityNo);
		int result = businessService.insertTicket(t);
		
		if (result > 0) { // 티켓 등록 성공! 
			return "redirect:activityList.bu";
		} else { // 실패 => 에러 문구를 담아서 에러페이지로 포워딩
			m.addAttribute("errorMsg", "회원가입 실패ㅠㅠ");
			return "common/errorPage"; 
		}
	}
	
    // 티켓 수정 (UPDATE)
    
    
    // 티켓 삭제 (UPDATE)
	@RequestMapping("deleteTicket.bu")
    public String deleteTicket(int ticketNo, HttpSession session) {
    	
    	int result = businessService.deleteTicket(ticketNo);
    	
    	if (result > 0) {
			session.setAttribute("alertMsg", "티켓을 삭제하였습니다.");
		} else {
			session.setAttribute("errorMsg", "아.. 삭제에 실패하였습니다....");
		}
    	return "redirect:activityList.bu";
    }
	
	// 숙소 객실별 예약된 날짜 확인
	@ResponseBody
	@RequestMapping(value="bookedDate.bu", produces="application/json; charset=UTF-8")
	public String checkBookDate(int roomNo) {
		ArrayList<RoomPayment> arr = businessService.checkBookDate(roomNo);
		return new Gson().toJson(arr);
	}
	
	// 숙소 객실 날짜별 예약정보
	@ResponseBody
	@RequestMapping(value="selectBookInfo.bu", produces="application/json; charset=UTF-8")
	public String selectBookInfo(RoomPayment rp) {
		RoomPayment bookInfo = businessService.selectBookInfo(rp);
		return new Gson().toJson(bookInfo);
	}
	
	// 숙소 수정하기화면으로 이동
	@RequestMapping("goUpdateAccom.bu")
	public ModelAndView goUpdateAccom(int accommNo, Accomm acc, HttpSession session, ModelAndView mv) {
		
		// 조회하러 DB안가고  숙소 번호로 세션에 있는 객체 뽑아오기
		ArrayList<Accomm> accList = (ArrayList<Accomm>) session.getAttribute("accList");
		ArrayList<Attachment> photoList = productService.selectAccommAttachmentList(accommNo); 

		for (Accomm accomm : accList) { // 
			if (accomm.getAccommNo() == accommNo) { acc = accomm; } 
		}

		System.out.println("photoList : " + photoList);
		
		mv.addObject("acc", acc)
		  .addObject("photoList", photoList)
		  .setViewName("business/updateAccomm");
		
		return mv;
	}
	// 액티비티 수정하기화면으로 이동
	@RequestMapping("goUpdateAct.bu")
	public String goUpdateActivity() {
		return "business/updateActivity";
	}

	// 객실 수정화면으로 이동
	@RequestMapping("goUpdateRoom.bu")
	public String goUpdateRoom() {
		return "business/updateRoom";
	}
	// 티켓 수정 화면으로 이동 
	@RequestMapping("goUpdateTicket.bu")
	public String goUpdateTicket() {
		return "business/updateTicket";
	}
	
	// 숙소 기업결제 화면으로 이동 
	@RequestMapping("goPayAccom.bu")
	public ModelAndView goPayAccom(int accommNo, String accommName, ModelAndView mv) {
		mv.addObject("accommNo", accommNo).addObject("accommName", accommName).setViewName("business/payAccomm");
		return mv;
	}
	// 숙소 기업결제하기
	@RequestMapping("payAccomm.bu")
	public String payAccomm(Accomm ac, BusinessPayment bp, HttpSession session, HttpServletRequest request) {
		
		Business loginCompany = (Business) session.getAttribute("loginCompany");// 로그인한 사업자 객체 세션에서 뽑기
		String businessNo = loginCompany.getBusinessNo(); // 사업자번호 가져오기
		int accommNo = Integer.parseInt(request.getParameter("accommNo"));
		String accommName = request.getParameter("accommName");
		System.out.println(accommNo);
		bp.setBusinessNo(businessNo); // BusinessPayment 에 사업자 번호 담기
		bp.setAccommNo(accommNo); // BusinessPayment 에 숙소 번호 담기
		
		// bp 보내서  BUSINESS_PAYMENT테이블 INSERT	- 반환값 int
		int resultB = businessService.updateBusinessPayment(bp);
		
		if ( resultB > 0 ) { // 결제에 성공하면 만료일자 늘려주기 
			
			// ac 보내서 ACCOMM 테이블의 만료일자 업데이트 (END_DATE + 1년) - UPDATE - 반환값 int
			int resultA = businessService.updateAccommEndDate(accommNo);
			
			if (resultA > 0) { // 만료일자 늘리기 성공시
				session.setAttribute("alertMsg", "결제에 성공하셨습니다. 만료일자가 1년 연장됩니다. 감사합니다👍");
				return "redirect:accommList.bu";
			} else { 	// 만료일자 늘리기 실패
				session.setAttribute("alertMsg", "결제에 성공했지만 만료일자가 늘어나지 않았습니다 .1대 1 문의를 이용해 주세요");
				return "business/accommList";
			}
		} else { // 결제 실패
			session.setAttribute("alertMsg", "결제에 실패하셨습니다. 다시 시도해 주세요");
			return "business/accommList";
		}
	}
	
	
	// 액티비티 기업결제 화면으로 이동 
	@RequestMapping("goPayAct.bu")
	public ModelAndView goPayActivity(int activityNo, String activityName, ModelAndView mv) {
		mv.addObject("activityNo", activityNo).addObject("activityName", activityName).setViewName("business/payActivity");
		return mv;
	}
	
	// 액티비티 기업결제하기 
	@RequestMapping("payActivity.bu")
	public String payActivity(Activity act, BusinessPayment bp, HttpSession session, HttpServletRequest request) {
		
		Business loginCompany = (Business) session.getAttribute("loginCompany");// 로그인한 사업자 객체 세션에서 뽑기
		String businessNo = loginCompany.getBusinessNo(); // 사업자번호 가져오기
		int activityNo = Integer.parseInt(request.getParameter("activityNo"));
		String activityName = request.getParameter("activityName");
		bp.setBusinessNo(businessNo); // BusinessPayment 에 사업자 번호 담기
		bp.setActivityNo(activityNo); // BusinessPayment 에 숙소 번호 담기
		
		// bp 보내서  BUSINESS_PAYMENT테이블 INSERT	- 반환값 int
		int resultB = businessService.updateBusinessPayment(bp);
		
		if ( resultB > 0 ) { // 결제에 성공하면 만료일자 늘려주기 
			
			// ac 보내서 ACCOMM 테이블의 만료일자 업데이트 (END_DATE + 1년) - UPDATE - 반환값 int
			int resultA = businessService.updateActivityEndDate(activityNo);
			
			if (resultA > 0) { // 만료일자 늘리기 성공시
				session.setAttribute("alertMsg", "결제에 성공하셨습니다. 만료일자가 1년 연장됩니다. 감사합니다👍");
				return "redirect:activityList.bu";
			} else { 	// 만료일자 늘리기 실패
				session.setAttribute("alertMsg", "결제에 성공했지만 만료일자가 늘어나지 않았습니다 .1대 1 문의를 이용해 주세요");
				return "business/activityList";
			}
		} else { // 결제 실패
			session.setAttribute("alertMsg", "결제에 실패하셨습니다. 다시 시도해 주세요");
			return "business/activityList";
		}
		
	}
	
	// 카카오 주소에서 좌표받아오기 컨트롤러
    private static String GEOCODE_URL="http://dapi.kakao.com/v2/local/search/address.json?query=";
    private static String GEOCODE_USER_INFO="1fa55aec8417264025c2d5d36f070b8c" ;  //rest API 키
	
    @ResponseBody
    @RequestMapping(value = "getGeocode.etc", produces="application/json; charset=UTF-8")
	public String getGeocode(String address) {
        
		URL obj;
    	String result ="";
        try{
            //인코딩한 String을 넘겨야 원하는 데이터를 받을 수 있다.
        	address = URLEncoder.encode( address , "UTF-8");
            
            String url = GEOCODE_URL + address;
            
            obj = new URL(url);
//            System.out.println(obj);
			
            HttpURLConnection con = (HttpURLConnection)obj.openConnection();
            
            //get으로 받아오면 된다. 자세한 사항은 카카오개발자센터에 나와있다.
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Requested-With", "curl");
            con.setRequestProperty("Authorization","KakaoAK 1fa55aec8417264025c2d5d36f070b8c"); //키 넣을 때 앞에 KakaoAK붙일 것!
            con.setRequestProperty("content-type", "application/json");
			
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
            
            String inputLine;
            StringBuffer response = new StringBuffer();
            
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();
           con.disconnect();
			
            //response 객체를 출력해보자
            System.out.println(response.toString());
            result = response.toString();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
		return result;
	}
	

    
    // 파일 리네임 saveFile() 
	public String saveFile(MultipartFile upfile, HttpSession session) {// 실제 넘어온 파일의 이름을 변경해서 서버에 업로드하는 역할
		// 파일명 수정작업 후 서버에 업로드 시키기("image.png" => 20221238123123.png)
		String originName = upfile.getOriginalFilename();
		
		// "20221226103530"(년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());//util타입 Date가 아니면 simpleDateFormat이 받을 수가 없다
		
		//12321(5자리 랜덤값)
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 확장자
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = "helloing_" + currentTime + "_" +ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		// 세션 만들고 getServletContext()이용해서 application에 접근하고, 파일 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {												// transferTo() => 서버에 파일을 업로드해주는 메소드
			upfile.transferTo(new File(savePath, changeName));//파일 객체를 만들 때는 경로와 파일명을 넣어서..
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
    // 인호 끝-----------------------------------------------------------------------------------------------
    
    
	// 메뉴바에서 기업관리 누르면 기업페이지로 이동
	@RequestMapping("page.bu")
	public String businessPage() {
		return "business/menubar_business";
	}
	// 기업 마이페이지
	@RequestMapping("mypage.bu")
	public String selectComMem(HttpSession session) {
		return "business/mypage";
	}
	
	// 기업 정보 수정
	@RequestMapping("mypageEnroll.bu")
	public String updateComMem() {
		return "business/mypageUpdateForm";
	}
	
	// 숙소 예약자 리스트
	@RequestMapping("accommBookList.bu")
	public String accommBookList(int roomNo, Model m) {
		m.addAttribute("roomNo", roomNo);
		return "business/accommBookList";
	}
	
	
	// 승준
	// 기업 파트너 등록 폼
	@RequestMapping("businessEnrollForm.hj")
	public String businessEnrollForm() {
		return "member/businessEnrollForm";
	}
	
	// 기업 파트너 등록
	@RequestMapping("insertCompany.hj")
	public String insertCompany(HttpSession session, Business b, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int memNo = loginUser.getMemNo();
		
		//System.out.println(loginUser.getMemNo()); 
		b.setMemNo(memNo);
		
		//System.out.println(b);

		int result = businessService.insertCompany(b);
		
		if( result >0) {
			Business loginCompany = businessService.loginCompany(memNo); // 세션에 있는 memNo를 다시 loginCompany에 넣는다.
			
			session.setAttribute("loginCompany" , loginCompany);
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg","등록에 실패 하셨습니다.");
			return "member/businessEnrollForm";
		}
	}
	
	
	// 기업파트너등록 전 알림페이지
	@RequestMapping("loginMove.sj")
	public String loginMove() {
		return "member/loginMove";
	}
	
	
	@RequestMapping("updateMember.bu")
	public String updateBusinessMember(HttpSession session, String address, Model m) {
		Business loginCompany = (Business)session.getAttribute("loginCompany");
		if(loginCompany.getAddress().equals(address) || address.equals("")) {
			return "business/mypage";
		}else {
			loginCompany.setAddress(address);
			
			businessService.updateBusinessMember(loginCompany);
			session.setAttribute("loginCompany", loginCompany);
			return "business/mypage";
		}
	}
	// 승준
	// 비즈니스 중복체크
	@ResponseBody // 데이터를 return 해서 돌려주고 싶을때는 ResponseBody를 쓴다.
	@RequestMapping("busNoCheck.sj")
	public String busNoCheck(String checkBusNo) {
		int count = businessService.busNoCheck(checkBusNo);
		if(count > 0) { // count가 0보다 높으면 이미 존재하는 비즈니스넘버
			return "NNNNNNNNNN";
		} else { // 사용가능
			return "NNNNNNNNNY";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

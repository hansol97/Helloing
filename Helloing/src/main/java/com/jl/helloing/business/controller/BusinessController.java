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

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.jl.helloing.business.model.service.BusinessService;
import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.common.model.vo.Attachment;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.product.model.vo.Accomm;
import com.jl.helloing.product.model.vo.Activity;
import com.jl.helloing.product.model.vo.Room;
import com.jl.helloing.product.model.vo.Ticket;

@Controller
public class BusinessController {

	@Autowired
	private BusinessService businessService;


	
	
	
	
	
	
	
	
	
	
	
	
	// 인호 시작---------------------------------------------------------------------------------------------


	// 숙소 조회 // 숙소조회하고 Room조회 한다음 같이 mv에 담아서 보내자.
	@RequestMapping("accommList.bu")
	public ModelAndView selectAccom(HttpSession session ,ModelAndView mv) {
		
		ArrayList<Accomm> accList = new ArrayList<Accomm>();
		String BusinessNo = ((Business) session.getAttribute("loginCompany")).getBusinessNo();// 사업자번호 가져오기
		ArrayList<Integer> accommNoList = new ArrayList<Integer>();
		accList = businessService.selectAccommList(BusinessNo); // 사업자 번호 보내서 객실 리스트 가져오기
		System.out.println("accList" + accList);
		
		ArrayList<Room> roomList = new ArrayList<Room>();
		
		for (Accomm j : accList) { // 가져온 객실 리스트 각각의 Accomm VO에 방 리스트 넣어두기 

			int accommNo = j.getAccommNo(); // 숙소번호 가져오기

			accommNoList.add(accommNo); // 숙소 번호 빼내서 번호 리스트 만들기
			roomList = businessService.selectRoomList(accommNoList); //숙소 번호 리스트 보내서 방 리스트 받아오기
			System.out.println("roomList : " + roomList);
			j.setRoomList(roomList); // Accomm vo에 받아온 객실들이 담긴 ArrayList 추가 
		
		}
		
		System.out.println(accList);
		
		mv.addObject("accList", accList)
		  .setViewName("business/accommList");
		
		return mv;
	}
	
	// 액티비티 조회
	@RequestMapping("activityList.bu")
	public String selectActivity() {
		return "business/activityList";
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
		
    	ArrayList<Attachment> list = new ArrayList();
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
	// 객실 등록화면으로 이동
	@RequestMapping("goInsertRoom.bu")
	public ModelAndView goInsertRoom(int accommNo, ModelAndView mv) {
		mv.addObject("accommNo", accommNo).setViewName("business/insertRoom");
		
		return mv;
	}
	// 객실등록
	@RequestMapping("insertRoom.bu")
	public String InsertRoom(int accommNo ,Room room, MultipartFile[] upfile, HttpSession session, Model model) {
//		int accommNo = room.getAccommNo();  
//		int accommNo = 3;   // 이거 만지세요~!
		room.setAccommNo(accommNo);// 다 하고 되면 빼고 돌려보자.
		System.out.println("accommNo : " + accommNo);
    	System.out.println("upfile : " + upfile);
    	System.out.println("upfile[0] : " + upfile[0]);

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
	
	// 티켓등록하기
	@RequestMapping("insertTicket.bu")
	public String insertTicket(Ticket t, Model m) {
		
		int result = businessService.insertTicket(t);
		
		if (result > 0) { // 티켓 등록 성공! 
			return "redirect:activityList.bu";
		} else { // 실패 => 에러 문구를 담아서 에러페이지로 포워딩
			m.addAttribute("errorMsg", "회원가입 실패ㅠㅠ");
			return "common/errorPage"; 
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 숙소 수정하기화면으로 이동
	@RequestMapping("goUpdateAccom.bu")
	public String goUpdateAccom() {
		return "business/updateAccomm";
	}
	// 액티비티 수정하기
	@RequestMapping("goUpdateAct.bu")
	public String goUpdateActivity() {
		return "business/updateActivity";
	}

	// 티켓 등록 화면으로 이동 
	@RequestMapping("goInsertTicket.bu")
	public String goInsertTicket() {
		return "business/insertTicket";
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
	public String goPayAccom() {
		return "business/payAccomm";
	}
	
	// 액티비티 기업결제 화면으로 이동 
	@RequestMapping("goPayAct.bu")
	public String goPayActivity() {
		return "business/PayActivity";
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
	public String accommBookList() {
		return "business/accommBookList";
	}
	
	
	// 승준
	// 기업 파트너 등록 폼
	@RequestMapping("businessEnrollForm.bu")
	public String businessEnrollForm() {
		return "member/businessEnrollForm";
	}
	
	// 기업 파트너 등록
	@RequestMapping("insertCompany.bu")
	public String insertCompany(HttpSession session, Business b) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int memNo = loginUser.getMemNo();
		
		//System.out.println(loginUser.getMemNo()); 
		b.setMemNo(memNo);
		
		//System.out.println(b);
		System.out.println(b);
		int result = businessService.insertCompany(b);
		
		if( result >0) {
			
			return "redirect:/";
		} else {

			return "member/businessEnrollForm";
		}
	}
	
	
	// 기업파트너등록 전 알림페이지
	@RequestMapping("loginMove.bu")
	public String loginMove() {
		return "member/loginMove";
	}
	
	
	@RequestMapping("updateMember.bu")
	public String updateBusinessMember(HttpSession session, String address, Model m) {
		Business loginCompany = (Business)session.getAttribute("loginCompany");
		System.out.println(address);
		if(loginCompany.getAddress().equals(address) || address.equals("")) {
			return "business/mypage";
		}else {
			loginCompany.setAddress(address);
			
			businessService.updateBusinessMember(loginCompany);
			session.setAttribute("loginCompany", loginCompany);
			return "business/mypage";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

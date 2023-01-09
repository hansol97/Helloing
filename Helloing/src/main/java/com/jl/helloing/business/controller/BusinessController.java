package com.jl.helloing.business.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jl.helloing.business.model.service.BusinessService;
import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.member.model.vo.Member;

@Controller
public class BusinessController {
	
	@Autowired
	private BusinessService businessService;
	
	// 숙소 조회
	@RequestMapping("accommList.bu")
	public String goSelectAccom() {
		return "business/accommList";
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
	// 액티비티 등록 화면으로 이동
	@RequestMapping("goInsertAct.bu")
	public String goInsertAct() {
		return "business/insertActivity";
	}
	// 숙소 수정하기
	@RequestMapping("goUpdateAccom.bu")
	public String goUpdateAccom() {
		return "business/updateAccomm";
	}
	// 액티비티 수정하기
	@RequestMapping("goUpdateAct.bu")
	public String goUpdateActivity() {
		return "business/updateActivity";
	}
	// 객실 등록화면으로 이동
	@RequestMapping("goInsertRoom.bu")
	public String goInsertRoom() {
		return "business/insertRoom";
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
    private static String GEOCODE_USER_INFO="1fa55aec8417264025c2d5d36f070b8c\r\n" ; 
	
    @RequestMapping("getGeocode.etc")
	public String getGeocode(String beforeAddress) {
        
		URL obj;
    	
        try{
            //인코딩한 String을 넘겨야 원하는 데이터를 받을 수 있다.
            String address = URLEncoder.encode(beforeAddress, "UTF-8");
            
            obj = new URL(GEOCODE_URL+address);
			
            HttpURLConnection con = (HttpURLConnection)obj.openConnection();
            
            //get으로 받아오면 된다. 자세한 사항은 카카오개발자센터에 나와있다.
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization",GEOCODE_USER_INFO);
            con.setRequestProperty("content-type", "application/json");
            con.setDoOutput(true);
            con.setUseCaches(false);
            con.setDefaultUseCaches(false);
			
            Charset charset = Charset.forName("UTF-8");
            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream(), charset));
            
            String inputLine;
            StringBuffer response = new StringBuffer();
            
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
			
            //response 객체를 출력해보자
            System.out.println(response.toString());
            String result = response.toString();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	
	
	// 메뉴바에서 기업관리 누르면 기업페이지로 이동
	@RequestMapping("page.bu")
	public String businessPage() {
		return "business/menubar_business";
	}
	// 기업 마이페이지
	@RequestMapping("mypage.bu")
	public String selectComMem() {
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
	public String insertCompany(HttpSession session, Business b, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		b.setMemNo(memNo);
		
		System.out.println(b); 
		
		int result = businessService.insertCompany(b);
		
		if( result >0) {
			
			return "redirect:/";
		} else {
		
			return "business/businessEnrollForm";
		}
	}
	
	
	// 기업파트너등록 전 알림페이지
	@RequestMapping("loginMove.bu")
	public String loginMove() {
		return "member/loginMove";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

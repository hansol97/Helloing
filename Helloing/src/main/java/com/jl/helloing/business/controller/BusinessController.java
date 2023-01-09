package com.jl.helloing.business.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jl.helloing.business.model.vo.Business;

@Controller
public class BusinessController {
	
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
    private static String GEOCODE_USER_INFO="1fa55aec8417264025c2d5d36f070b8c" ;  //rest API 키
	
    @ResponseBody
    @RequestMapping(value = "getGeocode.etc", produces="application/json; charset=UTF-8")
	public String getGeocode(String address) {
        
		URL obj;
    	String result ="";
        try{
            //인코딩한 String을 넘겨야 원하는 데이터를 받을 수 있다.
        	address = URLEncoder.encode("서울특별시 중구", "UTF-8");
            
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
			
            //response 객체를 출력해보자
            System.out.println(response.toString());
            result = response.toString();
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
		return result;
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
	public String insertCompany(Business b, Model model) {
		
		
		return null;
	}
	
	// 기업파트너등록 전 알림페이지
	@RequestMapping("loginMove.bu")
	public String loginMove() {
		return "member/loginMove";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

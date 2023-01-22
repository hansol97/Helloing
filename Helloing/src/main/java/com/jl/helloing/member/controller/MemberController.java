package com.jl.helloing.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.Format;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.google.gson.Gson;
import com.jl.helloing.business.model.service.BusinessService;
import com.jl.helloing.business.model.vo.Business;
import com.jl.helloing.common.model.vo.Cert;
import com.jl.helloing.member.model.service.MemberService;
import com.jl.helloing.member.model.vo.AccommWish;
import com.jl.helloing.member.model.vo.ActivityWish;
import com.jl.helloing.member.model.vo.Expense;
import com.jl.helloing.member.model.vo.Member;
import com.jl.helloing.member.model.vo.Plan;
import com.jl.helloing.member.model.vo.Planner;
import com.jl.helloing.member.model.vo.PlannerMem;
import com.jl.helloing.member.model.vo.QNA;
import com.jl.helloing.product.model.service.ProductService;
import com.jl.helloing.product.model.vo.AccommReview;
import com.jl.helloing.product.model.vo.ActivityReview;
import com.jl.helloing.product.model.vo.RoomPayment;
import com.jl.helloing.product.model.vo.TicketPayment;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private BusinessService businessService;
	
	@Autowired
	private JavaMailSender sender;
	
	@Autowired 
	private ProductService productService;
	
	//승준
	//로그인
	@RequestMapping("login.me")
	public ModelAndView loginMember( Member m, ModelAndView mv, HttpSession session) {
		
		Member loginUser = memberService.loginMember(m);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {
			int memNo = loginUser.getMemNo();
			Business loginCompany = businessService.loginCompany(memNo);
			
			// System.out.println("loginUser :" + loginUser );
			// System.out.println("memNo:" + memNo);
			// System.out.println("lc:" + loginCompany);
			// System.out.println("서비스 돌아온 후 " + loginUser);
			
			// System.out.println(loginUser.getMemId());
		
		
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("loginCompany", loginCompany);
			mv.setViewName("redirect:/");
		} else {

			mv.addObject("errorMsg","로그인에 실패 하셨습니다.");
			mv.setViewName("common/loginErrorPage");
		}

		return mv;
	}
	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) { 
		session.invalidate();
		return "redirect:/";
	}
	//로그인 창
	@RequestMapping("loginForm.me")
	public String loginForm() {
		return "member/login";
	}
	
	//아이디찾기 폼 이동
	@RequestMapping("findIdForm.me")
	public String findIdForm() {
		return "member/findIdForm";
	}
	
	// 아이디 찾기
	@RequestMapping("findId.me")
	public ModelAndView findId(Member m, ModelAndView mv ) {
		
		Member m1 = memberService.findId(m);
		
		if(m1 != null) {
			String memId = m1.getMemId();
			mv.addObject("memId", memId)
			  .addObject("alertMsg", "당신의 아이디는 : " + memId + "입니다.")
			  .setViewName("member/login");
		} else {
			mv.addObject("alertMsg", "회원가입정보가 없습니다.")
			  .setViewName("member/findIdForm");
		}
		return mv;

		
		
	}
	// 비밀번호 찾기 폼
	@RequestMapping("findPwdForm.me")
	public String findPwdForm() {
		return "member/findPwdForm";
	}
	
	 //비밀번호 찾기
	@RequestMapping("findPwd.me")
	public ModelAndView findPwd(Member m, String email, ModelAndView mv) throws MessagingException {
		
		Member m2 = memberService.findPwd(m);
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		
		if(m2 != null) {
			//System.out.println(m2.getEmail());
			//System.out.println(m2.getMemNo());
			//System.out.println(m2.getMemPwd());
			String return_str = generatePassword();
			
			String url = ServletUriComponentsBuilder //불렀던 주소 입력됨.
					.fromCurrentContextPath()
					.port(8066).path("/")
					.toUriString(); 

			//ClassPathResource image=new ClassPathResource("spitter_logo_50.png");	
			//System.out.println(return_str);
			helper.setTo(email); // 인증번호이거라고 보내준다.
			helper.setSubject("반갑소잉 임시 비밀번호입니다.");
			//helper.setText("임시 비밀번호 : " + return_str + "<br>" + "<a href='" + url + "'><img src='" + /helloing/resources/img/logo_outline.png +"'>반갑소잉 페이지로 이동</a>" , true);
			helper.setText("<h2>"+ m.getMemId() +" 님 반갑소잉👋 </h2>" + "<br><br><br>"+ "임시 비밀번호 : " + return_str + "<br>" +"<h3 style=color:red;>임시 비밀번호입니다. 비밀번호를 꼭 변경 해주세요.</h3>" +"<br><br>"+ "<a href='" + url + "'>반갑소잉 페이지로 이동</a>",true);
			//"<a href='" + url + "'>반갑소잉 페이지로 이동</a>"
			//helper.setText("<a href='" + url + "'>반갑소잉 페이지로 이동</a>",true);
			//helper.addInline("logo_outline.png",image);
			//helper.setText("<a href='" + url + "'>여기로오셔요</a>", true);
			
			String encPwd = bcryptPasswordEncoder.encode(return_str);
			m.setMemPwd(encPwd);
			//System.out.println(m.getMemPwd());
			memberService.updatePwd(m);
			sender.send(message);
			mv.addObject("email", email)
			  .addObject("alertMsg", email +" 이메일로 임시비밀번호를 보냈습니다. 확인 후 비밀번호를 변경해 주십시오.")
			  .setViewName("member/login");
		} else {
			mv.addObject("alertMsg","다시 입력해 주세요.")
			  .setViewName("member/findPwdForm");
		}
		return mv;

	}
	
	// 임시 비밀번호 만들기(10자기 대문자,소문자,숫자 랜덤)
	public String generatePassword() {
		StringBuffer temp = new StringBuffer(); // 랜덤한 문자열을 담을 StringBuffer // 문자열 연산이 많고 멀티쓰레드 환경일 경우 사용
		Random rnd = new Random();
		
		String return_str ="";
		
		for (int i = 0; i < 10; i++) { //10번 돌릴수 있는 루프
		    int rIndex = rnd.nextInt(3);
		    switch (rIndex) {
		    case 0:
		        // a-z 영문 소문자를 구별할 랜덤
		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z 영문 대문자를 구별할 랜덤
		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9 숫자를 구별할 랜덤
		        temp.append((rnd.nextInt(10)));
		        break;
//		    case 3:
//		        // A-Z 특수문자 
//		        temp.append((char) ((int) (rnd.nextInt(26)) + 33));
//		        break;
		        // 정규표현식 생각해보고 넣을지 않넣을지 판단하기
		    }
		}
		return_str = temp.toString();
		return return_str;
	}
	
	
//	// 새 비밀번호 (비밀번호 찾기 후)
//	@RequestMapping("newFindPwd.me")
//	public String updatePwd() {
//		return "member/newFindPwd";
//	}
	// 이용약관 (회원가입 전)
	@RequestMapping("terms.me")
	public String terms() {
		return "member/terms";
	}
	// 회원가입 폼
	@RequestMapping("memberEnrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	// 회원가입
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model) {
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd);
		
		int result = memberService.insertMember(m);
		
		if(result >0) {
			return "redirect:/";
		} else {
			model.addAttribute("errorMsg","회원가입에 실패 하셨습니다.");
			return "common/loginErrorPage";
		}
	}
	
	// 이메일 보내기
	@RequestMapping("certButton.me")
	public String certButton(String email, HttpServletRequest request) throws MessagingException {
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		//System.out.println(email);
		String ip = request.getRemoteAddr(); //getRemoteAddr ip주소를 준다.
		String secret = generateSecret();
		//build 를 사용
			// 필드명만 가지고 setter 처럼 사용 가능
			// 기본생성자랑 setter랑 합친것이다.
			Cert cert =  Cert.builder()
							.who(ip)
							.secret(secret)
							.build();
							
			memberService.sendMail(cert);
			
			helper.setTo(email); // 인증번호이거라고 보내준다.
			helper.setSubject("반갑소잉! 이메일 인증을 해주세요");
			helper.setText("인증번호 : " + secret);
			sender.send(message);
			
			return "redirect:/";
		}

	// 이메일 인증번호 설정
	public String generateSecret() {
		Random r = new Random();
		// Math를 사용해도됨
		int n =r.nextInt(100000); //nextInt MathRandom이랑 똑같이 만들수 있다. 
		// 단, 이렇게 하면 숫자 6자리 중에 앞에 0이 들어가야하는데 0인 안들어간다. 그래서 맨앞에 문자를 사용해줘야하는데 그럴때 Format을 사용
		
		Format f = new DecimalFormat("000000");
		String secret = f.format(n); // 정수를 넣어서 문자로 받아준다.
		
		return secret; // 이 메소드를 호출하면 이렇게 만들어진 문자를 넘겨줌
	}
	
	// 이메일 인증번호 ajax로 인증
	@ResponseBody // ajax로 사용해서 데이터만 받을꺼니까
	@RequestMapping("check")
	public boolean check(String secret, HttpServletRequest request) { // name속성에서 secret 넘김 
											   //request를 쓰는데 아이디가 똑같은지 봐야하기때문에 어쩔수없이 써야한다.
		Cert cert = Cert.builder()
						.who(request.getRemoteAddr())
						.secret(secret)
						.build(); // 객체를 만들어주는 역할
		 // 이걸가지고 이제 DB에가서  똑같은 놈이 썼는지 확인
		
		/*
		boolean result = memberService.validate(cert); // boolean을 받아서 성공/실패만 

			return result;
		*/	
		return memberService.validate(cert);
	
	}
	// 아이디 체크
	@ResponseBody // 데이터를 return 해서 돌려주고 싶을때는 ResponseBody를 쓴다.
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {
		int count = memberService.idCheck(checkId);
		if(count > 0) { // count가 0보다 높으면 이미 존재하는 아아디
			return "NNNNN";
		} else { // 사용가능
			return "NNNNY";
		}
	}
	
	// 아이디 저장 (쿠키)
	@RequestMapping("saveId.me")
	public String saveId(HttpServletResponse response, String memId) {

		Cookie saveId = new Cookie("saveId", memId);
		saveId.setMaxAge(60 * 60 * 24 * 28); 
		response.addCookie(saveId); // response객체에 
		return "member/login"; 
	}
	// 아이디 저장취소 (쿠키)
	@RequestMapping("saveIdDelete.me")
	public String delete(HttpServletResponse response, String memId) {
		// 쿠키는 삭제 명령이 따로 없음
		// 0초로 만료시간을 설정하고 덮어쓰기를 수행
		
		
		Cookie saveId = new Cookie("saveId",memId); //name속성만 같게.
		saveId.setMaxAge(0); // 그냥 쿠키 유효시간 0 으로 하면된다. 이렇게 해서 만료로.
		response.addCookie(saveId);
		
		return "member/login";
	}
	
	
	// 승준 ----- 1:1 문의 부분 -------- 
	
//	// 1:1문의(사용자)
//	@RequestMapping("QAList.me")
//	public String memberQAListView() {
//		return "member/memberQAListView";
//	}
	
	// 1:1 문의 등록
	@RequestMapping("insertQna.me")
	public ModelAndView insertQna(QNA qna, ModelAndView mv, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		qna.setMemNo(memNo);
		
		int result = memberService.insertQna(qna);
		
		if(result > 0) {
			mv.addObject("memNo", memNo);
			session.setAttribute("alertMsg", "1:1문의가 등록되었습니다.");
			mv.setViewName("redirect:selectQna.me");
			
		} else {
			session.setAttribute("alertMsg", "등록이 실패했습니다.");
			mv.setViewName("redirect:selectQna.me");
		}	
		return mv;
	}
	// 1:1 문의 리스트
	@RequestMapping("selectQna.me")
	public ModelAndView selectQna(QNA qna, ModelAndView mv, HttpSession session) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		ArrayList<QNA> list = memberService.selectQna(memNo);
		
		if(list != null) {
			//System.out.println(list);
			mv.addObject("list", list);
		}
			mv.setViewName("member/memberQAListView");
		return mv;
	}
	
	// 1:1 문의 수정
	
	
	// 1:1 문의 삭제
	@ResponseBody
	@RequestMapping("deleteQna.me")
	public int deleteQna(@RequestParam(value="cbox[]")List<String> cbox) {
		return memberService.deleteQna(cbox);
	}
	
	
	/*
	@RequestMapping("deleteQna.me")
	public ModelAndView deleteQna(ModelAndView mv,HttpSession session,int qnaNo) {
		if(memberService.deleteQna(qnaNo) > 0) {
			session.setAttribute("alertMsg", "삭제에 성공 하셨습니다.");
			mv.addObject("redirect:selectQna.me");
		}else {
			session.setAttribute("alertMsg", "삭제에 실패 하셧습니다.");
			mv.addObject("redirect:selectQna.me");
		}
		
		
	return mv;
	}
	*/
	
	// 혜진씨 퐈이팅!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!(당신은 사랑받기위해 태어난사람 당신의 삶속에서 그사랑 받고있지요)-승준-
	// 감솨함닷 승준님도 화이팅!!!!!!!!!!!!!!!!!!!!
	//혜진
	//숙소 예약 정보
	@RequestMapping("accommBook.hj")
	public ModelAndView accommBook(ModelAndView mv, HttpSession session) throws ParseException {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		ArrayList<RoomPayment> list = memberService.accommBook(memNo);
		
        DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        int today = Integer.parseInt(dateFormat.format(new Date()));
 
        
		if(list != null) {
			for(int i=0; i<list.size(); i++) {
				int startDate = Integer.parseInt(list.get(i).getStartDate().replace("-", ""));
				
				if(list.get(i).getStatus().equals("Y")) {
					if(today >= startDate) {
						if(list.get(i).getCount()==0) {
							list.get(i).setStatus("R");
						}else {
							list.get(i).setStatus("S");
						}
					}
				}
			}
			mv.addObject("list", list);
			mv.setViewName("member/accommBook");
		}else {
			mv.addObject("errorMsg", "예약 정보 페이지요청 실패");
			mv.setViewName("common/errorPage");
		}
		
		
		return mv;
	}
	
	//액티비티 구매 정보
	@RequestMapping("activityBook.hj")
	public ModelAndView activityBook(ModelAndView mv, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		ArrayList<TicketPayment> list = memberService.activityBook(memNo);
		
		if(list != null) {
			for(int i=0; i<list.size(); i++) {

				if(list.get(i).getCount()==0) {
							list.get(i).setStatus("R");
				}else {
					list.get(i).setStatus("S");
				}
			}
			mv.addObject("list", list);
			mv.setViewName("member/activityBook");
		}else {
			mv.addObject("errorMsg", "결제 정보 페이지요청 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//숙소 예약 상세 조회
	@RequestMapping("accomBookDetail.hj")
	public ModelAndView accommBookDetail(ModelAndView mv, int orderNo) {
		
		RoomPayment rp = memberService.accommBookDetail(orderNo);
		System.out.println(rp);
		if(rp!=null) {
			
			mv.addObject("list", productService.selectPhotoList(rp.getAccommNo()));
			
			System.out.println( productService.selectPhotoList(rp.getAccommNo()));
			mv.addObject("rp", rp);
			mv.setViewName("member/accomBookDetail");
			
			
		}else {
			mv.addObject("errorMsg", "상세 페이지요청 실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//엑티비티 예약 상세 조회
	@RequestMapping("activityBookDetail.hj")
	public ModelAndView activityBookDetail(ModelAndView mv, int orderNo) {
		
		TicketPayment tp = memberService.activityBookDetail(orderNo);
		
		if(tp!=null) {
			mv.addObject("list", productService.selectActPhotoList(tp.getActivityNo()));
			System.out.println(productService.selectActPhotoList(tp.getActivityNo()));
			mv.addObject("tp", tp);
			mv.setViewName("member/activityBookDetail");
		}else {
			mv.addObject("errorMsg", "상세 페이지요청 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//예약 취소
	@RequestMapping("bookCancel.hj")
	public ModelAndView bookCancel(HttpSession session, ModelAndView mv, int orderNo) {
		
		if(memberService.bookCancel(orderNo)>0) {
			session.setAttribute("alertMsg", "취소에 성공하였습니다.");
			mv.setViewName("redirect:accommBook.hj");
		}else {
			session.setAttribute("alertMsg", "취소에 실패하였습니다.");
			mv.setViewName("redirect:accommBook.hj");
		}
		
		return mv;
	}
	
	
	
	//숙소 후기보기
	@ResponseBody
	@RequestMapping(value="selectAccommReview.hj",produces="application/json; charset=UTF-8")
	public String selectAcommReview(int orderNo) {
		AccommReview review = memberService.selectAcommReview(orderNo);
		System.out.println(review);

		review.setTag(review.getTag().replace(",", "|"));
		
		return new Gson().toJson(review);
	}
	
	//액티비티 후기보기
	@ResponseBody
	@RequestMapping(value="selectActivityReview.hj",produces="application/json; charset=UTF-8")
	public String selectActivityReview(int orderNo) {
		ActivityReview review = memberService.selectActivityReview(orderNo);
		System.out.println(review);

		review.setTag(review.getTag().replace(",", "|"));
		
		return new Gson().toJson(review);
	}
	
	
	//숙소 후기 작성 페이지 
	@RequestMapping("reviewAccommEnrollForm.hj")
	public ModelAndView reviewAccommEnrollForm(ModelAndView mv, int orderNo) {
	
		mv.addObject("orderNo", orderNo);
		mv.setViewName("member/reviewAccommEnrollForm");
		
		return mv;
	}
	
	//액티비티 후기 작성 페이지 
	@RequestMapping("reviewActivityEnrollForm.hj")
	public ModelAndView reviewActivityEnrollForm(ModelAndView mv, int orderNo) {
	
		mv.addObject("orderNo", orderNo);
		mv.setViewName("member/reviewActivityEnrollForm");
		
		return mv;
	}
	
	//후기 작성(숙소)
	@RequestMapping("insertAccommReview.hj")
	public ModelAndView insertAccommReview(ModelAndView mv, AccommReview review, MultipartFile upfile, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		//작성자
		review.setMemNo(memNo);
		
		//태그
		review.setTag(String.join(",",review.getTagArr()));
		
		if(!upfile.getOriginalFilename().equals("")) { 
			
			review.setOriginName(upfile.getOriginalFilename());
			review.setFilePath("/helloing/resources/uploadFiles/"+saveFile(upfile, session));
		}
		
		if(memberService.insertAccommReview(review)>0) {
			mv.setViewName("redirect:accommBook.hj");
			
		}else {
			mv.addObject("errorMsg", "후기등록에 실패했습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
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
	
	
	//후기 삭제(숙소)
	@RequestMapping("deleteAccommReview.hj")
	public ModelAndView deleteAccommReview(ModelAndView mv, AccommReview review, HttpSession session){
		
		if(memberService.deleteAccommReview(review.getReviewNo())>0) {
			 	new File(session.getServletContext().getRealPath(review.getFilePath())).delete();
				session.setAttribute("alertMsg", "삭제에 성공하였습니다.");
				mv.setViewName("redirect:accommBook.hj");
		}else {
			session.setAttribute("alertMsg", "삭제에 실패하였습니다.");
			mv.setViewName("redirect:accommBook.hj");
		}
		return mv;
	}
	
	//////////////////////////////////////
	//후기 작성(액티비티)
	@RequestMapping("insertActivityReview.hj")
	public ModelAndView insertActivityReview(ModelAndView mv, ActivityReview review, MultipartFile upfile, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		//작성자
		review.setMemNo(memNo);
		
		//태그
		review.setTag(String.join(",",review.getTagArr()));
		
		if(!upfile.getOriginalFilename().equals("")) { 
			
			review.setOriginName(upfile.getOriginalFilename());
			review.setFilePath("/helloing/resources/uploadFiles/"+saveFile(upfile, session));
		}
		
		if(memberService.insertActivityReview(review)>0) {
			mv.setViewName("redirect:activityBook.hj");
			
		}else {
			mv.addObject("errorMsg", "후기등록에 실패했습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	//후기 삭제(액티비티)
	@RequestMapping("deleteActivityReview.hj")
	public ModelAndView deleteActivityReview(ModelAndView mv, ActivityReview review, HttpSession session){
		
		if(memberService.deleteActivityReview(review.getReviewNo())>0) {
			 	new File(session.getServletContext().getRealPath(review.getFilePath())).delete();
				session.setAttribute("alertMsg", "삭제에 성공하였습니다.");
				mv.setViewName("redirect:activityBook.hj");
		}else {
			session.setAttribute("alertMsg", "삭제에 실패하였습니다.");
			mv.setViewName("redirect:activityBook.hj");
		}
		return mv;
	}
	
	//회원정보 조회 - 비밀번호 확인
	@RequestMapping("checkPwdForm.hj")
	public String checkPwdForm() {
		return "member/checkPwdForm";
	}
	
	//회원정보 조회 - 수정 페이지
	@RequestMapping("memberUpdateForm.hj")
	public ModelAndView memberUpdateForm(Member m, ModelAndView mv) {
		
		//유저에게 받은 비밀번호(평문)과 DB속 암호문 비교
		if(bcryptPasswordEncoder.matches(m.getMemPwd(), memberService.checkPwd(m))) {
			
			mv.setViewName("member/memberUpdateForm");
		}else {
			mv.addObject("errorMsg", "비밀번호가 일치하지 않습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//회원정보 조회 - 수정:비밀번호 변경
	@RequestMapping("memberUpdatePwd.hj")
	public ModelAndView memberUpdatePwd(Member m, String memNewPwd, HttpSession session, ModelAndView mv) {
		
		//비밀번호 일치하는지 확인
		if(!bcryptPasswordEncoder.matches(m.getMemPwd(), memberService.checkPwd(m))) {
			//비밀번호 불일치
			
			mv.addObject("errorMsg", "비밀번호 불일치");
			mv.setViewName("common/errorPage");
			
		}else {
			//비밀번호 변경
			String encPwd = bcryptPasswordEncoder.encode(memNewPwd);
			m.setMemPwd(encPwd);
			
			if(memberService.memberUpdatePwd(m)>0) {//성공
				
				session.setAttribute("alertMsg", "비밀번호 변경 성공");
				mv.setViewName("redirect:/");
			}else {
				//비밀번호 변경실패
				
				mv.addObject("errorMsg", "비밀번호 변경 실패");
				mv.setViewName("common/errorPage");
			}
		}
		return mv;
	}
	
	//회원정보 수정 - 수정(update)
	@RequestMapping("memberUpdate.hj")
	public ModelAndView memberUpdate(Member m, HttpSession session, ModelAndView mv) {
		
		if(memberService.memberUpdate(m)>0) {
			session.setAttribute("alertMsg", "회원정보 수정 성공");
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("errorMsg", "비밀번호가 일치하지 않습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	//회원탈퇴
	@RequestMapping("deleteMem.hj")
	public ModelAndView deleteMem(HttpSession session, ModelAndView mv) {
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		if(memberService.memberDelete(memNo)>0) {
            session.removeAttribute("loginUser");
            mv.setViewName("redirect:/");
		}else {
            mv.addObject("errorMsg", "회원탈퇴실패");
            mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//찜한 숙소 조회
	@RequestMapping("wishAccommList.hj")
	public ModelAndView wishAccommList(HttpSession session, ModelAndView mv){
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		ArrayList<AccommWish> list = memberService.wishAccommList(memNo);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("member/wishAccommList");
		}else {
			mv.addObject("errorMsg", "찜한 숙소가 없습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//찜한 숙소 삭제
	@RequestMapping("deleteWishAccount.hj")
	public ModelAndView deleteWishAccomm(HttpSession session, AccommWish aw, ModelAndView mv) {
		
		if(memberService.deleteWishAccomm(aw)>0) {
			mv.setViewName("redirect:wishAccommList.hj");
		}else {
			session.setAttribute("alertMsg", "삭제에 실패하였습니다.");
			mv.setViewName("redirect:wishAccommList.hj");
		}
		
		return mv;
	}
	
	//찜한 액티비티 조회
	@RequestMapping("wishActivityList.hj")
	public ModelAndView wishActivityList(HttpSession session, ModelAndView mv) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		ArrayList<ActivityWish> list = memberService.wishActivityList(memNo);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("member/wishActivityList");
		}else {
			mv.addObject("errorMsg", "찜한 숙소가 없습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//찜한 액티비티 삭제 
	@RequestMapping("deleteWishActivity.hj")
	public ModelAndView deleteWishActivity(HttpSession session, ActivityWish aw, ModelAndView mv) {
		if(memberService.deleteWishActivity(aw)>0) {
			mv.setViewName("redirect:wishActivityList.hj");
		}else {
			session.setAttribute("alertMsg", "삭제에 실패하였습니다.");
			mv.setViewName("redirect:wishActivityList.hj");
		}
		
		return mv;
	}
	

	//플래너 메인페이지
	@RequestMapping("plannerMain.hj")
	public ModelAndView plannerList(ModelAndView mv, HttpSession session) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		ArrayList<Planner> list = memberService.plannerList(memNo);
		if(list!=null) {
			mv.addObject("list", list);
			mv.setViewName("member/plannerMain");
			
		}else {
			mv.addObject("errorMsg", "플래너 조회에 실패했습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	//플래너 추가
	@RequestMapping("insertPlanner.hj")
	public ModelAndView insertPlanner(ModelAndView mv, HttpSession session, Planner pl) {
		
		System.out.println(pl);
		
		if(memberService.insertPlanner(pl)>0 && memberService.insertPlannerMem(pl.getMemNo())>0) {
			mv.setViewName("redirect:plannerMain.hj");
		}else {
			session.setAttribute("alertMsg", "일정 추가에 실패하였습니다.");
			mv.setViewName("redirect:plannerMain.hj");
		}
		return mv;
	}
	
	//플래너 수정 전 조회
	@ResponseBody
	@RequestMapping(value="selectPlanner.hj", produces="application/json; charset=UTF-8")
	public String selectPlanner(HttpSession session, int plannerNo) {
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		Planner pl = new Planner();
		pl.setPlannerNo(plannerNo);
		pl.setMemNo(memNo);
		
		Planner planner = memberService.selectPlanner(pl); 
		
		return new Gson().toJson(planner);
	}
	//플래너 수정
	@RequestMapping("updatePlanner.hj")
	public ModelAndView updatePlanner(ModelAndView mv, HttpSession session, Planner pl) {
		
		
		if(memberService.updatePlanner(pl)>0) {
			session.setAttribute("alertMsg", "수정에 성공 하였습니다.");
			mv.setViewName("redirect:plannerMain.hj");
		}else {
			session.setAttribute("alertMsg", "일정 수정에 실패하였습니다.");
			mv.setViewName("redirect:plannerMain.hj");
		}
		
		return mv;
	}
	
	//플래너 삭제
	@RequestMapping("deletePlanner.hj")
	public ModelAndView deletePlanner(ModelAndView mv, HttpSession session, int plannerNo) {
	
		//플래너 번호에 해당하는 플랜 삭제
		
		//case1. 플래너 O 일정 O
		//case2. 플래너 O 일정 X
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		Planner pl = new Planner();
		pl.setMemNo(memNo);
		pl.setPlannerNo(plannerNo);
		
		System.out.println(plannerNo);
		
		//플래너 삭제
			if(memberService.deletePlanMem(pl)>0) {
				if(memberService.selectPlanYN(plannerNo)>0) { //플래너 속 일정이 있을 때, 
					
					if(memberService.deleteInPlan(plannerNo)>0) { //case1 성공
						if(memberService.deletePlanner(plannerNo)>0) { //성공
							session.setAttribute("alertMsg", "삭제에 성공하였습니다.");
						}else {//실패
							session.setAttribute("alertMsg", "플래너 삭제에 실패하였습니다.");
						}
					}else { //실패
						session.setAttribute("alertMsg", "플래너 삭제에 실패하였습니다.");
					}
					
				}else {
					if(memberService.deletePlanner(plannerNo)>0) { //성공
						session.setAttribute("alertMsg", "삭제에 성공하였습니다.");
					}else {//실패
						session.setAttribute("alertMsg", "플래너 삭제에 실패하였습니다.");
					}
				}
			}else {
				session.setAttribute("alertMsg", "플래너 삭제에 실패하였습니다.");
			}
			
			mv.setViewName("redirect:plannerMain.hj");
			
		return mv;
	}
	
	//플랜 상세페이지
	@RequestMapping("planDetailView.hj")
	public ModelAndView planDetailView(int plannerNo, ModelAndView mv, HttpSession session) {
		
		ArrayList<Plan> list = memberService.planDetailView(plannerNo);
		
		int memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		Planner pl = new Planner();
		pl.setPlannerNo(plannerNo);
		pl.setMemNo(memNo);
		
		Planner planner = memberService.selectPlanner(pl); 
		
		
		System.out.println(planner);
		if(list!=null) {
			mv.addObject("pl", planner);
			mv.addObject("list", list);
			mv.setViewName("member/planDetailView");
		}else {
			mv.addObject("errorMsg","상세페이지 조회에 실패했습니다.");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	
	//일행과 함께 여행가기
	@RequestMapping("planAddMem.hj")
	public ModelAndView planAddMem(ModelAndView mv, PlannerMem pm, HttpSession session) {
		
		//조회했을 때 동일한 값이 없을 때만 insert
		if(memberService.planMemSelect(pm)>0) { //동일한 값 O -> 실패
			session.setAttribute("alertMsg", "이미 입력한 일행이 존재합니다.");
			mv.addObject("plannerNo", pm.getPlannerNo());
			mv.setViewName("redirect:planDetailView.hj");
		}else {
				if(memberService.planAddMem(pm)>0) { //동일한 값 X, 추가 성공 -> 성공
					session.setAttribute("alertMsg", "일행 추가에 성공하였습니다.");
					mv.addObject("plannerNo", pm.getPlannerNo());
					mv.setViewName("redirect:planDetailView.hj");
				}else { //insert실패
					session.setAttribute("alertMsg", "일행 추가에 실패하였습니다.");
					mv.addObject("plannerNo", pm.getPlannerNo());
					mv.setViewName("redirect:planDetailView.hj");
				}
		}
		return mv;
	}
	
	//일정 추가
	@RequestMapping("insertPlan.hj")
	public ModelAndView insertPlan(ModelAndView mv, Plan p, HttpSession session) {
		
		if(memberService.insertPlan(p)>0) {
			session.setAttribute("alertMsg", "일정 추가에 성공하였습니다.");
			mv.addObject("plannerNo", p.getPlannerNo());
			mv.setViewName("redirect:planDetailView.hj");
		}else {
			session.setAttribute("alertMsg", "일정 추가에 실패하였습니다.");
			mv.addObject("plannerNo", p.getPlannerNo());
			mv.setViewName("redirect:planDetailView.hj");
		}
		return mv;
	}
	
	//일정 수정 전 조회
	@ResponseBody
	@RequestMapping(value="selectPlan.hj", produces="application/json; charset=UTF-8")
	public String selectPlan(int planNo) {
		
		Plan p = memberService.selectPlan(planNo);
		
		return new Gson().toJson(p);
	}
	
	//일정 수정
	@RequestMapping("updatePlan.hj")
	public ModelAndView updatePlan(Plan p, ModelAndView mv, HttpSession session) {
		
		if(memberService.updatePlan(p)>0) {
			session.setAttribute("alertMsg", "일정 수정에 성공하였습니다.");
			mv.addObject("plannerNo", p.getPlannerNo());
			mv.setViewName("redirect:planDetailView.hj");
		}else {
			session.setAttribute("alertMsg", "일정 수정에 실패하였습니다.");
			mv.addObject("plannerNo", p.getPlannerNo());
			mv.setViewName("redirect:planDetailView.hj");
		}
		
		return mv;
	}
	//일정 삭제
	@RequestMapping("deletePlan.hj")
	public ModelAndView deletePlan(ModelAndView mv, HttpSession session, int planNo, int plannerNo) {

		if(memberService.deletePlan(planNo)>0) {
			session.setAttribute("alertMsg", "일정 삭제에 성공하였습니다.");
			mv.addObject("plannerNo", plannerNo);
			mv.setViewName("redirect:planDetailView.hj");
		}else {
			session.setAttribute("alertMsg", "일정 삭제에 실패하였습니다.");
			mv.addObject("plannerNo", plannerNo);
			mv.setViewName("redirect:planDetailView.hj");
		}
		return mv;
	}
	//가계부 페이지
	@RequestMapping("expenseView.hj")
	public ModelAndView expenseView(ModelAndView mv, int plannerNo) {
		
		ArrayList<Expense> list = memberService.expenseView(plannerNo);
		
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("plannerNo", plannerNo);
			mv.setViewName("member/expenseView");
		}else {
			mv.addObject("errorMsg","가계부 조회에 실패했습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}

	
	//1/n
	@ResponseBody
	@RequestMapping(value="dutchTreat.hj", produces="application/json; charset=UTF-8")
	public String dutchTreat(int plannerNo) {
		
		Expense e = memberService.dutchTreat(plannerNo);
		
		e.setIndividual(e.getAll()/e.getMemCount());
		return new Gson().toJson(e);
	}
	//비용 추가
	@RequestMapping("insertExpense.hj")
	public ModelAndView insertExpense(ModelAndView mv, Expense ex, HttpSession session) {
		
		if( memberService.insertExpense(ex)>0) {
			mv.addObject("plannerNo", ex.getPlannerNo());
			mv.setViewName("redirect:expenseView.hj");
		}else {
			session.setAttribute("alertMsg", "비용추가에 실패하였습니다.");
			mv.addObject("plannerNo", ex.getPlannerNo());
			mv.setViewName("redirect:expenseView.hj");
		}
		 
		return mv;
	}

	//비용삭제
	@RequestMapping("deleteExpense.hj")
	public ModelAndView deleteExpense(ModelAndView mv, Expense ex, HttpSession session) {
		
		System.out.println(ex);
		
		if(memberService.deleteExpense(ex)>0) {
			mv.addObject("plannerNo", ex.getPlannerNo());
			mv.setViewName("redirect:expenseView.hj");
		}else {
			session.setAttribute("alertMsg", "비용삭제에 실패하였습니다.");
			mv.addObject("plannerNo", ex.getPlannerNo());
			mv.setViewName("redirect:expenseView.hj");
		}
		
		return mv;
	}
	
	
	
	
	
	
	
	
	// 액티비티 위시리스트 추가
	@ResponseBody
	@RequestMapping("addActWish")
	public String addActWish(HttpSession session, ActivityWish aw) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			aw.setMemNo(loginUser.getMemNo());
			
			if(memberService.addActWish(aw) > 0) return "success";
			else return "fail";
			
		} else {
			return "login please";
		}
	}
	
	// 액티비티 위시리스트 삭제
	@ResponseBody
	@RequestMapping("removeActWish")
	public String removeActWish(HttpSession session, ActivityWish aw) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			aw.setMemNo(loginUser.getMemNo());
			
			if(memberService.removeActWish(aw) > 0) return "success";
			else return "fail";
		} else {
			return "idk";
		}
	}
	
	// 숙소 위시리스트 추가
	@ResponseBody
	@RequestMapping("addAcWish")
	public String addAcWish(HttpSession session, AccommWish aw) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			aw.setMemNo(loginUser.getMemNo());
			
			if(memberService.addAcWish(aw) > 0) return "success";
			else return "fail";
			
		} else {
			return "login please";
		}
	}
	
	// 액티비티 위시리스트 삭제
	@ResponseBody
	@RequestMapping("removeAcWish")
	public String removeAcWish(HttpSession session, AccommWish aw) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser != null) {
			aw.setMemNo(loginUser.getMemNo());
			
			if(memberService.removeAcWish(aw) > 0) return "success";
			else return "fail";
		} else {
			return "idk";
		}
	}
	
	
}

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
<style>
.inner-box{
	border: 1px solid black;
	width: 550px;
	height: 600px;
}
.terms-content{
	border: 1px solid black;
	width: 400px;
	height: 100px;
	overflow:hidden
}

#js-intro { display:none; position:absolute; z-index:99998; top:0; left:0; background:rgba(0,0,0,0.5); text-align:center; }
#js-intro .inner { display:none; position:relative; z-index:99999; width:400px; height:200px; margin:0 auto; text-align:center; }



.modal_wrap{
	display: none;
	width: 500px;
	position: absolute;
	top:50%;
	left: 50%;
	margin: -250px 0 0 -250px;
	background-color: white;
	z-index: 2;
	padding: 20px;
	border: 1px solid gray;
}
.modal_wrap h3{
	font-size: 30px;
	margin-bottom: 20px;
}
.show{ display: block; }

.termsButton{
	width: 150px;
	height: 50px;
}

.modal_close{
	text-align: right;
	margin: 20px 0px 30px 0px;
}
.modal_close a{
	background-color: #053E99;
	color: white;
	padding: 5px 10px;
}
</style>

</head>
<body>

	<jsp:include page="../common/menubar_user.jsp"/>
	
	<div class="inner" align="center">
	
	<br><br><br><br>
	<h1>이용약관</h1>
	<br><br><br><br>
	
		<div class="inner-box">
		<br><br>
		<div class="main-img" align="center">
			<img src="/helloing/resources/img/logo_outline.png" alt="logo" >
		</div>
		
			<form>
				<pre>이용약관, 개인정보 수집 및 이용, 위치기반서비스 이용약관 모두 동의합니다.</pre>
				<input type="checkbox" id="cbx_chkAll" />모두 동의하기
				
				<br><br><br><br>
				
				<input type="checkbox" name="chk">이용약관 동의(필수)<button type='button' id="modal_btn" onclick="openModal(1)">이용약관 보기</button>
				<div class="black_bg"></div>
				<br><br>
				
				<input type="checkbox" name="chk">개인정보 수집 및 이용(필수)<button type='button' id="modal_btn1" onclick="openModal(2)">개인정보 수집 및 이용약관 보기</button>
				<div class="black_bg1"></div>
				<br><br>
				
				<input type="checkbox" name="chk">위치기반서비스(필수)<button type='button' id="modal_btn2" onclick="openModal(3)">위치기반서비스 이용약관 보기</button>	
				<div class="black_bg2"></div>
				<br><br><br><br>
				<button type="submit" class="termsButton"> 동의하기 </button>
			</form>
		</div>
	</div>	
	
<script>
	// 이용 약관 보기 버튼 클릭 시 해당 모달 띄움
	function openModal(num){
		var modalno = $('.modal_wrap' + num);
		modalno.addClass('show');
	}
	// 닫기 버튼 누르면 모달창 사라짐
	function closeModal(num){
		var modalno = $('.modal_wrap' + num);
		modalno.removeClass('show');
	}
</script>
	

	
	








<div class="modal_wrap modal_wrap1">
	<h3>이용약관 동의</h3>
    <div>
       제1조(목적)
		이 약관은 디멘트회사(전자상거래 사업자)가 운영하는 디멘트 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.
		※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」

		제2조(정의)
		① “몰”이란 디멘트 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
		② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
		③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
		④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
		제3조 (약관 등의 명시와 설명 및 개정)
		① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
		② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회.배송책임.환불조건 등과 같은 중요한 내용
    </div>
	<div class="modal_close"><a onclick="closeModal(1)">close</a></div>
 </div>
 
 <div class="modal_wrap modal_wrap2">
	<h3>개인정보 수집 및 이용</h3>
    <div>
        ■ 개인정보의 수집 및 이용목적
		회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.

		○ 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산
		콘텐츠 제공, 구매 및 요금 결제, 물품배송 또는 청구지 등 발송, 금융거래 본인 인증 및 금융 서비스, 요금추심
		○ 회원 관리
		회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 연령확인, 불만처리 등 민원처리, 고지사항 전달
		○ 마케팅 및 광고에 활용
		신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달, 인구통계학적 특성에 따른 서비스 제공 및 광고 게재, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
		■ 수집하는 개인정보 항목
		회사는 회원가입, 상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.

		○ 수집항목
		[통합 개인/법인소속회원]
		- 이용자의 식별을 위한 필수 정보: 이름, 아이디(ID), 비밀번호
		- 본인확인을 위한 정보: 생년월일, 성별, 휴대전화번호, 이메일, 주소, 연계정보(CI), 중복확인가입정보(DI), 통신사, 아이핀번호(아이핀 본인 인증일 경우), 면허정보, 카드정보, 소속회사명
		- 선택정보: 프로필사진
		[그린카 일반 개인/법인소속회원]
		- 필수정보: 이름, 생년월일, 성별, 비밀번호, 이메일, 휴대전화번호, 주소, 면허정보, 소속회사명
		- 선택정보 : 프로필사진
		[법인관리자]
		- 필수정보 : 법인회원(관리자) - 법인명, 사업자 등록번호, 대표자명, 아이디, 비밀번호, 주소, 담당자명, 담당부서, 이메일, 휴대전화번호
		- 선택정보 : 회사전화번호
    </div>
    <div class="modal_close"><a onclick="closeModal(2)">close</a></div>
 </div>
 
 <div class="modal_wrap modal_wrap3">
	<h3>위치기반 서비스</h3>
    <div>
        위치기반서비스 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 네이버 위치기반 서비스를 이용할 수 있습니다.

		제 1 조 (목적)
		이 약관은 주식회사 (이하 “회사”)가 제공하는 위치기반서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.

		제 2 조 (약관 외 준칙)
		이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.

		제 3 조 (서비스 내용 및 요금)
		① 회사는 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.

		1. GeoTagging 서비스: 게시물 또는 이용자가 저장하는 콘텐츠에 포함된 개인위치정보주체 또는 이동성 있는 기기의 위치정보가 게시물과 함께 저장됩니다. 저장된 위치정보는 별도의 활용없이 보관되거나, 또는 장소를 기반으로 콘텐츠를 분류하거나 검색할 수 있는 기능이 제공될 수도 있습니다.
		2. 위치정보를 활용한 검색결과 및 콘텐츠 제공 : 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과, 주변결과(맛집, 주변업체, 교통수단 등), 번역결과를 제시합니다.
    </div>
    <div class="modal_close"><a onclick="closeModal(3)">close</a></div>
 </div>
 

   
<!-- 
<script>
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
</script>

<script>
    function onClick() {
        document.querySelector('.modal_wrap1').style.display ='block';
        document.querySelector('.black_bg1').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap1').style.display ='none';
        document.querySelector('.black_bg1').style.display ='none';
    }
 
    document.getElementById('modal_btn1').addEventListener('click', onClick);
    document.querySelector('.modal_close1').addEventListener('click', offClick);
</script>

<script>
    function onClick() {
        document.querySelector('.modal_wrap2').style.display ='block';
        document.querySelector('.black_bg2').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap2').style.display ='none';
        document.querySelector('.black_bg2').style.display ='none';
    }
 
    document.getElementById('modal_btn2').addEventListener('click', onClick);
    document.querySelector('.modal_close2').addEventListener('click', offClick);
</script>

 -->


	<script>
		$(document).ready(function() {
			$("#cbx_chkAll").click(function() {
				if($("#cbx_chkAll").is(":checked")) $("input[name=chk]").prop("checked", true);
				else $("input[name=chk]").prop("checked", false);
			});
			
			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;
				
				if(total != checked) $("#cbx_chkAll").prop("checked", false);
				else $("#cbx_chkAll").prop("checked", true); 
			});
		});
	</script>
	
</body>
</html>
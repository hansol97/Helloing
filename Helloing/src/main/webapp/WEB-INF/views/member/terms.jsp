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
        height: 500px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
    }
.black_bg{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    .modal_wrap1{
        display: none;
        width: 500px;
        height: 500px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
    }
.black_bg1{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
    }
    
.modal_wrap2{
        display: none;
        width: 500px;
        height: 500px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
    }
.black_bg2{
        display: none;
        position: absolute;
        content: "";
        width: 100%;
        height: 100%;
        background-color:rgba(0, 0,0, 0.5);
        top:0;
        left: 0;
        z-index: 1;
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
				
				<input type="checkbox" name="chk">이용약관 동의(필수)<button type='button' id="modal_btn">이용약관 보기</button>
				
				<div class="black_bg"></div>
				<br>
				<pre>개인정보 수집 및 이용을 동의합니다.</pre>
				<input type="checkbox" name="chk">체크 2
				<br>
				<pre>위치기반서비스를 동의합니다.</pre>
				<input type="checkbox" name="chk">체크 3	
			</form>
		</div>
	</div>	
	

	

	
	


<button type='button' id="modal_btn1">모달창아 나와랏</button>
<div class="black_bg1"></div>
<button type='button' id="modal_btn2">모달창아 나와랏</button>
<div class="black_bg2"></div>


<div class="modal_wrap">
    <div class="modal_close"><a href="#">close</a></div>
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
② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다
    </div>
 </div>
 
 <div class="modal_wrap1">
    <div class="modal_close1"><a href="#">close</a></div>
    <div>
        모달창 내용
    </div>
 </div>
 
 <div class="modal_wrap2">
    <div class="modal_close2"><a href="#">close</a></div>
    <div>
        모달창 내용
    </div>
 </div>
 

   

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
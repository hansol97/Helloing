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
			<form>
				<pre>이용약관, 개인정보 수집 및 이용, 위치기반서비스 이용약관 모두 동의합니다.</pre>
				<input type="checkbox" id="cbx_chkAll" />모두 동의하기
				
				<br><br><br><br>
				<pre>이용약관을 동의합니다.</pre>
				<input type="checkbox" name="chk">체크 1
				<div class="terms-content">
					<p>제1조(목적)
					이 약관은 디멘트회사(전자상거래 사업자)가 운영하는 디멘트 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.
					※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」
					
					제2조(정의)
					① “몰”이란 디멘트 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
					② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
					③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.
					④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
					</p>
				</div>
				<br>
				<pre>개인정보 수집 및 이용을 동의합니다.</pre>
				<input type="checkbox" name="chk">체크 2
				<br>
				<pre>위치기반서비스를 동의합니다.</pre>
				<input type="checkbox" name="chk">체크 3	
			</form>
		</div>
	</div>
	<script></script>
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
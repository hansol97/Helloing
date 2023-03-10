<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 파트너 등록</title>
<style>
#enroll-form table {
	border-collapse: separate;
	border-spacing: 10px 30px;
}

#enroll-form input {
	height: 25px;
}

.join-button {
	width: 200px;
	height: 40px;
	font-weight: bold;
	color: white;
	background-color: #053E99;
	border: 0;
	border-radius: 3px;
}

button:hover {

	cursor: pointer;
}

#btn-address {
	height: 30px;
}

.hold-form {
	color: #053E99;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar_user.jsp" />

	<div class="inner" align="center">	
		<br><br><br><br>
		<h1>기업 파트너 등록</h1>
		<br><br>
		
		<div class="enroll-form">
			<form action="insertCompany.hj" method="post" id="enroll-form">
				<table>
					<tr>
						<td>파트너 이름 &nbsp;&nbsp;</td>
						<td><input type="text" name="memName" maxlength="20"
							class="hold-form" readonly value=${ loginUser.memName }></td>
						<td id="checkId" width="80"></td>
					</tr>
					<tr>
						<td>전화번호 &nbsp;&nbsp;</td>
						<td><input type="text" name="phone" maxlength="20"
							class="hold-form" readonly value=${ loginUser.phone }></td>
					</tr>
					<tr>
						<td>사업장명 &nbsp;&nbsp;</td>
						<td><input type="text" name="businessName" required></td>
					</tr>
					<tr>
						<td>사업자번호 &nbsp;&nbsp;</td>
						<td><input type="text" name="businessNo" id="businessNo" placeholder="(-)없이 번호만 입력해주세요" required>
						<div id="businessNoCheck" width="80" style="font-size:0.7em; display:none;" ></div>
						</td>
					</tr>
					<tr>
						<td>사업자주소 &nbsp;&nbsp;</td><input type="hidden" id="address" name="address">
						<td>
						<input type="text" id="sample6_postcode" placeholder="우편번호">
						<br>
						<input type="text" id="sample6_address" placeholder="주소">
						<br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소">
						<br>
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</td>
					</tr>

				</table>
				<button type="submit" id="btn-submit" disabled class="join-button">파트너 등록</button>
			</form>

		</div>
	</div>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
	</script>
	<script>
		var query = ''; // 주소
		var themeObj = {
			bgColor : "#FFFB22",//바탕 배경색	
			searchBgColor : "#FFFB07" //검색창 배경색
		};

		function sample6_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}

							} else {
								document.getElementById("sample6_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample6_postcode').value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("sample6_detailAddress")
									.focus();
						}
					}).open();
		}
		$('#sample6_detailAddress').focusout(function(){
			var fullAddress =  $('#sample6_address').val() + " " + $('#sample6_detailAddress').val() 
			$("#address").val(fullAddress);
		});
	</script>
	
	<!-- 비즈니스 중복체크 -->
	<script>
	$(function(){
		
		let $busNoInput = $('#enroll-form #businessNo');

		// 제이쿼리를 사용할때는 맞춰준다. 제이퀄리를 사용해서 변수를 사용하면 자바스크립트에서 못쓸때가 있다. 
			
		// 사용자가 input태그에 뭐 쓸때 이벤트가 생긴다.
		$busNoInput.keyup(function(){
			//console.log($idInput.val());
			
			// 최소 다섯글자 이상으로 입력할때만 ajax요청
			if($busNoInput.val().length >= 10){
				//중복체크 요청
				$.ajax({
					url : 'busNoCheck.sj',
					data : {checkBusNo : $busNoInput.val()},// // 객체를 만들어서 객체의 속성명으로 넣는 과정.
					success : function(result){ //성공했을때 돌아오는 매개변수로 넣는다 result
						console.log(result);
						
						if(result == 'NNNNNNNNNN'){
							$('#businessNoCheck').show();
							$('#businessNoCheck').css('color', 'red').text('중복된 사업자번호가가 존재합니다.');
							$('#btn-submit').attr('disabled', true);
							$('#btn-submit').css('background-color', 'lightgray');	
						}
						else{
							$('#businessNoCheck').show();
							$('#businessNoCheck').css('color', 'blue').text('사용가능한 사업자번호입니다.')
							$('#btn-submit').attr('disabled', false);
							$('#btn-submit').css('background-color', '#053E99');
						}

					},
					error : function(){
						console.log("사업자번호 중복체크 실패");
					}
				});
			} 
			else { // 5글자를 쓰거 지웠는데 버튼이 활성화 될수 있기때문에 막는다.
				$('#businessNoCheck').hide();
				$('#btn-submit').attr('disabled', true);
			}
		})
	})
	
	</script>


</body>
</html>
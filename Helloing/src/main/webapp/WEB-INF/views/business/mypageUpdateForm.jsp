<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.business-info{ text-align: center; }
.business-info h1{ font-size: 35px; font-weight: bold; margin-bottom: 60px; }
.business-info table{ 
	margin: auto; 
	text-align: left; 
	font-size: 20px;
	margin-bottom: 60px;
}
.business-info table th, .business-info table td{
	padding: 10px 20px;
}
.business-info button{
	font-size: 20px;
	font-weight: bold;
	padding: 10px 20px;
	background-color: #053E99;
	color: white;
	border: 0;
	border-radius: 3px;
	margin: 0px 20px;
}
.business-info table input{
	width: 100%;
	height: 25px;
}
#btn-cancle{
	background-color: lightgray;
	color: gray;
}
</style>
</head>
<body>
	<jsp:include page="menubar_business.jsp"/>
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
			
			<form id="update-form" action="updateMember.bu" method="post">
				<div class="business-info">
					<table>
						<tr>
							<th>사업자명</th>
							<td>${loginCompany.businessName}</td>
						</tr>
						<tr>
							<th>사업자 번호</th>
							<td>${loginCompany.businessNo}</td>
						</tr>
						<tr>
						<tr>
							<th>주소</th>
							<td>${loginCompany.address}</td>
						</tr>
						<tr>
							<td> &nbsp;&nbsp;</td><input type="hidden" id="address" name="address">
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
					
		
					<button type="button" id="btn-cancle">취소</button>
					<button>저장</button>
				</div>
			</form>
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소등록페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/accommList.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
    
</style>


</head>
<body>
    <jsp:include page="menubar_business.jsp"/>

    
    <div class="container-fluid px-lg-5 body">
        <div class="row justify-content-center">
          <br><br><br>
          <div class="accommTitle">숙소 등록 페이지</div>
          
        <!--등록 폼 박스-->
          <div class="fatherEnrollForm">
            <div class="blog-card enrollform" >
			<form action="insertAccom.bu" method="post" enctype="multipart/form-data" class="innerform">
			<!-- 피드 등록 내용물 -->
			<div style="font-size: 30px; display:inline; text-align: center; margin-left: 8%;"> <br><br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;👉당신의 👍멋진 🛖숙소를 🕵️‍♀️등록해 😋주세요!❤️ </div>
				<table class="accommFormTable" cellpadding="10" cellspacing="10" style="width: 100%; margin-top: 50px; text-align: left;"  >
					<tr>
						<th width="200px" height="40px"> 숙소 이름 :</th>
						<td width="400px">
							<input id="amName" type="text" name="accommName" height="100px" size="40" required placeholder="아무튼 입력"/>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">숙소 주소 :</th>
						<td>
							<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기 클릭 🏠" class="button button--ujarak button--round-s"><br><br>
							<input type="text" id="sample6_address" placeholder="주소" required>&nbsp;
							<input type="text" id="sample6_detailAddress" placeholder="상세주소" required>
							<input type="text" id="sample6_postcode" placeholder="우편번호">
							<input type="hidden" id="LAT" name="LAT" placeholder="위도" value="">
							<input type="hidden" id="LNG" name="LNG" placeholder="경도" value="">
							<input type="hidden" class="hidden" name="businessNo" value="${sessionScope.loginCompany.businessNo}"/><!-- 사업자번호 히든 -->
							<input type="hidden" name="address" id="" value=""> <!-- 제이쿼리로 합친 주소+상세주소 를 밸류에 -->
							<script>
								var query = ''; // 주소
								var themeObj = {
									bgColor: "#FFFB22",//바탕 배경색	
									searchBgColor: "#FFFB07" //검색창 배경색
								};

								function sample6_execDaumPostcode() {
									new daum.Postcode({
										// 테마
										theme: themeObj,
										oncomplete: function(data) {

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
											if(data.userSelectedType === 'R'){
												// 법정동명이 있을 경우 추가한다. (법정리는 제외)
												// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
												if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
													extraAddr += data.bname;
												}
												// 건물명이 있고, 공동주택일 경우 추가한다.
												if(data.buildingName !== '' && data.apartment === 'Y'){
													extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
												}
											
											} else {
												document.getElementById("sample6_extraAddress").value = '';
											}
							
											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											document.getElementById('sample6_postcode').value = data.zonecode;
											document.getElementById("sample6_address").value = addr;
											// 커서를 상세주소 필드로 이동한다.
											document.getElementById("sample6_detailAddress").focus();
										}
									}).open();
								}

								$(function(){
									// 주소인풋 밸류가 변경되면 (주소가 입력되면) 위도경도찾아 넣기
									$('#sample6_detailAddress').on('focus', function(){
										address = $('#sample6_address').val(); 
										// console.log('주소(address) : ' + address);
										$.ajax({
											url : 'getGeocode.etc',
											data : {address : address},
											success : result => {
												// console.log(result);
												// console.log('위도' + result.documents[0].x);
												// console.log('경도' + result.documents[0].y);
												$('#LAT').val(result.documents[0].x);
												$('#LNG').val(result.documents[0].y);

											},
											error : () =>{
												console.log('Error occurred');
											}
										});
									});
								});
							
							</script>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">숙소 설명 :</th>
						<td height="40px">
							<textarea name="accommContent" rows="10" style="resize: none; width: 70%;" required placeholder="아무튼 입력" required></textarea>
						</td>
					</tr>

					<tr>
						<th>등급 선택 :</th>
						<td>
							<select name="grade" id="rating" required> 
								<option value='1'>1 등급</option>
								<option value='2'>2 등급</option>
								<option value='3'>3 등급</option>
								<option value='4'>4 등급</option>
								<option value='5'>5 등급</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<th>카테고리 :</th>
						<td>
							<select name="category" id="category" required> 
								<option value='hotel'>호텔</option>
								<option value='pension'>펜션</option>
								<option value='motel'>모텔</option>
								<option value='house'>민박</option>
								<option value='guestHouse'>게스트하우스</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>체크인 / 체크아웃 시간 : </th>
						<td>
							<input type="time" name="checkIn" id="checkIn" required/>&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
							<input type="time" name="checkOut" id="checkOut" required/>
							<script>
								$(function(){
									$('#checkOut').focusout(function(){
										var chekInout =  $('#checkOut').val() + " / " + $('#checkIn').val() 
										$("input[name=checkInout]").val(chekInout);
									});
									$('#sample6_detailAddress').focusout(function(){
										var fullAddress =  $('#sample6_address').val() + " " + $('#sample6_detailAddress').val() 
										$("#address").val(fullAddress);
									});

								})
							</script>
							<input type="hidden" name="checkInout">
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">환불 규정 : </th>
						<td>
							<textarea name="refund" rows="5" style="resize: none; width: 70%;" required placeholder="아무튼 입력"></textarea>
						</td>
					</tr>


				</table>
					<div class="titleImg_class1" style="margin-left: 15px;">
						<br><br><p>🎈 숙소의 외관이나 부대시설 사진을 등록해 주세요</p>	<br><br>
						<input type="file" name="accommPhoto1" required/><br><br>
						<input type="file" name="accommPhoto2" /><br><br>
						<input type="file" name="accommPhoto3" /><br><br><br><br>
					</div>

			<div class="feed_modal_btns" align="center">
				<br>
				<button type="submit" class="button--ujarak button" id="red_btn2"> 등록 </button>
				<button type="reset" class="button--ujarak button">초기화</button>
				<button type="reset" class="button--ujarak button">취소하기</button>

			</div>
			</form>


			</div>

		</div>
		  <!-- 등록 폼 박스 끝 -->
       
      
    </div>
  </div>
  </div>




</body>
</html>
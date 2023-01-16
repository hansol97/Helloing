<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>
<link href="resources/css/product/accommReserve.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/>

    <div style="height: 70px;"></div>

	<div class="inner">
	
		<p id="title">예약하기</p>

		<form action="pay.accomm" method="POST">
			<div class="content">
				<div class="main">
					<p class="sub-title">상품 정보</p>
					<hr>
				
					<div class="accomm-info">
						<img src="${ rp.attachment }" width="180">
						<p><span id="acInfo">${ rp.accName }</span><br>
							${ rp.startDate } ${ rp.checkIn } ~ ${ rp.endDate } ${ rp.checkOut }, <span id="day">${ rp.day }</span>박</p>
					</div>
					<div class="room-info">
						<span>${ rp.roomName }</span>
						<span id="price">${ rp.price }원</span>
					</div>
					<div class="price-info">
						<span>총 상품 금액</span>
						<span class="price total-price"></span>
					</div>
	
					<p class="sub-title">예약자 정보</p>
					<hr>
	
					<div>
						<table>
							<tr>
								<td width="120">예약자 이름</td>
								<td width="500" class="user-info" id="bookName">${ loginUser.memName }</td>
							</tr>
							<tr>
								<td>이메일 주소</td>
								<td class="user-info" id="bookEmail">${ loginUser.email }</td>
								<td rowspan="3"><button type="button" id="btn-info" onclick="openModal()">정보변경</button></td>
							</tr>
							<tr>
								<td>휴대전화 번호</td>
								<td class="user-info" id="bookPhone">${ loginUser.phone }</td>
							</tr>
						</table>
					</div>
				</div>
	
				<div class="side-bar">
					<div class="pay-info">
						<p class="sub-title">결제 정보</p>
						<hr>
	
						<div class="order-price">
							<span>총 결제 금액</span>
							<span class="total-price"></span>
						</div>
	
						<div class="check">
							<p class="sub-title">약관 안내</p>
							<hr>
	
							<input type="checkbox"> 개인정보 제공 동의 (필수)<br>
							<input type="checkbox"> 개인정보 제공 동의 (필수)<br>
							<input type="checkbox"> 개인정보 제공 동의 (필수)<br>
						</div>
						<label id="check">&nbsp;</label>
						<button type="button" id="btn-pay" onclick="check();">683,211원 결제하기</button>
					</div>
				</div>
			</div>
			<div id="info">
				<input type="hidden" name="startDate" value="${ rp.startDate }">
				<input type="hidden" name="endDate" value="${ rp.endDate }">
				<input type="hidden" name="headCount" value="${ rp.headCount }">
				<input type="hidden" name="accommNo" value="${ rp.accommNo }">
				<input type="hidden" name="roomNo" value="${ rp.roomNo }">
			</div>
		</form>

		<div class="modal">
			<h3>예약자 정보 변경</h3>
			<div>
				<table>
					<tr>
						<th>예약자 이름</th>
						<td><input type="text" name="newName"></td>
					</tr>
					<tr>
						<th>이메일 주소</th>
						<td><input type="text" name="newEmail"></td>
					</tr>
					<tr>
						<th>휴대전화 번호</th>
						<td><input type="text" name="newPhone"></td>
					</tr>
				</table>
			</div>
			<div class="modal_update"><a onclick="closeModal();">수정</a></div>
		</div>
		
	</div>
	
	<script type="text/javascript" src="resources/js/product/accommReserve.js"></script>
</body>
</html>
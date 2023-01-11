<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>
<link href="resources/css/product/activityReserve.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/>

    <div style="height: 70px;"></div>

	<div class="inner">
	
		<p id="title">예약하기</p>

		<form action="pay.ticket" method="">
			<div class="content">
				<div class="main">
					<p class="sub-title">상품 정보</p>
					<hr>
					
					<div class="accomm-info">
						<img src="/helloing/resources/img/logo_outline.png" width="180">
						<p><span>${ act.activityName }</span><br>
							~ ${ act.endDate } 까지</p>
					</div>
					<c:forEach items="${ ticketList }" var="t">
						<div class="room-info">
							<input type="hidden" name="ticketNo" value="${ t.ticketNo }">
							<input type="hidden" name="count" value="${ t.count }">
							<span>${ t.ticketName }</span>
							<span>${ t.ticketPrice }원 X ${ t.count } &nbsp; ${ t.ticketSum }원</span>
						</div>
					</c:forEach>
					
					<div id="hidden"></div>
					
					
					<div class="price-info">
						<span>총 상품 금액</span>
						<span class="price">${ act.allSum }원</span>
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
							<span>${ act.allSum }원</span>
						</div>
	
						<div class="check">
							<p class="sub-title">약관 안내</p>
							<hr>
	
							<input type="checkbox"> 개인정보 제공 동의 (필수)<br>
							<input type="checkbox"> 개인정보 제공 동의 (필수)<br>
							<input type="checkbox"> 개인정보 제공 동의 (필수)<br>
						</div>

						<label id="check">&nbsp;</label>
						<button type="button" id="btn-pay" onclick="check();">${ act.allSum }원 결제하기</button>
					</div>
				</div>
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

	<script type="text/javascript" src="resources/js/product/activityReserve.js"></script>
</body>
</html>
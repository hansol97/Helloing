<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>

<link href="resources/css/product/accommDetail.css" rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/>
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
		<div class="middle-content">
			<div class="main">
				<div class="top-info">
					<input name="accommNo" value="${ ac.accommNo }" type="hidden">
					<sapn class="accommName" name="accName">${ ac.accommName }</sapn>
					<button>🗺️ 위치보기</button>
				</div>
				<div>
					<p onclick="selectReview();" >${ ac.grade }성급<br>
						⭐⭐⭐⭐⭐ ${ ac.avg } (${ ac.reviewCount }) ∨</p> <!-- 클릭 시 후기 div로 이동 -->
				</div>
				<hr>
				<div class="middle-info">
					<div>📌 ${ ac.address }</div>
					<div>🕒 체크인 <span id="checkIn">${ ac.checkIn }</span> ~ 체크아웃 <span id="checkOut">${ ac.checkOut }</span></div>
				</div>
				<hr>

				<div class="images"> <!-- 이미지 클릭 시 모달창?으로 이미지 크게 띄우기 -->
					<img id="attachment"  src="${ photo[0] }" width="780" height="500">
					<div class="sub-images">
						<c:forEach items="${ photo }" var="p" begin="1" varStatus="status">
							<img src="${ photo[status.index] }" width="250" height="160">
						</c:forEach>
					</div>
				</div>

			
				<div class="selectoption">
					<table class="researchtable">
						<tr>
							<td width="250">체크인 날짜</td>
							<td width="250">체크아웃 날짜</td>
							<td width="200">인원</td>
						</tr>
						<tr>
							<td><input type="date" id="startDate"></td>
							<td><input type="date" id="endDate"></td>
							<td>
								<select name="headCount"> <!-- 숙소별 최대 인원 자바스크립트로 뿌려주기 -->
									<option>2명</option>
									<option>3명</option>
									<option>4명</option>
									<option>5명</option>
									<option>6명</option>
									<option>7명</option>
								</select>
							</td>
							<td><button type="button">재검색</button></td> <!-- 에이잭스로 실행... 어떻게 만들지.. 아휴 -->
						</tr>
					</table>
				</div>

				<div>
					<c:forEach items="${ roomList }" var="r" varStatus="status">
						<form action="reserve.accomm" method="POST">
							<div class="accommbox">
								<input type="hidden" name="roomNo" value="${ r.roomNo }">
								<input type="hidden" name="price" value="${ r.price }">
								<div class="first">
									<img src="/helloing/resources/img/logo_outline.png" width="250" height="160">
									<input type="hidden" name="roomName" value="${ r.roomName }">
									<p><span name="roomName">${ r.roomName }</span><br>
										최대 ${ r.capacity }인</p>
								</div>
								<hr>
								<div class="second">
									<h1>${ status.count } ${ r.roomName } <br>
										${ r.price } 원</h1>
									<button class="btn-reserve">예약</button>
								</div>
								<div id="info">

								</div>
							</div>
						</form>
					</c:forEach>
				</div>

				<hr>

				<div class="explanation">
					<table>
						<tr>
							<td class="title" width="100">소개</td>
							<td>${ ac.accommContent }</td>
						</tr>
						<tr>
							<td class="title">환불규정</td>
							<td>${ ac.refund }</td>
						</tr>
					</table>
				</div>
				<hr>

				<div>
					<h3 class="reviewtitle">후기 ${ ac.reviewCount }</h3>
					<div class="reviewstar">
						<div>
							<p><span>${ ac.avg }</span><br>
							⭐⭐⭐⭐⭐</p>
						</div>
						<div class="starlist">
							<table>
								<tr>
									<td align="right">⭐⭐⭐⭐⭐ </td>
									<td width="200"><progress value="${ ac.star5 }" max="${ fn:length(acReviewList) }"></progress></td>
									<td>${ ac.star5 } 명</td>
								</tr>
								<tr>
									<td align="right">⭐⭐⭐⭐ </td>
									<td><progress value="${ ac.star4 }" max="${ fn:length(acReviewList) }"></progress></td>
									<td>${ ac.star4 } 명</td>
								</tr>
								<tr>
									<td align="right">⭐⭐⭐ </td>
									<td><progress value="${ ac.star3 }" max="${ fn:length(acReviewList) }"></progress></td>
									<td>${ ac.star3 } 명</td>
								</tr>
								<tr>
									<td align="right">⭐⭐ </td>
									<td><progress value="${ ac.star2 }" max="${ fn:length(acReviewList) }"></progress></td>
									<td>${ ac.star2 } 명</td>
								</tr>
								<tr>
									<td align="right">⭐ </td>
									<td><progress value="${ ac.star1 }" max="${ fn:length(acReviewList) }"></progress></td>
									<td>${ ac.star1 } 명</td>
								</tr>
							</table>
						</div>
					</div>

					<%--
					<div class="radio-sort">
						<input type="radio" name="radio-sort" id="recomm"><label for="recomm">추천순</label>
						<input type="radio" name="radio-sort" id="manyreview"><label for="manyreview">많은 후기순</label>
						<input type="radio" name="radio-sort" id="highstar"><label for="highstar">높은 평점순</label>
						<input type="radio" name="radio-sort" id="lowprice"><label for="lowprice">낮은 가격순</label>
						<input type="radio" name="radio-sort" id="highprice"><label for="highprice">높은 가격순</label>
					</div>
					 --%>
					
					<div><!-- 리뷰 포문 돌리기 -->
						<c:forEach items="${ acReviewList }" var="ar">
							<div class="reviewbox">
								<div>
									<p> ${ ar.memName } | <c:forEach var="i" begin="1" end="${ ar.star }">⭐</c:forEach><br>
										${ ar.createDate } | ${ ar.roomName }</p>
									<p class="review-content">
										${ ar.reviewContent }
									</p>
									<span class="tag">객실이 깨끗해요</span><span class="tag">친절해요</span>
								</div>
								<div><img src="/helloing/resources/img/logo_outline.png" width="250" height="160"></div>
							</div>
							<hr>
						</c:forEach>
					</div>

					<%--
					<div class="page-bar"><!-- 페이징바 리뷰는 3개씩 보여줄거다 -->
						<ul>
		                    <li><a href="">&lt;</a></li>
							<li><a href="">1</a></li>
							<li><a href="">2</a></li>
							<li><a href="">3</a></li>
							<li><a href="">4</a></li>
							<li><a href="">5</a></li>
		                    <li><a href="">&gt;</a></li>
                		</ul>
					</div>
					 --%>
				</div>

			</div>

			<div class="side-bar">
				<div class="accommselectbox">
					<p>1박 <span>${ ac.rowPrice }원 ~</span></p>
					<button onclick="selectRoom();">객실 선택하기</button> <!-- 버튼 누르면 객실 선택하는 div로 이동 -->
					<div>
						<c:choose>
							<c:when test="${ checkWish eq null }">
								<input type="hidden" name="checkWish" value="none">
							</c:when>
							<c:otherwise>
								<input type="hidden" name="checkWish" value="${ checkWish.wishDate }">
							</c:otherwise>
						</c:choose>
					
						<div id="btn-add">
							<button id="btn-addwish" onclick="addWish();">♥️ 위시리스트에 담기</button>
						</div>
						<div id="btn-rev" style="display: none;">
							<button id="btn-removewish" onclick="removeWish();">♥️😘♥️</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="height: 300px;"></div>
	
	<script type="text/javascript" src="resources/js/product/accommDetail.js"></script>
</body>
</html>
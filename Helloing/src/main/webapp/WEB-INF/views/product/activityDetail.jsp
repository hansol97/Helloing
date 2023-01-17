<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>
<link href="resources/css/product/activityDetail.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="../common/menubar_user.jsp"/>
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
		<div class="middle-content">
			<div class="main">

				<div class="top-info">
					<sapn class="acticityName">${ act.activityName }</sapn>
					<input type="hidden" name="activityNo" value="${ act.activityNo}">
				</div>
				<div>
					<p onclick="selectReview();">⭐⭐⭐⭐⭐ ${ act.avg } (${ fn:length(actReviewList) }) ∨</p> <!-- 클릭 시 후기 div로 이동 -->
				</div>
				<hr>

				<div class="images"> <!-- 이미지 클릭 시 모달창?으로 이미지 크게 띄우기 -->
					<img src="/helloing/resources/img/logo_outline.png" width="780" height="500">
					<div class="sub-images">
						<img src="/helloing/resources/img/logo_outline.png" width="250" height="160">
						<img src="/helloing/resources/img/logo_outline.png" width="250" height="160">
						<img src="/helloing/resources/img/logo_outline.png" width="250" height="160">
					</div>
				</div>

				<div>
					<form action="reserve.activity" method="post">
						<input type="hidden" name="activityName" value="${ act.activityName }">
						<input type="hidden" name="endDate" value="${ act.endDate }">
						<input type="hidden" name="allSum">
						<div class="ticketlist"><!-- 티켓 박스 div 포문 돌리기~ -->
							<c:forEach items="${ ticketList }" var="t">
								<div class="ticketbox">
									<div class="ticket-info">
										<p><span class="ticketName">${ t.ticketName }</span><br>
											${ t.startDate } ~ <span id="endDate">${ t.endDate }</span></p>
										<input type="hidden" name="ticketNo" value="${ t.ticketNo}">
									</div>
									<div class="ticket-price">
										<span>${ t.price }원</span>
									</div>
									<div class="ticket-count">
										<button class="btn-minus" type="button">-</button>
										<span class="count">0</span>
										<button class="btn-plus" type="button">+</button>
									</div>
								</div>
							</c:forEach>
							<!-- 
								<div class="ticketbox">
									<div class="ticket-info">
										<p><span class="ticketName">종일 종합이용권 1인</span><br>
											* 주중/주말 공통<br>
											* 롯데월드파크 + 민속박물관 모두 이용가능</p>
									</div>
									<div class="ticket-price">
										<span>38,600원</span>
									</div>
									<div class="ticket-count">
										<button class="btn-minus" type="button">-</button>
										<span class="count">0</span>
										<button class="btn-plus" type="button">+</button>
									</div>
								</div>
							 -->
							<div class="order-info"> <!-- 자바스크립트로 쿠폰 수량을 늘렸을때만 아래 코드 나오기 -->
								
							</div>
							<hr>
							<div class="all-price">

							</div>
						</div>
						<div id="btn-pay">
							<button>결제하기</button>
						</div>
					</form>
				</div>

				<hr>

				<div class="explanation">
					<div class="title"><span>소개</span></div>
					<div><p>${ act.activityContent }</p></div>
				</div>
				<hr>

				<div class="explanation">
					<div class="title"><span>이용안내</span></div>
					<div><p>무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을</p></div>
				</div>
				<hr>

				<div>
					<h3 class="reviewtitle">후기 ${ fn:length(actReviewList) }</h3>
					<div class="reviewstar">
						<div>
							<p><span>${ act.avg }</span><br>
								⭐⭐⭐⭐⭐</p>
						</div>
						<div class="starlist">
							<table>
								<tr>
									<td align="right">⭐⭐⭐⭐⭐ </td>
									<td width="200"><progress value="${ act.star5 }" max="${ fn:length(actReviewList) }"></progress></td>
									<td>${ act.star5 } 명</td>
								</tr>
								<tr>
									<td align="right">⭐⭐⭐⭐ </td>
									<td><progress value="${ act.star4 }" max="${ fn:length(actReviewList) }"></progress></td>
									<td>${ act.star4 } 명</td>
								</tr>
								<tr>
									<td align="right">⭐⭐⭐ </td>
									<td><progress value="${ act.star3 }" max="${ fn:length(actReviewList) }"></progress></td>
									<td>${ act.star3 } 명</td>
								</tr>
								<tr>
									<td align="right">⭐⭐ </td>
									<td><progress value="${ act.star2 }" max="${ fn:length(actReviewList) }"></progress></td>
									<td>${ act.star2 } 명</td>
								</tr>
								<tr>
									<td align="right">⭐ </td>
									<td><progress value="${ act.star1 }" max="${ fn:length(actReviewList) }"></progress></td>
									<td>${ act.star1 } 명</td>
								</tr>
							</table>
						</div>
					</div>

					<!-- 
					<div class="radio-sort">
						<input type="radio" name="radio-sort" id="recomm"><label for="recomm">추천순</label>
						<input type="radio" name="radio-sort" id="manyreview"><label for="manyreview">많은 후기순</label>
						<input type="radio" name="radio-sort" id="highstar"><label for="highstar">높은 평점순</label>
						<input type="radio" name="radio-sort" id="lowprice"><label for="lowprice">낮은 가격순</label>
						<input type="radio" name="radio-sort" id="highprice"><label for="highprice">높은 가격순</label>
					</div>
					-->
					
					<div><!-- 리뷰 포문 돌리기 -->
						<c:forEach items="${ actReviewList }" var="a">
							<div class="reviewbox">
								<p>
									${  a.memName } | <c:forEach var="i" begin="1" end="${ a.star }">⭐</c:forEach><br>
									${ a.createDate} | ${ a.ticketName }</p>
								<p class="review-content">${ a.reviewContent }</p>
							</div>
							<hr>
						</c:forEach>
					</div>

					<%-- 
					<div class="page-bar"><!-- 페이징바 리뷰는 5개씩 보여줄거다 --> 귀찮아서 안하기로 함~
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
					<p><span>${ act.rowPrice }원부터 ~</span></p>
					<button onclick="selectTicket();">티켓 선택하기</button> <!-- 버튼 누르면 객실 선택하는 div로 이동 -->
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
	
	<script type="text/javascript" src="resources/js/product/activityDetail.js"></script>
	
</body>
</html>
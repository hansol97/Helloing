<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>

<style>

.middle-content { display: flex; justify-content: space-between; }
.side-bar { width: 280px; padding: 0px 5px; }
.main { width: 800px; }
hr{ margin: 15px 0px; }

/* 사이드바 */
.accommselectbox{
	border: 1px solid gray;
	text-align: center;
	padding: 10px;
	position: fixed;
}
.accommselectbox button{
	width: 250px;
	height: 50px;
	font-size: 18px;
	font-weight: bold;
	background-color: #053E99;
	color: white;
	border: 0;
	border-radius: 3px;
	margin: 40px 0px 10px 0px;
}
.accommselectbox p{ font-size: 20px; }
.accommselectbox span{ font-size: 25px; font-weight: bold; }
#btn-wish{
	width: 250px;
	height: 50px;
	font-size: 18px;
	font-weight: bold;
	background-color: white;
	color: gray;
	border: 1px solid gray;
	border-radius: 3px;
	margin: 10px 0px;
}
/* 사이드바 끝 */


/* 메인 */
.top-info{ display: flex; justify-content: space-between; }
.acticityName{
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 20px;
}
.top-info button{
	width: 200px;
	font-size: 20px;
	border: 1px solid gray;
	border-radius: 3px;
}

.images{ border: 1px solid gray; margin-bottom: 20px; }
.sub-images{ display: flex; justify-content: space-between; }

/* 티켓 선택 */
.ticketlist{
	background-color: rgb(230, 230, 230);
	padding: 10px 0px;
	margin-bottom: 30px;
}
.ticketbox{
	display: flex;
	align-items: center;
	background-color: white;
	border: 1px solid lightgray;
	border-radius: 3px;
	padding: 10px;
	margin: 10px 20px;
}
.ticket-info{ width: 400px; }
.ticket-price{ width: 150px; }
.ticket-price span{ font-size: 25px; }
.ticket-count{ width: 200px; }
.ticket-count button{
	border: 1px solid lightgray;
	border-radius: 70px;
	width: 40px;
	height: 40px;
	font-size: 40px;
	font-weight: 50;
	line-height: 30px;
}
.ticket-count span{ font-size: 25px; margin: 0px 10px; }
.ticketName{ font-size: 20px; }
/* 티켓 선택 끝 */

.explanation{
	display: flex;
	padding: 10px;
	margin-bottom: 10px;
}
.title{ width: 300px; }
.title span{ font-size: 20px; }

/* 리뷰 */
.reviewtitle{
	margin: 20px 0px 10px 0px;
	font-size: 30px;
}
.reviewstar{
	display: flex;
	border: 1px solid gray;
	padding: 30px;
	justify-content: space-evenly;
	margin-bottom: 20px;
}
.reviewstar span{
	font-size: 40px;
	font-weight: bold;
}
.reviewstar div{
	text-align: center;
}

/* 정렬버튼 */
.radio-sort{
    text-align: right;
    margin-bottom: 15px;
}
.radio-sort>input[type=radio]{
    opacity: 0;
}
.radio-sort>input[type=radio]>label{
    padding: 5px 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}
.radio-sort>input[type=radio]:checked+label{
    font-weight: bold;
    color: #053E99;
}
/* 정렬버튼 끝 */

.reviewbox{
	font-size: 14px;
}
.review-content{
	font-size: 16px;
	margin: 5px 0px;
}
.tag{
	background-color: lightgray;
	margin-right: 20px;
	padding: 2px 6px;
}

/* 페이지 버튼 */
.page-bar{
	text-align: center;
	margin: 30px;
}
.page-bar li{
	display: inline-block;
}
.page-bar a{
	font-size: 20px;
	margin: 0px 20px;
}
/* 페이지 버튼끝 */
/* 리뷰 끝 */
/* 메인 끝 */

</style>

</head>
<body>

	<jsp:include page="../common/menubar_user.jsp"/>
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
		<div class="middle-content">
			<div class="main">

				<div class="top-info">
					<sapn class="acticityName">[QR바로입장] 롯데월드 어드벤처 종합이용권</sapn>
				</div>
				<div>
					<p>⭐⭐⭐⭐⭐ 4.0 (173) ∨</p> <!-- 클릭 시 후기 div로 이동 -->
				</div>
				<hr>
				<div>
					<p>📆 유효기간 (2023.01.01 ~ 2023.03.25) 내 사용</p>
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
					<div class="ticketlist"><!-- 티켓 포문 돌리기~ -->
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
								<button>-</button>
								<span class="count">0</span>
								<button>+</button>
							</div>
						</div>
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
								<button>-</button>
								<span class="count">0</span>
								<button>+</button>
							</div>
						</div>
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
								<button>-</button>
								<span class="count">0</span>
								<button>+</button>
							</div>
						</div>
					</div>
				</div>

				<hr>

				<div class="explanation">
					<div class="title"><span>소개</span></div>
					<div><p>무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을</p></div>
				</div>
				<hr>

				<div class="explanation">
					<div class="title"><span>이용안내</span></div>
					<div><p>무엇을 위하여 광야에서 방황하였으며 공자는 무엇을 위하여 천하를 철환하였는가? 밥을 위하여서 옷을 위하여서 미인을 구하기 위하여서 그리하였는가? 아니다 그들은 커다란 이상 곧 만천하의 대중을 품에 안고 그들에게 밝은 길을 찾아 주며 그들을</p></div>
				</div>
				<hr>

				<div>
					<h3 class="reviewtitle">후기 173</h3>
					<div class="reviewstar">
						<div>
							<p><span>4.3</span><br>
							⭐⭐⭐⭐⭐</p>
						</div>
						<div class="starlist">
							<table>
								<tr>
									<td align="right">⭐⭐⭐⭐⭐ </td>
									<td width="200"><progress value="130" max="1000"></progress></td>
									<td>106명</td>
								</tr>
								<tr>
									<td align="right">⭐⭐⭐⭐ </td>
									<td><progress value="130" max="1000"></progress></td>
									<td>106명</td>
								</tr>
								<tr>
									<td align="right">⭐⭐⭐ </td>
									<td><progress value="130" max="1000"></progress></td>
									<td>106명</td>
								</tr>
								<tr>
									<td align="right">⭐⭐ </td>
									<td><progress value="130" max="1000"></progress></td>
									<td>106명</td>
								</tr>
								<tr>
									<td align="right">⭐ </td>
									<td><progress value="130" max="1000"></progress></td>
									<td>106명</td>
								</tr>
							</table>
						</div>
					</div>

					<div class="radio-sort">
						<input type="radio" name="radio-sort" id="recomm"><label for="recomm">추천순</label>
						<input type="radio" name="radio-sort" id="manyreview"><label for="manyreview">많은 후기순</label>
						<input type="radio" name="radio-sort" id="highstar"><label for="highstar">높은 평점순</label>
						<input type="radio" name="radio-sort" id="lowprice"><label for="lowprice">낮은 가격순</label>
						<input type="radio" name="radio-sort" id="highprice"><label for="highprice">높은 가격순</label>
					</div>
					
					<div><!-- 리뷰 포문 돌리기 -->
						<div class="reviewbox">
							<p>⭐⭐⭐⭐⭐ 김*미<br>
								2022.08.08 | 디럭스 패밀리트윈</p>
							<p class="review-content">너무너무 깨끗하고<br>
								가성비 최고!<br>
								이런 곳이 진작 있는 줄 알았다면...</p>
						</div>
						<hr>
						<div class="reviewbox">
							<p>⭐⭐⭐⭐⭐ 김*미<br>
								2022.08.08 | 디럭스 패밀리트윈</p>
							<p class="review-content">너무너무 깨끗하고<br>
								가성비 최고!<br>
								이런 곳이 진작 있는 줄 알았다면...</p>
						</div>
						<hr>
						<div class="reviewbox">
							<p>⭐⭐⭐⭐⭐ 김*미<br>
								2022.08.08 | 디럭스 패밀리트윈</p>
							<p class="review-content">너무너무 깨끗하고<br>
								가성비 최고!<br>
								이런 곳이 진작 있는 줄 알았다면...</p>
						</div>
						<hr>
						<div class="reviewbox">
							<p>⭐⭐⭐⭐⭐ 김*미<br>
								2022.08.08 | 디럭스 패밀리트윈</p>
							<p class="review-content">너무너무 깨끗하고<br>
								가성비 최고!<br>
								이런 곳이 진작 있는 줄 알았다면...</p>
						</div>
						<hr>
						<div class="reviewbox">
							<p>⭐⭐⭐⭐⭐ 김*미<br>
								2022.08.08 | 디럭스 패밀리트윈</p>
							<p class="review-content">너무너무 깨끗하고<br>
								가성비 최고!<br>
								이런 곳이 진작 있는 줄 알았다면...</p>
						</div>
						<hr>
					</div>

					<div class="page-bar"><!-- 페이징바 리뷰는 5개씩 보여줄거다 -->
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

				</div>

			</div>

			<div class="side-bar">
				<div class="accommselectbox">
					<p><span>65,000원부터 ~</span></p>
					<button>티켓 선택하기</button> <!-- 버튼 누르면 객실 선택하는 div로 이동 -->
					<div><button id="btn-wish">♥️ 위시리스트에 담기</button></div>
				</div>
			</div>
		</div>
	</div>

	<div style="height: 300px;"></div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>

<link href="resources/css/product/accommDetail.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="resources/js/product/accommDetail.js"></script>

</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/>
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
		<div class="middle-content">
			<div class="main">

				<div class="top-info">
					<sapn class="accommName">서귀포 퍼스트 호텔</sapn>
					<button>🗺️ 위치보기</button>
				</div>
				<div>
					<p>4성급<br>
						⭐⭐⭐⭐⭐ 4.0 (173) ∨</p> <!-- 클릭 시 후기 div로 이동 -->
				</div>
				<hr>
				<div class="middle-info">
					<div>📌 제주 서귀포시 명동로 46</div>
					<div>🕒 체크인 15:00 ~ 체크아웃 11:00</div>
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

				<div class="selectoption">
					<table class="researchtable">
						<tr>
							<td width="250">날짜</td>
							<td width="200">인원</td>
						</tr>
						<tr>
							<td><input type="date"></td>
							<td>
								<select> <!-- 나중에 자바스크립트로 포문돌리기 -->
									<option>2명</option>
									<option>3명</option>
									<option>4명</option>
									<option>5명</option>
									<option>6명</option>
									<option>7명</option>
								</select>
							</td>
							<td><button>재검색</button></td>
						</tr>
					</table>
				</div>

				<div>
					<div class="accommbox"><!-- 객실 포문 돌리기~ -->
						<input type="hidden" name="" value="1">
						<div class="first">
							<img src="/helloing/resources/img/logo_outline.png" width="250" height="160">
							<p><span>슈페리어 트윈</span><br>
								기준 2인 / 최대 2인</p>
						</div>
						<hr>
						<div class="second">
							<h1>01 슈페리어 트윈 객실 <br>
								65,000원</h1>
							<button>예약</button>
						</div>
					</div>
					<div class="accommbox">
						<div class="first">
							<img src="/helloing/resources/img/logo_outline.png" width="250" height="160">
							<p><span>슈페리어 트윈</span><br>
								기준 2인 / 최대 2인</p>
						</div>
						<hr>
						<div class="second">
							<h1>01 슈페리어 트윈 객실 <br>
								65,000원</h1>
							<button>예약</button>
						</div>
					</div>
					<div class="accommbox">
						<div class="first">
							<img src="/helloing/resources/img/logo_outline.png" width="250" height="160">
							<p><span>슈페리어 트윈</span><br>
								기준 2인 / 최대 2인</p>
						</div>
						<hr>
						<div class="second">
							<h1>01 슈페리어 트윈 객실 <br>
								65,000원</h1>
							<button>예약</button>
						</div>
					</div>
					<div class="accommbox">
						<div class="first">
							<img src="/helloing/resources/img/logo_outline.png" width="250" height="160">
							<p><span>슈페리어 트윈</span><br>
								기준 2인 / 최대 2인</p>
						</div>
						<hr>
						<div class="second">
							<h1>01 슈페리어 트윈 객실 <br>
								65,000원</h1>
							<button>예약</button>
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
							<div>
								<p>⭐⭐⭐⭐⭐ 김*미<br>
									2022.08.08 | 디럭스 패밀리트윈</p>
								<p class="review-content">너무너무 깨끗하고<br>
									가성비 최고!<br>
									이런 곳이 진작 있는 줄 알았다면...</p>
								<span class="tag">객실이 깨끗해요</span><span class="tag">친절해요</span>
							</div>
							<div><img src="/helloing/resources/img/logo_outline.png" width="250" height="160"></div>
						</div>
						<hr>
						<div class="reviewbox">
							<div>
								<p>⭐⭐⭐⭐⭐ 김*미<br>
									2022.08.08 | 디럭스 패밀리트윈</p>
								<p class="review-content">너무너무 깨끗하고<br>
									가성비 최고!<br>
									이런 곳이 진작 있는 줄 알았다면...</p>
								<span class="tag">객실이 깨끗해요</span><span class="tag">친절해요</span>
							</div>
							<div><img src="/helloing/resources/img/logo_outline.png" width="250" height="160"></div>
						</div>
						<hr>
						<div class="reviewbox">
							<div>
								<p>⭐⭐⭐⭐⭐ 김*미<br>
									2022.08.08 | 디럭스 패밀리트윈</p>
								<p class="review-content">너무너무 깨끗하고<br>
									가성비 최고!<br>
									이런 곳이 진작 있는 줄 알았다면...</p>
								<span class="tag">객실이 깨끗해요</span><span class="tag">친절해요</span>
							</div>
							<div><img src="/helloing/resources/img/logo_outline.png" width="250" height="160"></div>
						</div>
						<hr>
					</div>

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

				</div>

			</div>

			<div class="side-bar">
				<div class="accommselectbox">
					<p>1박 <span>65,000원 ~</span></p>
					<button>객실 선택하기</button> <!-- 버튼 누르면 객실 선택하는 div로 이동 -->
					<div><button id="btn-wish">♥️ 위시리스트에 담기</button></div>
				</div>
			</div>
		</div>
	</div>

	<div style="height: 300px;"></div>
	
</body>
</html>
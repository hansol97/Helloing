<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>

<style>

.middle-content {
	display: flex;
	justify-content: space-between;
}
.side-bar {
	width: 280px;
	padding: 0px 5px;
}
.main {
	width: 800px;
}

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
	margin-top: 20px;
}
.accommselectbox p{
	font-size: 20px;
}
.accommselectbox span{
	font-size: 25px;
	font-weight: bold;
}
/* 사이드바 끝 */


/* 메인 */
.top-info{
	display: flex;
	justify-content: space-between;
}
.accommName{
	font-size: 40px;
	font-weight: bold;
	margin-bottom: 20px;
}
.top-info button{
	width: 200px;
	font-size: 20px;
	border: 1px solid gray;
	border-radius: 3px;
}
.middle-info{
	display: flex;
	margin: 20px 0px;
}
.middle-info>div{
	width: 400px;
}

.images{
	border: 1px solid gray;
}
.sub-images{
	display: flex;
	justify-content: space-between;
}

/* 인원, 날짜 재검색 */
.selectoption{
	margin: 20px 0px;
	border: 1px solid gray;
}
.researchtable{
	margin: 5px 30px;
}
.researchtable input, .researchtable select{
	width: 90%;
	height: 30px;
}
.researchtable button{
	width: 100px;
	height: 30px;
	border: 0px;
	border-radius: 3px;
	background-color: #053E99;
	color: white;
	font-weight: bold;
}
/* 인원, 날짜 재검색 끝 */

/* 객실 상품들 */
.accommbox{
	border: 1px solid gray;
	padding: 10px;
	margin-bottom: 10px;
}
.first{
	display: flex;
	align-items: center;
}
.second{
	display: flex;
	align-items: center;
	justify-content: space-between;
}
.second button{
	width: 60px;
	height: 40px;
	border: 0;
	border-radius: 3px;
	background-color: #053E99;
	color: white;
	font-weight: bold;
}
/* 객실 상품들 끝 */

.explanation{
	display: flex;
	padding: 10px;
	margin-bottom: 10px;
}
.title{
	width: 300px;
}
.title span{
	font-size: 20px;
}

/* 리뷰 */
.reviewtitle{
	margin: 20px 0px 10px 0px;
	font-size: 30px;
}
.reviewstar{
	border: 1px solid gray;
}

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
					<div>⏲️ 체크인 15:00 ~ 체크아웃 11:00</div>
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
						<div></div>
						<div></div>
					</div>
				</div>

			</div>

			<div class="side-bar">
				<div class="accommselectbox">
					<p>1박 <span>65,000원 ~</span></p>
					<button>객실 선택하기</button> <!-- 버튼 누르면 객실 선택하는 div로 이동 -->
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
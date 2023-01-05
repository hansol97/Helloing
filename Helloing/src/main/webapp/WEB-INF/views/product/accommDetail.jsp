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
}
/* 객실 상품들 끝 */
/* 메인 끝 */
</style>

</head>
<body>

	<jsp:include page="../common/menubar_user.jsp"/>
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
		<div class="middle-content">
			<div class="main">
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

				<div class="accommbox">
					<div>
						<img src="/helloing/resources/img/logo_outline.png" width="250" height="160">
						<p><span>슈페리어 트윈</span><br>
							기준 2인 / 최대 2인</p>
					</div>
				</div>
			</div>

			<div class="side-bar">
				<div class="accommselectbox">
					<p>1박 <span>65,000원 ~</span></p>
					<button>객실 선택하기</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>
<style>
#title{ font-size: 40px; font-weight: bold; margin-bottom: 10px; }

.content{ display: flex; justify-content: space-between;}
.main{ width: 700px; }
.side-bar{ width: 380px; }

.sub-title{ font-size: 25px; }

hr{ margin: 10px 0px; }

/* 상품 정보 */
.accomm-info{ display: flex; align-items: center; margin-bottom: 20px; }
.accomm-info span{ font-size: 25px; font-weight: bold; }
.room-info{ 
	display: flex; 
	justify-content: space-between; 
	padding: 15px 40px; 
	background-color: rgb(225, 225, 225);
}
.room-info span{ font-size: 18px; font-weight: bold;}
.price-info{ 
	display: flex; 
	justify-content: space-between;
	padding: 10px 40px;
	margin-bottom: 50px;
}
.price{ font-size: 20px; font-weight: 900; }
/* 상품 정보 끝 */

/* 예약자 정보 */
.user-info{ font-size: 20px;}
#btn-info{ 
	width: 100px;
	height: 40px;
	border: 1px solid rgb(181, 181, 181);
	border-radius: 3px;
}
/* 예약자 정보 끝 */

/* 사이드바 */
.pay-info{ 
	border: 1px solid gray;
	padding: 10px;
}
.order-price{ 
	display: flex; 
	justify-content: space-between;	
	background-color: #dae8ff;
	font-size: 25px;
	font-weight: bold;
	padding: 10px;
	margin-bottom: 50px;
}
.check{ font-size: 17px; margin-bottom: 50px;}
.pay-info button{ 
	width: 100%;
	height: 60px;
	font-size: 19px;
	border: 0;
	border-radius: 3px;
	background-color: #053E99;
	color: white;
}
/* 사이드바 끝 */
</style>
</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/>

    <div style="height: 70px;"></div>

	<div class="inner">
	
		<p id="title">예약하기</p>

		<form action="pay.accomm" method="">
			<div class="content">
				<div class="main">
					<p class="sub-title">상품 정보</p>
					<hr>
	
					<div class="accomm-info">
						<img src="/helloing/resources/img/logo_outline.png" width="180">
						<p><span>휘닉스 제주 섭지코지</span><br>
							23년 1월 06일 (금) 14시 00분 ~ 23년 1월 7일 (토) 11시 00분, 1박</p>
					</div>
					<div class="room-info">
						<span>로얄룸 라운지 이용</span>
						<span>807,890원</span>
					</div>
					<div class="price-info">
						<span>총 상품 금액</span>
						<span class="price">706,860원</span>
					</div>
	
					<p class="sub-title">예약자 정보</p>
					<hr>
	
					<div>
						<table>
							<tr>
								<td width="120">예약자 이름</td>
								<td width="500" class="user-info">ㅇㅇㅇ</td>
							</tr>
							<tr>
								<td>이메일 주소</td>
								<td class="user-info">@gmail.com</td>
								<td rowspan="3"><button id="btn-info">정보변경</button></td>
							</tr>
							<tr>
								<td>휴대전화 번호</td>
								<td class="user-info">010-0000-0000</td>
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
							<span>708,322원</span>
						</div>
	
						<div class="check">
							<p class="sub-title">약관 안내</p>
							<hr>
	
							<input type="checkbox"> 개인정보 제공 동의 (필수)<br>
							<input type="checkbox"> 개인정보 제공 동의 (필수)<br>
							<input type="checkbox"> 개인정보 제공 동의 (필수)<br>
						</div>
	
						<button>683,211원 결제하기</button>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>
</html>
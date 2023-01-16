<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 페이지</title>
<style>
	/* 구조 관련 */
	.out{
		width : 1200px; 
		height : 100%;
		margin : auto;
	}
	.out .include{
		width : 300px;
		float : left;
	}
	#detail{
		width : 900px;
		float : left;
	}

	#detail h1{
		font-size: 30px;
		font-weight: 600;
	}
	/* 예약명 */
	#detail a{
		font-size: 20px;
		font-weight: 300;
	}
	#detail a:hover{
		text-decoration:underline;
	}

	/* 예약상태 */
	#check{
		border: 1px solid lightgray;
		height: 150px;
		border-radius: 30px;
		background-color: aliceblue;
	}
	#check h3{
		text-align: center;
		margin: auto;
		font-size: 25px;
	}

	/* 예약 상세정보 */
	#datail_book h2{
		font-weight: 700;
		font-size: 25px;
		padding: 10px 0;
	}
	#datail_book .book_title{
		font-weight: 700;
	}
	#datail_book div{
		padding-bottom: 5px;
	}

	/* 예약자 상세정보 */
	#datail_mem h2{
		font-weight: 700;
		font-size: 25px;
		padding: 10px 0;
	}
	#datail_mem div{
		padding-bottom: 5px;
	}
	#payment{
		float: right;
	}
	#price{
		font-size: 25px;
		font-weight: 600;
		padding-left: 20px;
	}

	/* 버튼 */
	#btn{
		padding-left: 350px;
	}
	#btn button{
		font-family: 'S-CoreDream-3Light';
		font-size: 15px;
		border: 0.1px solid darkgray;
		border-radius: 10px;
		width: 120px;
		height: 40px;
		background-color: snow;
	}
	#btn button:hover{
		background-color:#002ead;
		color: white;
    	transition: 0.7s;
	}

	/* 이미지 */
	#image{
		display:flex;
		padding: 10px;
	}
	#image img{
		padding: 20px;
		border:1px solid lightgray;
		border-radius: 10px;
		margin: 5px;
	}

</style>
</head>
<body>
	
	<jsp:include page="../common/menubar_user.jsp"/>
	<br><br>

	<div class="out">
		<div class="include">
			<jsp:include page="../member/myPage.jsp"/>
		</div>
		
		<div id="detail">
		<br><br>
		<h1>예약 상세 페이지</h1><br>
		<a href="detail.accomm">[빠른전송] 2023 스위스패스 연속 E-티켓 + 특전</a>
		<hr>
		<div id="check">
			<h3>
				<br>
				❇️
				<br>
				예약까지 D-20
			</h3>
		</div>
		<div id="image">
			<img src="/helloing/resources/img/logo_outline.png" alt="" width="250px">
			<img src="/helloing/resources/img/logo_outline.png" alt="" width="250px">
			<img src="/helloing/resources/img/logo_outline.png" alt="" width="250px">
		</div>
		<hr>
			<div id="datail_book">
				<h2>예약 상세 정보</h2>
				<div>
					<span class="book_title">예약번호 : </span>
					<span class="book_content">20230103-111111</span>
				</div>
				<div>
					<span class="book_title">주문 : </span>
					<br>
					<span class="book_content">
					1-2. 스위스패스 연속패스 3일권 2등석 유스 ✕ 1 <br>1-2. 스위스패스 연속패스 3일권 2등석 성인 ✕ 1
					</span>
				</div>
				<div>
					<span class="book_title">수량 :</span>
					<span class="book_content"> 2</span>
				</div>
				<div>
					<span class="book_title">시작일자 : </span>
					<span class="book_content">2023-01-03</span>
				</div>
				<div>
					<span class="book_title">마감일자 : </span> 
					<span class="book_content">2022-12-31</span>
				</div>
			</div>
		<hr>
			<div id="datail_mem">
					<h2>예약자 정보</h2>
					<div>박혜진</div>
					<div>01041396013</div>
					<div>qkrgpwls6013@gmail.com</div>
				<br>
				<div id="payment">
					<span>총 결제금액</span>
					<span id="price">103,000원</span>
					<div>결제일 : 2022-12-31</div>
				</div>
			</div>
			<br><br><br>
		<hr>

		<br>
		<div id="btn">
			<button id="list_btn">목록으로</button>
			<button id="cancel_btn">예약취소</button>
		</div>	

		</div>
	</div>
</body>
</html>
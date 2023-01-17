<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<a href="detail.accomm">${tp.activityName }</a>
		<hr>
		<div id="image">
			<c:forEach var="a" items="${list}">
			<img src="${a.attachment}" alt="" width="250px">
			</c:forEach>
		</div>
		<hr>
			<div id="datail_book">
				<h2>예약 상세 정보</h2>
				<div>
					<span class="book_title">예약번호 : </span>
					<span class="book_content">${tp.orderNo }</span>
				</div>
				<div>
					<span class="book_title">주문 : </span>
					<br>
					<span class="book_content">
						${tp.ticketName }
					</span>
				</div>
				<div>
					<span class="book_title">수량 :</span>
					<span class="book_content"> ${tp.count }</span>
				</div>
			</div>
		<hr>
			<div id="datail_mem">
					<h2>예약자 정보</h2>
					<div>${tp.memName }</div>
					<div>${tp.phone }</div>
					<div>${tp.email }</div>
				<br>
				<div id="payment">
					<span>총 결제금액</span>
					<span id="price">${tp.ticketSum}원</span>
					<div>결제일 : ${tp.paymentDate }</div>
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
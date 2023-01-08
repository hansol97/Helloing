<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 페이지</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
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
		padding : 10px;
	}

	.trip h3{
		font-size:25px;
		font-weight:600;
		padding:10px;
	}
	
	.plan{
		height: 100px;
		outline: 1px solid gray;
		padding:10px;
	}
	.plan h4{
		font-size:30px;
		font-weight:600;
		
	}
	.planner-btn{
		float : right;
	}
	.planner-btn a{
		padding-right : 10px;
	}
	#add-plan{
		text-align: center;
		font-size : 30px;
	}
	.modalBtn a{
		padding-right:10px;
	}
	#trip-btn{
		display:flex;
	}
	
	#trip-detail h2{
		font-size : 30px;
		font-weight:700;
	}
	#trip-detail h3{
		font-size : 20px;
		font-weight:700;
	}
	#person span{
		padding-right : 10px;
	}
	/* 버튼들 */
	#share-area button{
		border : none;
		border-radius: 20px;
		background-color : yellow;
		color: gray;
		font-size: 25px;
		margin: 10px;
	}
	#payment-area button{
		border : none;
		border-radius: 20px;
		background-color : navy;
		color: white;
		font-size: 25px;
		margin: 10px;
	}
	#trip-btn button:hover{
		cursor: pointer;
		color: white;
		background-color: darkgray;
	}
	/* 상세일정 */
	#plan .plan-day{
		border: 1px solid gray;
		border-radius: 10px;
		margin: 10px;
		padding: 10px;
	}
	#plan .plan-day h2{
		font-size: 25px;
		font-weight: 700;
	}
	#plan .plan-day a{
		border: 1px solid gray;
		border-radius: 20px;
		padding: 5px;
		height: 50px;
	}
	.plan-title{
		font-size: 20px;
		font-weight: 500;
	}
	.plan-time{
		font-size: 15px;
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
			<h1>My Planner</h1>
			
			<hr>
			<div id="trip-detail">
				<h2>반갑소잉 여행</h2>
				<h5>2023.1.2 ~ 1.25</h5>
				<h3>여행에 함께하는 사람들 : </h4>
				<div id="person">
					<span>박혜진</span>
					<span>홍길동</span>
					<span>김길동</span>
				</div>
			</div>
			<div id="trip-btn">
		        <div id="share-area">
		        	<button>👫일행과 함께 여행가기</button>
		        </div>
		        <div id="payment-area">
		        	<button onclick="location.hred=''">💰가계부</button>
		        </div>
	        </div>
			<hr>
	        <div id="plan">
	        	<div class="plan-day">
					<h2>day1 : 1.2</h2>	
					<br>
		        	<a href="#ex1" rel="modal:open"> + 일정 추가</a>
					<br><br>
					<div>
						<div class="plan-title">전주한옥마을</div>
						<div>가는 길에 육회먹기</div>
						<div class="plan-time">22.01.08 18:00 ~ 22.01.08 20:00</div>
						<div>관광</div>
					</div>				        	
	        	</div>
    	      	<div class="plan-day">
					<h2>day2 : 1.3</h2>	
					<br>
		        	<a href="#ex1" rel="modal:open"> + 일정 추가</a>
		        	<br><br>
					<div>
						<div class="plan-title">전주한옥마을</div>
						<div>가는 길에 육회먹기</div>
						<div class="plan-time">22.01.08 18:00 ~ 22.01.08 20:00</div>
						<div>관광</div>
					</div>				        	
	        	</div>
	        </div>
	        	 
		
		</div>
		
	    <div id="ex1" class="modal">
    		<h5 style="font-weight:600;">일정 추가</h5>
			<hr>
			<form action="" method="">
				<ul>
					<li>일정명  <input type="text" placeholder="내용을 입력해주세요."></li>
					<li>일정 설명  <input type="text" placeholder="내용을 입력해주세요."></li>
					<li>일정 시작 시간 <input type="time" id="start" name="plan-start"> </li>
					<li>일정 종료 시간 <input type="time" id="end" name="plan-start"> </li>
					<li>
						카테고리
						<select name = "category">
						    <option>숙소</option>
						    <option>이동</option>
						    <option>관광</option>
						    <option>식사</option>
						    <option>쇼핑</option>
						    <option>기타</option>
					    </select>
					</li>
				</ul>
			</form>		 
			<div class="modalBtn" style="float:right;">
				  <a href="#" >추가</a>
				  <a href="#" rel="modal:close">취소</a>
		 	</div>
		</div>
	<script>

	

	</script>
</body>
</html>
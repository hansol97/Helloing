<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가계부</title>
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

	#header{
		padding-top : 10px; 
		display : flex;
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
	#payment-area{
		height:60px;
		padding-top: 15px;
	}
	
	#payment-area a{
		border : none;
		border-radius: 20px;
		background-color : navy;
		color: white;
		font-size: 25px;
		padding:10px;
	}
	#payment-area a:hover{
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
		<div id="header">
			<h1>가계부</h1>
			
	        <div id="payment-area">
	        	<a href="">1/n</a>
	        </div>
        </div>
			<hr>
	        <div id="plan">
    	        <div class="plan-day">
					<h2>여행준비</h2>	
					<br>
		        	<a href="#ex1" rel="modal:open"> 비용수정 </a>
					<br><br>
					<div>
						<div class="expense-amount"><b>사용 금액 :</b> 50,000원</div>
						<div><b>결제 수단 :</b> 현금</div>
						<div class="expense-content">내용 : ktx</div>
						<div>카테고리 : 교통</div>
					</div>
				</div>				        	
	        	<div class="plan-day">
					<h2>day1 : 1.2</h2>	
					<br>
		        	<a href="#ex1" rel="modal:open"> + 비용 추가</a>
					<br><br>
	        	</div>
    	      	<div class="plan-day">
					<h2>day2 : 1.3</h2>	
					<br>
		        	<a href="#ex1" rel="modal:open"> + 비용 추가</a>
		        	<br><br>
	        </div>
	        	 
		
		</div>
		
	    <div id="ex1" class="modal">
    		<h5 style="font-weight:600;">비용 추가</h5>
			<hr>
			<form action="" method="post">
				<ul>
					<li><input type="number" placeholder="금액입력">원</li>
					<li>
						결제수단  
						<select name="payment">
							<option></option>
							<option></option>
						</select>
					</li>
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
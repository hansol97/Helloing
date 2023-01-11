<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Planner - 반갑소잉 여행</title>
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

	#share-area{
		border : none;
		border-radius: 20px;
		background-color : #ffea24bf;
		margin: 10px;
	}
	#share-area a{
		color: black;
		font-size : 25px;
		margin: 10px;
	}
	#share-area:hover{
		cursor: pointer;
		color: white;
		background-color: darkgray;
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
	
	#add-area{
		border : none;
		border-radius: 20px;
		background-color : #65a0ff;
		margin: 10px;
	}
	#add-area a{
		color: white;
		font-size : 25px;
		margin: 10px;
	}
	#add-area:hover{
		cursor: pointer;
		color: white;
		background-color: darkgray;
	}
	/* 상세일정 */
	#plan .plan-day{
		border: 1px solid gray;
		border-radius: 10px;
		margin: 10px;
		padding: 20px;
	}
	#plan .plan-day h2{
		font-size: 25px;
		font-weight: 700;
	}

	.plan-title{
		font-size: 20px;
		font-weight: 500;
	}
	.plan-time{
		font-size: 15px;
	}
	.plan-category{
		  background: gray;
		  color: white;
		  border-radius: 10px;
		  padding: 5px;
		  margin: 10px;
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
				<h2>${list[1].plannerName}</h2>
				<h5>${list[1].startDate} ~ ${list[1].endDate}</h5>
				<h3>여행에 함께하는 사람들 : </h4>
				<div id="person">
					<span>${list[1].memName}</span>
				</div>
			</div>
			<div id="trip-btn">
		        <div id="share-area">
		        	<a href="#ex1" rel="modal:open">👫일행과 함께 여행가기</a>
		        </div>
		        <div id="payment-area">
		        	<button onclick="location.href='expenseView.hj'">💰가계부</button>
		        </div>
		        <div id="add-area">
            		 <a href="#ex2" rel="modal:open"> 🗓️ 일정 추가</a>
		        </div>
	        </div>
			<hr>
	        <div id="plan">
		        <c:forEach var="p" items="${list}">
		        	<div class="plan-day">
						<h2>day : ${p.planDate}</h2>	
						<div>
							<div class="plan-time">${p.startTime} ~ ${p.endTime}</div>
							<br>
							<span class="plan-category">${p.planCategory }</span>
							<span class="plan-title">${p.planName}</span>
							<br><br>
							<span>${p.planContent }</span>
							<span style="float:right; font-size:20px;">
								<a>수정</a>
								&nbsp;&nbsp;
								<a>삭제</a>
							</span>
						</div>				        	
		        	</div>
	        	</c:forEach>
	        </div>
	        	 
		
		</div>
		
	    <div id="ex1" class="modal">
    		<h5 style="font-weight:600;">일행과 함께 여행가기</h5>
			<hr>
			<form action="" method="post">
				<h2>일행의 아이디를 입력해주세요.</h2>
				<input type="text" name="memId">
			</form>		 
			<div class="modalBtn" style="float:right;">
				  <a href="#" >추가</a>
				  <a href="#" rel="modal:close">취소</a>
		 	</div>
		</div>
		
	    <div id="ex2" class="modal">
    		<h5 style="font-weight:600;">일정 추가</h5>
			<hr>
			<form action="" method="post">
				<ul>
					<li>일정명  <input type="text" name="planName" placeholder="내용을 입력해주세요."></li>
					<li>일정 설명  <input type="text" name="planContent" placeholder="내용을 입력해주세요."></li>
					<li>일정 날짜 <input type="date" name="planDate" min="${list[1].startDate}" max="${list[1].endDate}">
					<li>
						일정 시작 시간
						<select name = "startTime">
						    <option>01:00</option>
						    <option>02:00</option>
						    <option>03:00</option>
						    <option>04:00</option>
						    <option>05:00</option>
						    <option>06:00</option>
						    <option>07:00</option>
						    <option>08:00</option>
						    <option>09:00</option>
						    <option>10:00</option>
						    <option>11:00</option>
						    <option>12:00</option>
						    <option>13:00</option>
						    <option>14:00</option>
						    <option>15:00</option>
						    <option>16:00</option>
						    <option>17:00</option>
						    <option>18:00</option>
						    <option>19:00</option>
						    <option>20:00</option>
						    <option>21:00</option>
						    <option>22:00</option>
						    <option>23:00</option>
						    <option>24:00</option>
					    </select>
					</li>
					<li>
						일정 종료 시간
						<select name = "endTime">
						    <option>01:00</option>
						    <option>02:00</option>
						    <option>03:00</option>
						    <option>04:00</option>
						    <option>05:00</option>
						    <option>06:00</option>
						    <option>07:00</option>
						    <option>08:00</option>
						    <option>09:00</option>
						    <option>10:00</option>
						    <option>11:00</option>
						    <option>12:00</option>
						    <option>13:00</option>
						    <option>14:00</option>
						    <option>15:00</option>
						    <option>16:00</option>
						    <option>17:00</option>
						    <option>18:00</option>
						    <option>19:00</option>
						    <option>20:00</option>
						    <option>21:00</option>
						    <option>22:00</option>
						    <option>23:00</option>
						    <option>24:00</option>
					    </select>
					</li>
					<li>
						카테고리
						<select name = "planCategory">
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
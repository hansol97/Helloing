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
		        	<button>일행과 함께 여행가기</button>
		        </div>
		        <div>
		        	<button onclick="location.hred=''">가계부</button>
		        </div>
	        </div>
	        <div id="plan">
	        	<div class="plan-day">
					<h2>day1 : 1.2</h2>	
		        	<button>일정 추가</button>
					<div>
						
					</div>				        	
	        	</div>
	        </div>
	        	 
			 <div class="modalBtn" style="float:right;">
				  <a href="#" >생성</a>
				  <a href="#" rel="modal:close">취소</a>
			  </div>
		</div>
		
	<script>

	

	</script>
</body>
</html>
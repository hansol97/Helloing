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
			<div id="add-plan">
				<a href="#ex1" rel="modal:open"> ➕ 일정 추가하기📝</a>
			</div>
			<hr>
			
			<div id="upcoming-trip" class="trip">
			<h3>다가오는 여행</h3>
				<div class="plan">
					<h4>반갑소잉 여행</h4>
					<p>2023.1.2 ~ 1.25</p>
					
					<span class="planner-btn">
						<a href="">수정</a>
						<a href="">삭제</a>
					</span>
				</div>
			</div>
			
			<div id="completed-trip" class="trip">
			<h3>완료된 여행</h3>
				<div class="plan">
					<h4>가족 여행</h3>
					<p>2022.1.2 ~ 1.25</p>
					
					<span class="planner-btn">
						<a href="">삭제</a>
					</span>
				</div>
			</div>
	
	
	</div>

		    <div id="ex1" class="modal">
	    		<h5 style="font-weight:600;">여행 일정 등록</h5>
				<hr>
		    	<br>
		    	
		    	<div>
		    	여행 시작 <input type="date" id="start" name="trip-start"> ~ 여행 종료  <input type="date" id="start" name="trip-end">
		    	</div>
				<div>
				여행명 <input type="text" placeholder="내용을 입력해주세요.">
				</div>			 
			 <div class="modalBtn" style="float:right;">
				  <a href="#" >생성</a>
				  <a href="#" rel="modal:close">취소</a>
			  </div>
		</div>
		
	<script>
	$(function(){
		$('.trip').click(function(){
			location.href="planDetailView.hj"
		})
	})
	
	</script>
</body>
</html>
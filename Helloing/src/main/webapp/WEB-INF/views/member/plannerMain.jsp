<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Planner</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
	.modal button{
		float: right;
	    margin: 10px;
	    background-color: white;
	    border: 1px solid gray;
	    border-radius: 5px;
	    height: 44px;
	    width: 70px;
	}
	.modal input{
		width: 120px;
	    height: 20px;
	    border: 1px solid gray;
	    border-radius: 10px;
	    font-family: 'S-CoreDream-3Light';
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
			<h3>나의 여행 🗓️</h3>
		<c:forEach var="p" items="${list}">
					<div class="plan">
						<h4>${p.plannerName }</h4>
						<p>${p.startDate } ~ ${p.endDate }</p>
						
						<span class="planner-btn">
							<input type="hidden" id="planner-No" name="plannerNo" value="${p.plannerNo}">
							<a href="#ex2" rel="modal:open" class="updateBtn">수정</a>
							<a href="#ex3" rel="modal:open" class="deleteBtn">삭제</a>
						</span>
					</div>
					<br>
		</c:forEach>
			</div>
	</div>

	    <div id="ex1" class="modal">
    		<h5 style="font-weight:600;">여행 일정 등록</h5>
			<hr>
	    	<br>
	    	<form action="insertPlanner.hj" method="post">
	    		<div>
	    			여행명 <input type="text" name="plannerName">
	    		</div>
		    	<div>
		    		여행 시작 <input type="date" id="start" name="startDate"> ~ 여행 종료  <input type="date" name="endDate">
		    	</div>
   				<input type="hidden" name="memNo" value="${loginUser.memNo}">
				<button type="submit">등록</button>
			</form>
	 	</div>
	 	
	    <div id="ex2" class="modal">
    		<h5 style="font-weight:600;">여행 일정 수정</h5>
			<hr>
	    	<br>
	    	<form action="updatePlanner.hj" method="post">
	    	<div class="plannerupdate">
	    	<!-- 
				여기에 수정 란 생길 예정
		    	 -->
		    </div>
		    
   				<input type="hidden" name="memNo" value="${loginUser.memNo}">
				<button type="submit">등록</button>
			</form>
	 	</div>
	 	
	    <div id="ex3" class="modal">
    		<h5 style="font-weight:600;">여행 일정 삭제</h5>
			<hr>
	    	<br>
			<div>
				<h5>정말 삭제하시겠습니까?</h5>
			</div>
   				<input type="hidden" name="memNo" value="${loginUser.memNo}">
				<button onclick="deletePlanner();">삭제</button>
	 	</div>
	</div>
		
	<script>
	$(function(){
		$('.plan h4').click(function(){
			location.href="planDetailView.hj"
		});
	});

	//플래너 수정 버튼 클릭 시 실행
	$('.updateBtn').click(function(){
			$.ajax({
				url : 'selectPlanner.hj',
				data : {plannerNo : $(this).siblings('input[name=plannerNo]').val()},
				success : function(result){
					
					let value = '';
					var plannerNo = $('#planner-No').val();
					var startDate = (result.startDate).substring(0,10);
					var endDate = (result.endDate).substring(0,10);
					
					value += '<div class="update-title">'
						  + '여행명 <input type="text" name="plannerName" value="'+ result.plannerName +'">'
		    			  + '</div>'
		    			  +	'<div>'
			    		  + '여행 시작 <input id="ddt" type="date" class="update-start" name="startDate" value="'+ startDate +'">' 
		    			  + '~ 여행 종료  <input type="date" class="update-end" name="endDate" value="'+ endDate +'">' 
			    		  + '</div>'
			    		  + '<input type="hidden" name="plannerNo" value="' + plannerNo + '">';
			    		  
			    		  $('.plannerupdate').html(value);
							
					console.log(result)
				},
				error : function(){
					console.log('실패');
				}
				});
	})
	//플래너 삭제 버튼 클릭 시 실행
		function deletePlanner(){
		
			var plannerNo = $('#planner-No').val();
	
			location.href="deletePlanner.hj?plannerNo="+ plannerNo;
		}
	
	</script>
</body>
</html>
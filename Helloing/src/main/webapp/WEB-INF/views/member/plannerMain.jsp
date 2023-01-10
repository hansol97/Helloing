<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Planner</title>
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
		<c:forEach var="p" items="${list}">
			<c:if test="${today <= p.endDate }">
					<div class="plan">
						<h4>${p.plannerName }</h4>
						<p>${p.startDate } ~ ${p.endDate }</p>
						
						<span class="planner-btn">
							<a href="updatePlanner.hj">수정</a>
							<a href="deletePlanner.hj">삭제</a>
						</span>
					</div>
			</c:if>
		</c:forEach>
			</div>
			
			<div id="completed-trip" class="trip">
			<h3>완료된 여행</h3>
			<c:forEach var="p" items="${list }">
				<c:if test="${today > p.endDate}">
					<div class="plan">
						<h4>${p.plannerName }</h4>
						<p>${p.startDate } ~ ${p.endDate }</p>
						
						<span class="planner-btn">
							<a href="">삭제</a>
						</span>
					</div>
				</c:if>
			</c:forEach>
			</div>
			
	
	</div>

	    <div id="ex1" class="modal">
    		<h5 style="font-weight:600;">여행 일정 등록</h5>
			<hr>
	    	<br>
	    	<form action="insertPlanner.hj" method="post">
		    	<div>
		    	여행 시작 <input type="date" id="start" name="startDate"> ~ 여행 종료  <input type="date" id="start" name="endDate">
		    	</div>
				<div>
				여행명 <input type="text" name="plannerName" placeholder="내용을 입력해주세요.">
				</div>			 
				<div class="modalBtn" style="float:right;">
					  <a type="submit">생성</a>
					  <a href="#" rel="modal:close">취소</a>
			 	</div>
			</form>
		</div>
		
	<script>
	$(function(){
		$('.trip').click(function(){
			location.href="planDetailView.hj"
		});
		
	});
	</script>
</body>
</html>
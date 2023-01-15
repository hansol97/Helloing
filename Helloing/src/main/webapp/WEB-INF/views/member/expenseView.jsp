<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		padding-top: 23px;
	}
	
	#payment-area a{
		border : none;
		border-radius: 20px;
		background-color : navy;
		color: white;
		font-size: 17px;
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
		height: 160px;
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
	        	<input type="hidden" name="plannerNo" value="${plannerNo}">
	        	<a class="Dutch-treat" href="#ex1" rel="modal:open">1/n</a>
	        	<a class="addExpense-btn" href="#ex2" rel="modal:open"> + 비용 추가</a>
	        </div>
        </div>
			<hr>
	        <div id="plan">			     
	        <c:forEach var="p" items="${list}">   	
	        	<div class="plan-day">
					<h2>day : ${p.expenseDate}</h2>	
					<br>
					<div>
						<span>사용금액 : </span>
						<span>${p.amount}</span>
					</div>
					<div>
						<span>결제수단: </span>
						<span>${p.method}</span>
					</div>
					<div>
						<span>내용: </span>
						<span>${p.expenseContent}</span>					
					</div>
					<span>
						<span>카테고리 : </span>
						<span>${p.expenseCategory}</span>					
					</span>
					<span style="float:right; font-size:20px;">
						<input type="hidden" class="expense" name="expenseNo" value="${p.expenseNo}">	
						<input type="hidden" class="plannerNo" name="plannerNo" value="${p.plannerNo}">	
						<a href="#ex3" rel="modal:open" class="deleteBtn">삭제</a>
					</span>
	        	</div>
	        </c:forEach>
	        	 
		
		</div>
		
	    <div id="ex1" class="modal">
    		<h5 style="font-weight:600;">우리 경비를 1/n로 나누면?</h5>
			<hr>
	    	<br>
	    	<div class="allAmount">
	    	<!-- 
				여기에 결과 란 생길 예정
		    	 -->
		    </div>
	 	</div>
		
		
	    <div id="ex2" class="modal">
    		<h5 style="font-weight:600;">비용 추가</h5>
			<hr>
			<form action="insertExpense.hj" method="post">
				<ul>
					<li>결제 날짜 <input type="date" id="expense-date" name="expenseDate"> </li>
					<li><input type="number" name="amount" placeholder="금액입력">원</li>
					<li>
						결제수단  
						<select name="method">
							<option>현금</option>
							<option>카드</option>
						</select>
					</li>
					<li>내용 <input type="text" name="expenseContent"></li>
					<li>
						카테고리
						<select name = "expenseCategory">
						    <option>숙소</option>
						    <option>교통</option>
						    <option>관광</option>
						    <option>식비</option>
						    <option>쇼핑</option>
						    <option>기타</option>
					    </select>
					</li>
				</ul>
			<input type="hidden" name="plannerNo" value="${plannerNo}">
			<div class="modalBtn" style="float:right;">
				  <button type="submit">추가</button>
		 	</div>
			</form>		 
		</div>
		
   		<div id="ex3" class="modal">
    		<h5 style="font-weight:600;">비용삭제</h5>
			<hr>
	    	<br>
			<div>
				<h5>정말 삭제하시겠습니까?</h5>
			</div>
				<button class="delete-expense">삭제</button>
	 	</div>
	<script>
	$('.Dutch-treat').click(function(){
		var $this = $(this);
		
		var plannerNo = $this.siblings('input[name=plannerNo]').val();
		
		$.ajax({
			url : 'dutchTreat.hj',
			data : {plannerNo : $this.siblings('input[name=plannerNo]').val()},
			success : function(result){
				let value = '';
				
				value += '<h3>카테고리 별 금액</h3>'
					  + '<div> 식비: ' + result.eat + '원</div>'
					  +	'<div> 숙소: ' + result.accomm + '원</div>'
					  + '<div> 교통: ' + result.transport + '원</div>'
					  + '<div> 관광: ' + result.tour + '원</div>'
					  + '<div> 쇼핑: ' + result.shopping + '원</div>'
					  + '<div> 기타: ' + result.other + '원</div>'
					  + '<h2>총 금액 : ' + result.all + '원</div>'
					  + '<h2> 1/n로 나누면 ' + result.individual + '원입니다. <br> 총무님께 정산해주세요.</h2>';
					  
					  $('.allAmount').html(value);
					  
			},
			error : function(){
				console.log('실패');
			}
		})
		
	})

	//삭제 버튼 클릭 시 
		$('.deleteBtn').click(function(){
	
		var $this = $(this);
		var planNo = $this.siblings('input[name=expenseNo]').val();
		var plannerNo = $this.siblings('input[name=plannerNo]').val();
		
		
		$('.delete-expense').click(function(){
			location.href="deleteExpense.hj?expenseNo="+ planNo + '&&plannerNo=' + plannerNo;
		})
	})
	

	</script>
</body>
</html>
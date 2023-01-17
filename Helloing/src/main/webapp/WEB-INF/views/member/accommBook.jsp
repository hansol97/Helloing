<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	.out #table{
	  width : 900px;
	   margin: 0px 0px 0px 300px;
	}
	
	.out #table h1{
		font-size : 30px;
		font-weight : 600;
		padding : 20px;
	}
	table {
	  border-collapse: separate;
	  border-spacing: 0;
	  width: 100%;
	  
	}
	#table th, #table td {
	  text-align : center;
	  vertical-align : middle;
	}
	th {
	  background: #42444e;
	  color: #fff;
	}
	tr:first-child th:first-child {
	  border-top-left-radius: 6px;
	}
	tr:first-child th:last-child {
	  border-top-right-radius: 6px;
	}
	tr{
		 height : 50px;
	}
	td {
	  border-right: 1px solid #c6c9cc;
	  border-bottom: 1px solid #c6c9cc;
	  height : 100px;
	  margin : auto;
	}
	td:first-child {
	  border-left: 1px solid #c6c9cc;
	}
	tr:nth-child(even) td {
	  background: #eaeaed;
	}
	tr:last-child td:first-child {
	  border-bottom-left-radius: 6px;
	}
	tr:last-child td:last-child {
	  border-bottom-right-radius: 6px;
	}
	
	.modalBtn a{
		padding : 10px;
	}
	#table .accName:hover{
		cursor : pointer;
		text-decoration : underline;
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
	    <div id="table">
		        <h1>숙소 예약리스트</h1>
		        <table>
		        <thead>
		            <tr>
		                <th>예약 번호</th>
		                <th>숙소 유형</th>
		                <th>숙소명</th>
		                <th>예약 일자</th>
		                <th>결제금액</th>
		                <th>결제일</th>
		                <th></th>
		            </tr>
		         </thead>
		         <tbody>
		         	<c:forEach var="a" items="${list}">
		            <tr>
		                <td class="orderNo">${a.orderNo}</td>
		                <td>${a.category }</td>
		                <td class="accName">${a.accName }</td>
		                <td>${a.startDate } ~${a.endDate }</td>
		                <td>${a.price }원</td>
	                	<td>${a.paymentDate}</td>
	                	<c:choose>		                		
	                		<c:when test="${a.status eq 'R'}">
	                			 <td><a href="reviewEnrollForm.hj">후기작성</a></td>
	            			</c:when>
	            			<c:when test="${a.status eq 'S'}">
	            				<td>
		            				<a class="select-review" href="#ex2" rel="modal:open">후기보기</a>
		            				<input type="hidden" name="orderNo" value="${a.orderNo }">
	            				</td>
	            			</c:when> 
	            			<c:when test="${a.status eq 'Y'}">
	              				 <td><a href="#ex1" rel="modal:open">예약취소</a></td>
	            			</c:when>
	            			<c:otherwise>
	              				 <td>취소된 예약</td>
	            			</c:otherwise>
	            		</c:choose>
		            </tr>
		            </c:forEach>
	            </tbody>
		        </table>
		       
		    </div>
		    <div id="ex1" class="modal">
		    	<ul>
		    		<h5 style="font-weight:600;">취소 시 환불금액</h5>
		    		<li style="font-size:20px;">190,000원</li>
		    	</ul>
		    	<br>
			    <ul>
		    		<h5 style="font-weight:600;">환불규정</h5>
		    		<li>
		    		<p>
		    		- 체크인 3일 전 : 무료 취소 <br>
					- 체크인 2일 전 ~ 당일 : 취소 환불 불가  <br>
					- 취소요청 이후에는 취소의 철회가 불가능합니다.  <br>
					- 구매당일 취소시에도 환불 규정에 따라 취소 수수료가 부과됩니다.  <br>
					</p>
					</li>
		    	</ul>
		    	<br>
			  <p style="font-size:25px; font-weight:600;">동의하시겠습니까?</p>
			 
			 <div class="modalBtn" style="float:right;">
			  <a href="#" >넹</a>
			  <a href="#" rel="modal:close">아니용</a>
			  </div>
		</div>

    </div>
    
		 <div id="ex2" class="modal">
		    	<br>
			    <ul class="review-area">
		    	
		    	</ul>
		    	<br>

			 <div class="modalBtn" style="float:right;">
			  <a href="#" >수정</a>
			  </div>
		</div>
    <script>
    $(function(){
    	$('#table .accName').click(function(){
    		
    		var $this = $(this);
    		var orderNo = $this.siblings('td[class=orderNo]').text();
    		
    		location.href ="accomBookDetail.hj?orderNo="+orderNo;
    	})
    })
    
    $('.select-review').click(function(){
		
    	console.log($(this));
    	
		$.ajax({
			url : 'selectAccommReview.hj',
			data : {orderNo : $(this).siblings('input[name=orderNo]').val()},
			success : function(result){
				let value = '';
				
				console.log(result);
				value += '<h5 style="font-weight:600; font-size:25px;">내 후기</h5>'
		    		  + '<hr>'
		    		  + '<li><h3>' + result.accommName + '</h3></li>'
		    		  + '<li style="font-size: 15px;">' + result.createDate + '|' +  result.roomName + '</li>'
		    		  + '<li style="padding:10px;">' + result.content + '</li>'
		    		  + '<li>' + result.tag + '</li>'
		    		  + '<li style="display:flex;"><img src="' + result.filePath + '"width="100px"></li>';
					
					
					  $('#ex2 .review-area').html(value);
					  
			},
			error : function(){
				console.log('실패');
			}
		})
    })
    
    </script>
</body>
</html>
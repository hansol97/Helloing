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
	
	#ex1 li span{
	    color: white;
	    background: gray;
	    margin: 5px;
	    border-radius: 5px
	}
	#ex1 li img{
		padding:10px;
	}
	#table .actName:hover{
		cursor : pointer;
		text-decoration : underline;
	}
		.review-accomm-name{
	    font-size: 20px;
    	font-weight: 600;
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
		        <h1>액티비티 결제 리스트</h1>
				
		        <table>
		        <thead>
		            <tr>
		                <th>결제 번호</th>
		                <th>액티비티명</th>
		                <th>결제금액</th>
		                <th>결제일자</th>
		                <th></th>
		            </tr>
		         </thead>
		         <tbody>
		         <c:forEach var="a" items="${list}">
		            <tr>
		                <td class="orderNo">${a.orderNo }</td>
		                <td class="actName">${a.activityName }</td>
		                <td>${a.ticketSum }원</td>
		                <td>${a.paymentDate }</td>
	                	<c:choose>		                		
	                		<c:when test="${a.status eq 'R'}">
	                			 <td>
	                			 	<a class="reviewEnrollForm">후기작성</a>
	                			 	<input type="hidden" name="orderNo" value="${a.orderNo }" class="orderNo">
	            					</td>
	            			</c:when>
	            			<c:when test="${a.status eq 'S'}">
	            				<td>
	            					<a class="select-review" href="#ex2" rel="modal:open">후기보기</a>
	            					<input type="hidden" name="orderNo" value="${a.orderNo }">
	            				</td>
	            			</c:when> 
	            			<c:otherwise>
	            			<td></td>
	            			</c:otherwise>
	            		</c:choose>		            
            		</tr>
		         </c:forEach>
	            </tbody>
		        </table>
		       
		    </div>
		    <div id="ex2" class="modal">
		    	<br>
			    <ul class="review-area">
		   
		    	</ul>
		    	<br>
				<a class="review-delete">삭제</a>
		</div>

    </div>
    <script>
    $(function(){
    	$('#table .actName').click(function(){
    		
    		var $this = $(this);
    		var orderNo = $this.siblings('td[class=orderNo]').text();
    		
    		location.href ="activityBookDetail.hj?orderNo="+orderNo;
    	})
    })
    
      $('.select-review').click(function(){
		
		$.ajax({
			url : 'selectActivityReview.hj',
			data : {orderNo : $(this).siblings('input[name=orderNo]').val()},
			success : function(result){
				
				let star = '';
				for(var i = 0; i<result.star; i++){
					star += '⭐'
				}
				
				let value = '';
				
				console.log(result);
				value += '<h5 style="font-weight:600; font-size:25px;">내 후기</h5>'
		    		  + '<hr>'
		    		  + '<li><h3 class="review-accomm-name">' + result.activityName + '</h3></li>'
		    		  + '<li style="font-size: 15px;">' + result.createDate + '|' +  result.ticketName + '</li>'
		    		  + '<li>' + star + '</li>'
		    		  + '<li style="padding:10px;">' + result.reviewContent + '</li>'
		    		  + '<li>' + result.tag + '</li>'
		    		  + '<li style="display:flex;"><img src="' + result.filePath + '"width="100px"></li>'
		    		  + '<input type="hidden" class="reviewNo" name="reviewNo" value="' + result.reviewNo +  '">'
		    		  + '<input type="hidden" class="filePath" name="filePath" value="' + result.filePath + '">';
					
					
					  $('#ex2 .review-area').html(value);
					  
			},
			error : function(){
				console.log('실패');
			}
		})
    })
    
    $('.reviewEnrollForm').click(function(){
		
		var $this = $(this);
		var orderNo = $this.siblings('input[name=orderNo]').val();
		
		location.href="reviewActivityEnrollForm.hj?orderNo="+orderNo;
    })
    
    
   $(function(){
    	$('.review-delete').click(function(){
    		var $this = $(this);
    		
    		var reviewNo = $this.siblings('.review-area').children('.reviewNo').val();
    		var filePath = $this.siblings('.review-area').children('.filePath').val();
			
    		location.href="deleteActivityReview.hj?reviewNo="+reviewNo+ "&filePath=" + filePath
    		
    	})
    })
    </script>
</body>
</html>
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
		                <td>${a.orderNo}</td>
		                <td>${a.category }</td>
		                <td class="accName">${a.accName }</td>
		                <td>${a.startDate } ~${a.endDate }</td>
		                <td>${a.price }원</td>
	                	<c:choose>		                		
	                		<c:when test="${a.status eq 'R'}">
	                			 <td><a href="reviewEnrollForm.hj">후기작성</a></td>
	            			</c:when>
	            			<c:when test="${a.status eq 'S'}">
	            				<td><a href="#ex2" rel="modal:open">후기보기</a></td>
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
			    <ul>
		    		<h5 style="font-weight:600; font-size:25px;">내 후기</h5>
		    		<hr>
		    		<li><h3>[팔로우미투어]가우디투어</h3></li>
		    		<li>⭐⭐⭐⭐⭐<li>
		    		<li style="font-size: 15px;">2023-01-01 | 성인 2매</li>
		    		<li style="padding:10px;">가이드분이 친절하셨어요~</li>
		    		<li><span>친절해요</span><span>위치가 찾기 쉬워요</span></li>
		    		<li style="display:flex;"><img src="/helloing/resources/img/logo_outline.png" alt="" width="100px">
		    		<img src="/helloing/resources/img/logo_outline.png" alt="" width="100px">
		    		<img src="/helloing/resources/img/logo_outline.png" alt="" width="100px"></li>
		    	</ul>
		    	<br>

			 <div class="modalBtn" style="float:right;">
			  <a href="#" >수정</a>
			  </div>
		</div>
    <script>
    $(function(){
    	$('#table .accName').click(function(){
    		location.href ="reservationDetail.hj";
    	})
    })
    
    </script>
</body>
</html>
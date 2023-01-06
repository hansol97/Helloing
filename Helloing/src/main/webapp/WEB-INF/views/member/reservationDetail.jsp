<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 상세 페이지</title>
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
		<br><br>
		<h1>예약 상세 페이지</h1>
			<div id="datail_mem">
				<ul>
					<h2>예약자 정보</h2>
					<li>박혜진</li>
					<li>01041396013</li>
					<li>qkrgpwls6013@gmail.com</li>
				</ul>
			</div>
		
		</div>
	</div>
</body>
</html>
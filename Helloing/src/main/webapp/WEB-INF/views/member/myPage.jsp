<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>

	.sidebar{
		height: 100%;
		margin: auto;
		display: block;
	}
	.outer{
		width : 200px;
		padding : 20px;
        border-right: 1px solid lightgray;
	}
    .outer h2{
        font-weight: 600;
        font-size: 25px;
        padding : 10px;
    }
    .outer .category{
    	padding-bottom :10px;
    }
    .outer ul li{
    	padding : 5px;
    }
	.outer .sidebar ul li a{
	 font-size : 15px;
	}    
</style>
</head>
<body>
	
	<div class="sidebar">
	    <div class="outer">
	    
	        <div class="category" id="book">
		    <h2>나의 예약정보</h2>
			<ul>
		        <li><a href="scheduled.hj">예정된 예약</a></li>
		        <li><a href="last.hj">지난 예약</a></li>
		        <li><a href="cancelled.hj">취소된 예약</a></li>
		    </ul>
	        </div>
	
	        <div class="category" id="user">
	            <h2>나의 계정정보</h2>
	            <ul>
	                <li><a href="pwdMatchingForm.hj">회원 정보 수정</a></li>
	                <li><a href="tripReviewList.hj">나의 여행 리뷰 조회</a></li>
	                <li><a href="">찜한 숙소 조회</a></li>
	                <li><a href="">찜한 액티비티 조회</a></li>
	            </ul>
	        </div>
	
	        <div class="category" id="planner">
	            <h2>My Planner</h2>
	            <ul>
	                <li><a href="">나의 여행</a></li>
	            </ul>
	        </div>
	
	        <div class="category" id="cs">
	            <h2>고객센터</h2>
	            <ul>
	                <li><a href="">1:1 문의 내역</a></li>
	            </ul>
	        </div>
	    </div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 모달창 관련 cdn -->
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
		        <h1>나의 여행 리뷰 조회</h1>
				
		        <table>
		        <thead>
		            <tr>
		                <th width="60px">글번호</th>
		                <th>제목</th>
		                <th width="100px">게시날짜</th>
		                <th width="60px">조회 수</th>
		                <th width="70px">좋아요 수</th>
		            </tr>
		        <thead>
		        <tbody>
		            <tr>
		                <td>2023</td>
		                <td>전주 너무 좋다 하하 비빔밥 최고</td>
		                <td>2023-01-29</td>
		                <td>1</td>
		                <td>1</td>
		            </tr>
		            <tr>
		                <td>2023</td>
		                <td>남원 재밌어여</td>
		                <td>2023-01-29</td>
		                <td>1</td>
		                <td>1</td>
		            </tr>
		            <tr>
		                <td>2023</td>
		                <td>전라도 여행중 ~ ^^</td>
		                <td>2023-01-29</td>
		                <td>1</td>
		                <td>1</td>
		            </tr>
		        </tbody>
		        </table>
		    </div>

    </div>
    
    <script>
    $(function(){
    	$('#table td').click(function(){
    		location.href ="";
    	})
    })
    
    </script>
</body>
</html>
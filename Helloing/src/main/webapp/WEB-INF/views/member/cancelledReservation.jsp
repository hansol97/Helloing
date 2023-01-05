<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		        <h1>취소된 예약</h1>
				
		        <table>
		            <tr>
		                <th>예약 번호</th>
		                <th>예약 유형</th>
		                <th>예약명</th>
		                <th>예약 일자</th>
		                <th>결제금액</th>
		            </tr>
		            <tr>
		                <td>20230103-111111</td>
		                <td>숙소</td>
		                <td>OO호텔</td>
		                <td>2023-01-29 ~ 2023-01-29</td>
		                <td>198,000원</td>
		            </tr>
		            <tr>
		                <td>20230103-111111</td>
		                <td>숙소</td>
		                <td>OO호텔</td>
		                <td>2023-01-29 ~ 2023-01-29</td>
		                <td>198,000원</td>
		            </tr>
		            <tr>
		                <td>20230103-111111</td>
		                <td>숙소</td>
		                <td>OO호텔</td>
		                <td>2023-01-29 ~ 2023-01-29</td>
		                <td>198,000원</td>
		            </tr>
		        </table>
		    </div>
    </div>
</body>
</html>
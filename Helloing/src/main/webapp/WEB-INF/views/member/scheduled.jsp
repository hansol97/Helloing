<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="out">
		<div class="include">
			<jsp:include page="../member/myPage.jsp"/>
		</div>
	    <div id="">
	        <h1>예정된 예약</h1>
	
	        <table border="1">
	            <tr>
	                <th>예약 번호</th>
	                <th>예약 유형</th>
	                <th>예약명</th>
	                <th>예약 일자</th>
	                <th>결제금액</th>
	                <th></th>
	            </tr>
	            <tr>
	                <td>20230103-111111</td>
	                <td>숙소</td>
	                <td>OO호텔</td>
	                <td>2023-01-29 ~ 2023-01-29</td>
	                <td>198,000원</td>
	                <td><a href="#">예약취소</a></td>
	            </tr>
	            <tr>
	                <td>20230103-111111</td>
	                <td>숙소</td>
	                <td>OO호텔</td>
	                <td>2023-01-29 ~ 2023-01-29</td>
	                <td>198,000원</td>
	                <td><a href="#">예약취소</a></td>
	            </tr>
	            <tr>
	                <td>20230103-111111</td>
	                <td>숙소</td>
	                <td>OO호텔</td>
	                <td>2023-01-29 ~ 2023-01-29</td>
	                <td>198,000원</td>
	                <td><a href="#">예약취소</a></td>
	            </tr>
	        </table>
	    </div>
    </div>
</body>
</html>
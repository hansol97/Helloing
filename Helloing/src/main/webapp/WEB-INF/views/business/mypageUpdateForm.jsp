<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.business-info{ text-align: center; }
.business-info h1{ font-size: 35px; font-weight: bold; margin-bottom: 60px; }
.business-info table{ 
	margin: auto; 
	text-align: left; 
	font-size: 20px;
	margin-bottom: 60px;
}
.business-info table th, .business-info table td{
	padding: 10px 20px;
}
.business-info>button{
	font-size: 20px;
	font-weight: bold;
	padding: 10px 20px;
	background-color: #053E99;
	color: white;
	border: 0;
	border-radius: 3px;
	margin: 0px 20px;
}
.business-info table input{
	width: 100%;
	height: 25px;
}
.business-info table button{
	width: 40px;
	height: 30px;
	background-color: #053E99;
	color: white;
	border: 0;
	border-radius: 3px;
}
#btn-cancle{
	background-color: lightgray;
	color: gray;
}
</style>
</head>
<body>
	<jsp:include page="menubar_business.jsp"/>
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
		<div class="business-info">
			<h1>기업 정보 수정</h1>

			<table>
				<tr>
					<th>아이디</th>
					<td>business1</td>
				</tr>
				<tr>
					<th>사업자명</th>
					<td>사업자1</td>
				</tr>
				<tr>
					<th>사업자 번호</th>
					<td>222-22-22222</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" value="010-0000-0000"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" value="서울시 중구"></td>
					<td><button type="button">검색</button></td>
				</tr>
			</table>

			<button type="button" id="btn-cancle">취소</button>
			<button>저장</button>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>

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
.business-info a{
	font-size: 20px;
	font-weight: bold;
	padding: 10px 20px;
	background-color: #053E99;
	color: white;
	border-radius: 3px;

}
</style>
</head>
<body>
	<jsp:include page="menubar_business.jsp"/>
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
		
		<div class="business-info">
			<h1>기업 정보 조회</h1>

			<table>
				<tr>
					<th>사업자명</th>
					<td>${loginCompany.businessName}</td>
				</tr>
				<tr>
					<th>사업자 번호</th>
					<td>${loginCompany.businessNo}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${loginCompany.address}</td>
				</tr>
			</table>

			<a href="mypageEnroll.bu">편집</a>
		</div>
		
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>
<style>
.content{ text-align: center; }
.content h1{ font-size: 50px; font-weight: bold; margin: 100px 0px 200px 0px; }
.content a{ 
	font-size: 20px; 
	color: white; 
	background-color: #053E99;
	padding: 10px 50px;
	border-radius: 3px;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/>
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
		<div class="content">
			<h1>💵결제 완료되었습니다.💵</h1>
			<a href="">메인으로</a>
		</div>
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업파트너등록 전 로그인 화면</title>
<style>
.loginPage-button>a{

	width: 150px;
	height: 40px;
	font-weight: bold;	
	color: white;
	background-color: #053E99;
	border: 0;
	border-radius: 3px;
	text-align : center;

}
a:hover{
	color: #FFEA24;
	cursor: pointer;
}
</style>
</head>
<body>

	<jsp:include page="../common/menubar_user.jsp"/>
	<br><br><br><br><br><br><br>
	<div class="inner" align="center">
		<div class="movePage">
			<div class="logo-Img">
				<img src="/helloing/resources/img/logo_outline.png" alt="logo" >
			</div>
			<h1>로그인 후 기업 파트너 등록이 가능합니다.</h1>
			<h3>로그인 페이지로 이동해 주세요</h3>
			<br>
			<div class="loginPage-button">
				<a href="login.me">로그인 이동</a>
			</div>
		</div>
	</div>
</body>
</html>
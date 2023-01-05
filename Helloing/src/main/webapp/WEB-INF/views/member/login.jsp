<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<style>
.outer {
	display: inline-flex;
	width: 1200px;
	justify-content: center;
	margin-top: 200px;
}
.info-box{
	margin-left: 300px;
}
.info-title{
	font-size: large;
	font-weight: 900;
	text-align: center;
}

.info-content{	
	width: 440px;
}
.login-box{
	margin-left: 50px;
}
#login-pwd, #login-id {
	width: 95%;
height: 30px;
font-size: larger;

}

.login-button{
	width: 80%;
	height: 50px;
}
.login-button{

width: 100%;
height: 40px;
font-weight: bold;	
color: white;
background-color: #053E99;
border: 0;
border-radius: 3px;

}
button:hover{
	color: #FFEA24;
	cursor: pointer;
}

</style>
</head>
<body>

	<jsp:include page="../common/menubar_user.jsp"/>
	<br><br><br><br>
	<div class="outer">
		<div class="info-box">
			<div class="info-innor">
				<div class="info-img" align="center">
					<img src="/helloing/resources/img/logo_outline.png" alt="logo" >
				</div>
				<div class="info-title">
					함께 써가는 전라도기행
				</div>
				<div class="info-content">	
					전라도는 전라북도와 전라남도, 광주광역시, 제주특별자치도를 관할했던 
					행정구역으로 호남 지방에 해당한다. 
				</div>
			</div>
		
		</div>
		<div class="login-box">
			<div class="login-innor">
				<form id="login.me" action="login.me" method="post" >
					<input id="login-id" type="text" name="memId" placeholder="아이디" required>
					<br><br>
					<input id="login-pwd" type="password" name="memPwd" placeholder="비밀번호" required>
					<br>
					<input type="checkBox" id="idCheck">&nbsp;&nbsp;<label for="idCheck" >아이디 체크</label>
					<br><br>
					<button type="submit" class="login-button" >로그인</button>
					<br>
					<a href="findIdForm.me">아이디찾기 </a>
					&nbsp;/&nbsp;
					<a href="#"> 비밀번호찾기</a>
					<br>
					<a href="#">회원가입</a>
				</form>
			</div>	
		

		</div>
	
	</div>
	
</body>
</html>
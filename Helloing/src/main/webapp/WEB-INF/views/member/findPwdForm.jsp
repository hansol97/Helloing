<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 폼</title>
<style>

.findButton{

width: 310px;
height: 40px;
font-weight: bold;	
color: white;
background-color: #053E99;
border: 0;
border-radius: 3px;

}
.findButton:hover{
	color: #FFEA24;	
	cursor: pointer;
}





.findPwd-form label{
font-size: larger;
font-weight: 800;
padding-right: 50px;
}
.findPwd-form input{
font-weight: 800;

}


.authNum{
margin-top: 10px;
margin-left: 110px;
}
.authButton{
background-color: rgb(190, 190, 190);
width: 50px;
height: 30px;
margin-top: 5px;
margin-left: 265px;
border: 1px solid black;	
}
.authButton:hover {
	cursor: pointer;
}

</style>
</head>	
<body>	

	<jsp:include page="../common/menubar_user.jsp"/>
	
	
	
	<div class="innor" align="center">
	
	<br><br><br><br>
	<h1> 비밀번호 찾기 </h1>
	<br><br><br><br>	
		
		
		<div class="findPwd-form">
			<div class="findPwd-box">
				<form action="findPwd.me" method="post">

					<label for="memName"> 이름&nbsp;&nbsp;&nbsp;&nbsp; </label>        
					<input type="text" class="findName" id="memName" name="memName" required>
					
					<br><br><br>
					
					<label for="memPwd"> 아이디  </label>        
					<input type="text" class="findPwd" id="memPwd" name="memPwd" required>
					
					<br><br><br>
					
					<label for="email"> 이메일  </label>
					<input type="email" class="findEmail" id="email" name="email" required>	
					<br>
					<input type="text" class="authNum" id="authNum" name="authNum" required placeholder="인증번호">
					<br>
					<button type="button" class="authButton" onclick="authNum();" >인증</button>	
					<br><br><br><br>

					<button type="submit" class="findButton"> 비밀번호 찾기 </button>
					
				</form>
			</div>
		
		</div>
	

        

	
	
	
	
	</div>	

</body>
</html>
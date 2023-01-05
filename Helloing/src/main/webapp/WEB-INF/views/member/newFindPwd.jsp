<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 비밀번호 설정 -비밀번호찾기 후-</title>
<style>

.newFindPwd-form button{

width: 310px;
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

.newFindPwd-form label{
font-size: larger;
font-weight: 800;
padding-right: 50px;
}
.newFindPwd-form input{
font-weight: 800;

}

</style>
</head>
<body>

	<jsp:include page="../common/menubar_user.jsp" />
	
	<div class="newFindPwd-form" align="center">
	
	<br><br><br><br>
	<h1> 새 비밀번호 등록 </h1>
	<br><br><br><br>
	
		<div class="newFindPwd-box">
			<form action="newFindPwd.me" method="post">
				
				<label for="memId"> 새 비밀번호  </label> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     
				<input type="text" class="newFindPwd" id="newPwd" name="memPwd" required>
				
				<br><br><br>
				
				<label for="checkPwd"> 새 비밀번호 확인  </label>
				<input type="password" class="newFindPwd" id="checkPwd"  required>	

				<br><br><br><br>

				<button type="submit"> 새 비밀번호 등록 </button>
				
			</form>
		</div>
	
	</div>
</body>
</html>
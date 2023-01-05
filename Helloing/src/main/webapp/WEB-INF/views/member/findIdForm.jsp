<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 폼</title>
<style>

.findId-form button{

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





.findId-form label{
font-size: larger;
font-weight: 800;
padding-right: 50px;
}
.findId-form input{
font-weight: 800;

}

</style>
</head>	
<body>

	<jsp:include page="../common/menubar_user.jsp"/>
	
	
	
	<div class="innor" align="center">
	
	<br><br><br><br>
	<h1> 아이디 찾기 </h1>
	<br><br><br><br>	
		
		
		<div class="findId-form">
			<div class="findId-box">
				<form action="findId.me" method="post">
					
					<label for="memId"> 아이디  </label>        
					<input type="text" class="findId" id="memId" name="memId" required>
					
					<br><br><br>
					
					<label for="email"> 이메일  </label>
					<input type="email" class="findEmail" id="email" name="email" required>	

					<br><br><br><br>

					<button type="submit"> 아이디 찾기 </button>
					
				</form>
			</div>
		
		</div>
	

        

	
	
	
	
	</div>	

</body>
</html>
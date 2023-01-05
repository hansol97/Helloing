<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 폼</title>
<style>

 
</style>
</head>
<body>

	<jsp:include page="../common/menubar_user.jsp"/>
	
	<br><br><br><br>
	<div class="innor" align="center">	
		<div class="findId-form">
			<form action="findId.me" method="post">
				<label for="memId"> 아이디 : </label>        
                <input type="text" class="findId" id="memId" placeholder="아이디" name="memId" required>
				
				<br><br><br>
				
				<label for="email"> 이메일 : </label>
				<input type="email" class="findEmail" id="email" placeholder="이메일" name="email" required>	
			</form>
		
		
		</div>
	

        

	
	
	
	
	</div>	

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	
#enroll-form table {
   border-collapse: separate;
   border-spacing: 10px 30px;
}
#enroll-form input{
  height: 25px;
}
.join-button{
	width: 200px;
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
.emailCheck{
height: 30px;

}

</style>
<body>
	
	<jsp:include page="../common/menubar_user.jsp"/>
	
	<br><br>

	<div class="out" align="center">
		
			<br><br><br><br>
			<h1>회원가입</h1>
			<br>
			<!-- 
			<form action="insert.me" id="enroll-form" method="post">
				<label for="memId"> 아이디 &nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="text" id="memId" placeholder="아이디입력" name="memId" required maxlength="12">
				</label>
				<br><br>
				<label for="memPwd"> 비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="password" id="memPwd" placeholder="비밀번호입력" name="memPwd" required>
				</label>
				<br><br>
				<label for="memName"> 이름 &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" id="memName" placeholder="이름입력" name="memName" required> 
				</label>
				<br><br>
				<label for="email"> 이메일 &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="email" id="email" name="email" required>
				</label>
				<br><br>
				<label for="phone" > 핸드폰번호 &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" id="phone" name="email" required>
				</label>
				<br><br><br><br>
				<button type="submit">회원가입</button>
			</form>
			 -->

			 <div>
				<img src="/helloing/resources/img/logo_outline.png" alt="logo" >
			 </div>
			<form action="insert.me" method="post" id="enroll-form"> 
				<table>
					<tr>
						<td> 아이디 &nbsp;&nbsp;</td>
						<td><input type="text" name="memId" maxlength="20" required></td>
						<td id="checkId" width="80"></td>
					</tr>
					<tr>
						<td> 비밀번호 &nbsp;&nbsp;</td>
						<td><input type="password" name="memPwd" maxlength="20" required></td>
					</tr>
					<tr>
						<td> 이름  &nbsp;&nbsp;</td>
						<td><input type="text" name="memName" required></td>
					</tr>
					<tr>
						<td> 이메일  &nbsp;&nbsp;</td>
						<td><input type="email" name="email" required></td>
						<!-- <td><button class="emailCheck" onclick="emailCheck">인증</button></td> -->
					</tr>
					<!--  
					<tr>
						<td> 이메일 인증 &nbsp;&nbsp;</td>
						<td><input id="checkEmail" class="emailCheck" size=3 maxlength=5></td>
					</tr>
					-->
					<tr>
						<td> 핸드폰번호  &nbsp;&nbsp;</td>
						<td><input type="text" name="phone" placeholder="(-)를포함시켜주세요" required></td>
					</tr>
				</table>
				<button type="submit" class="join-button">회원가입</button>
			</form>
			
			
			
			
			
			
			
			
			
			
			<script>
				$(function(){
					$(document).on('focusout', 'input[name=memId]', function(){
						$('#checkId').text($('input[name=memId]').val())
					})
				})
			</script>
			
			
			
			

	</div>
</body>
</html>
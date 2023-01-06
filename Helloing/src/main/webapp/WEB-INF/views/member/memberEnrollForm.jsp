<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

</style>
<body>
	
	<jsp:include page="../common/menubar_user.jsp"/>
	
	<br><br>

	<div class="out" align="center">
		
			<br><br><br><br>
			<h1>회원가입</h1>
			<br><br><br><br>
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
			<form action="insert.me" method="post" id="enroll-form"> 
				<table>
					<tr>
						<td> 아이디 &nbsp;&nbsp;</td>
						<td><input type="text" name="memId" maxlength="20" required></td>
						<td id="checkResult" width="80"></td>
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
						<td><input type="email" name="memName" required></td>
						<div>dddd</div>
					</tr>
					<tr>
						<td> 핸드폰번호  &nbsp;&nbsp;</td>
						<td><input type="text" name="memName" required></td>
					</tr>
	
				</table>
			</form>
			
			
			
			
			
			
			
			
			
			
			<script>
				$(function(){
					$(document).on('focusout', 'input[name=memId]', function(){
						$('#checkResult').text($('input[name=memId]').val())
					})
				})
			</script>
			
			
			
			

	</div>
</body>
</html>
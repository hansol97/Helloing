<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<style>
	/* 구조 관련 */
	.out{
		width : 1200px; 
		height : 100%;
		margin : auto;
		position: relative;
	}
	.out .include{
		width : 300px;
		float : left;
	}

	/*  */
	.detail{
		width : 900px;
		float : left;
		margin: 0 auto;
		position: absolute;
  		left: 80%;
		top: 5%;
  		transform: translateX(-50%);
	}
	.detail h2{
		font-size: 25px;
		font-weight: 600;
		padding-left: 110px;
		padding-bottom: 70px;
	}

	#enrollForm{
		border: 1px solid lightgray;
		border-radius: 10px;
		width: 400px;
		height: 150px;
	}
	#enrollForm h6{
		font-size: 20px;
		padding: 20px;
		text-align: center;
	}
	#enrollForm form{
		text-align: center;

	}
	#enrollForm input{
		border: 1px solid darkgray;
		border-radius: 10px;
		height: 30px;
		width: 250px;
		margin-left: 10px;
		
	}
	#enrollForm input:focus{
		border-color:#053E99;
	}

	#btn{
		font-family: 'S-CoreDream-3Light';
		font-size: 15px;
		border: 0.1px solid darkgray;
		border-radius: 10px;
		width: 60px;
		height: 34px;
		background-color: snow;
	}
	#btn:hover{
		background-color:#002ead;
		color: white;
    	transition: 0.7s;
	}


</style>
</head>
<body>
	
	<jsp:include page="../common/menubar_user.jsp"/>
	<br><br>

	<div class="out">
		<div class="include">
			<jsp:include page="../member/myPage.jsp"/>
		</div>
		<div class="detail">
			<h2>회원정보 수정</h2>
			회원님의 소중한 개인정보를 안전하게 보호하기 위해 <br>
			&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
			다시 한번 인증해주세요.
			<br><br><br>

			<div id="enrollForm">
				<form action="memberUpdateForm.hj" method="post">
					<h6>비밀번호</h6> 
					<input type="hidden" name="memId" value="${loginUser.memId}">
					<input type="password" name="memPwd" placeholder="비밀번호를 입력해주세요.">
					<button id="btn" type="submit">확인</button>
				</form>
			</div>
		</div>
	</div>	


</body>
</html>
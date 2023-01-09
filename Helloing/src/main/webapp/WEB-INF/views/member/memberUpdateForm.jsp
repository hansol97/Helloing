<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
</head>
<style>
	/* 구조 관련 */
	.out{
		width : 1200px; 
		height : 100%;
		margin : auto;
	}
	.out .include{
		width : 300px;
		float : left;
	}
	#right{
		width: 900px;
		float: left;
	}
	#title{
		font-size: 25px;
		font-weight: 600;
		padding-left: 50px;

	}
	#enrollForm{
		border: 1px solid lightgray;
		border-radius: 10px;
		width: 800px;
		height: 500px;
		margin: auto;
	}
	.form-group{
		padding: 20px;
	}
	#enrollForm form{
		padding: 10px;
	}
	#submit_btn{
		float: right;
	    padding-right: 10px;
		padding-top: 50px;
	} 
	#submit_btn button{
		font-family: 'S-CoreDream-3Light';
		font-size: 15px;
		border: 0.1px solid darkgray;
		border-radius: 10px;
		width: 120px;
		height: 40px;
		background-color: snow;		
	}
	#submit_btn button:hover{
		background-color:#002ead;
		color: white;
    	transition: 0.7s;
	}
	.form-title{
		font-weight: 600;
		padding-right: 50px;
	}

	.form-pwd a{
		font-family: 'S-CoreDream-3Light';
		font-size: 15px;
		width: 150px;
		height: 100px;
	}
	.form-pwd a:hover{
		text-decoration: underline;
		cursor: pointer;
	}
	.form-input input{
		width: 150px;
		height: 30px;
		border: 1px solid darkgray;
		border-radius: 10px;
	}
	#ex1 input{
		width: 150px;
		height: 30px;
		border: 1px solid darkgray;
		border-radius: 10px;
	}
	.pwdForm{
		padding:10px;
	}
</style>
<body>
	
	<jsp:include page="../common/menubar_user.jsp"/>
	<br><br>

	<div class="out">
		<div class="include">
			<jsp:include page="../member/myPage.jsp"/>
		</div>
		<div id="right">
		<br>
			<div id="title">
				<h2>회원 정보 수정</h2>
			</div>
			<br><br>
			<div id="enrollForm">
			<form action="" method="post">
				<div class="form-group">
					<span class="form-title">아이디</span>
					<span class="form-fix">${loginUser.memId}</span>
				</div>	
				<div class="form-group">
					<span class="form-title">비밀번호</span>
					<span class="form-pwd"><a href="#ex1" rel="modal:open">비밀번호 변경하기</a></span>
				</div>	
				<div class="form-group">
					<span class="form-title">이름</span>
					<span class="form-fix">${loginUser.memName}</span>
				</div>	
				<div class="form-group">
					<span class="form-title">핸드폰번호</span>
					<span class="form-input"><input type="text" placeholder="${loginUser.phone}"></span>
				</div>	
				<div class="form-group">
					<span class="form-title">이메일</span>
					<span class="form-input"><input type="text" placeholder="${loginUser.email}"></span>
				</div>

				<br>
				<span id="submit_btn">
				<button type="submit">수정</button>
				</span>
			</form>	
			</div>
		</div>
	</div>
	

	<div id="ex1" class="modal">
		<br>
	<form action="updatePwd.hj" method="post">
			<div class="pwdForm">
			<h5 style="font-weight:600;">현재 비밀번호 입력</h5>
			<input type="password" name="memPwd">
			</div>
			<div class="pwdForm">
			<h5 style="font-weight:600;">변경할 비밀번호 입력</h5>
			<input type="password" name="memNewPwd">
			</div>
			<div class="pwdForm">
			<h5 style="font-weight:600;">변경할 비밀번호 재입력</h5>
			<input type="password" name="memNewPwd2">
			</div>
		<br>
	 
		<div class="modalBtn" style="float:right;">
		  <button id="update-btn" type="submit" disabled>변경하기</button>
		</div>
  	</form>
	
	<button onclick="pwdMatch();">비밀번호 확인</button>
  	
  	<script>
  			function pwdMatch(){
	  			if(($('input[name=memNewPwd]').val()) == ($('input[name=memNewPwd2]').val())){
	  				$('#update-btn').removeAttr('disabled');
	  			}else{
					$('#update-btn').attr('disabled', true);
					alert('비밀번호가 일치하지 않습니다.');
					
  			}
  		}
  	
  	</script>
</body>
</html>
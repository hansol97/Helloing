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
.findId-button{
	margin-left: 20px;
}

</style>
</head>
<body>

	<jsp:include page="../common/menubar_user.jsp"/>
	<br><br><br><br>
	<div class="outer">
		<div class="info-box">
			<div class="info-inner">
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
				<form id="login" action="login.me" method="post" >
					<input id="memId" type="text" name="memId" placeholder="아이디" required >
					<br><br>
					<input id="memPwd" type="password" name="memPwd" placeholder="비밀번호" required>
					<br>
					<input type="checkBox" id="idCheck">&nbsp;&nbsp;<label for="idCheck" >아이디 저장</label>
					<br><br>
					<button type="submit" class="login-button" id="btn-login" onclick="login();">로그인</button>
					<br>
					<a href="findIdForm.me" class="findId-button">아이디찾기 </a>
					&nbsp;/&nbsp;
					<a href="findPwdForm.me"> 비밀번호찾기</a>
				</form>
			</div>	
		

		</div>
	
	</div>
	
	<script>
	$(function(){
	    /* id 저장 체크박스 기능 추가 */
	    var userInputId = getCookie("idCheck");//저장된 쿠기값 가져오기
	    $("#manager_id").val(userInputId); 

	    if($("#manager_id").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
	        $("#useCookie").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }

	    $("#useCookie").change(function(){ // 체크박스에 변화가 발생시
	        if($("#useCookie").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("#manager_id").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });

	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("#manager_id").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#useCookie").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("#manager_id").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
	
	
	</script>
	

</body>
</html>
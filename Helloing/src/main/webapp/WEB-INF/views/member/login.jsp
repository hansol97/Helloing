<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					
					<!-- cookie.saveId 쿠키의 네임속성값-->
					<!-- cookie.saveId.value 쿠키의 네임속성값.value 쿠키의 value를 출력할수있다. -->
					<c:choose>
						<c:when test="${ not empty cookie.saveId }">
							<input type="text" id="memId" name="memId" placeholder="아이디" required value="${ cookie.saveId.value }"><br>
							<input id="memPwd" type="password" name="memPwd" placeholder="비밀번호" required><br>
							<input type="checkbox" id="idCheck" class="idCheck" name="idCheck" checked><label for="idCheck" >아이디 저장</label><br><br>
							<br>
						</c:when>
						<c:otherwise>
							<input type="text" id="memId" name="memId" placeholder="아이디" required><br>
							<input id="memPwd" type="password" name="memPwd" placeholder="비밀번호" required><br>
							<input type="checkbox" name="idCheck" id="idCheck"><label for="idCheck" >아이디 저장</label><br><br>
						</c:otherwise>
					</c:choose>
					
					<!--  
					<input id="memId" type="text" name="memId" placeholder="아이디" required >
					<br>
					<input id="memPwd" type="password" name="memPwd" placeholder="비밀번호" required>
					<br>
					<input type="checkBox" id="idCheck">&nbsp;&nbsp;<label for="idCheck" >아이디 저장</label>
					<br><br>
					-->
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
	 $(function(){			// change는 이벤트임
		$(document).on('change', '#idCheck', function(){
				//var $memId = $(this).is(':checked'); // is는 선택한요소가 ()안에 있는 것이 일치하는지 확인하고 ture,false를 나타낸다.
				//console.log($memId);
			if($('#idCheck').prop('checked')){ // arrt(), prop()의 차이점...?
				
				$.ajax({
					url : 'saveId.me',
					data : {
						memId : $('#memId').val()
					}
					//, success : function(result){
						//console.log(result);
					//},
					//error : function(){	
					//}
				})
			}
			else {
				$.ajax({
					url : 'saveIdDelete.me',
					data : {
						memId : $('#memId').val()
					}
					// ,success : function(result1){
						//console.log(result1);
					//},
					//error : function(){
						
					//}
				})
			}
		}) 
	 })
	
	<%--
		window.onload = function(){
			var item = document.getElementsByClassName();
			for(var i=0; i<item.length; i++){
				item[i].onclick = function(){
					
				}
			}
		}
		$jQuery(document).ready(function){
			
		}
		
		$(document).ready(function(){
			
		})
		
		$(function(){
		$('.idCheck').click(function(){
		
		--%>

			
				
				
	
	</script>


</body>
</html>
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
				이메일하기
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
						<td><input type="text" name="memId" maxlength="20" id="memId"  onkeyup="chk(event)" required>
						<div id="checkId" width="80" style="font-size:0.7em; display:none;" ></div>
						</td>
					</tr>
					<tr>
						<td> 비밀번호 &nbsp;&nbsp;</td>
						<td><input type="password" name="memPwd" id="memPwd" maxlength="20" required></td>
					</tr>
					
					<tr>
						<td> 비밀번호 확인 &nbsp;&nbsp;</td>
						<td><input type="password" name="checkPwd" id="checkPwd" maxlength="20" required></td>
					</tr>
					
					<tr>
						<td> 이름  &nbsp;&nbsp;</td>
						<td><input type="text" name="memName" required></td>
					</tr>
					
					<tr>
						<td> 이메일  &nbsp;&nbsp;</td>
						<td><input type="email" name="email" id="email" >
							<button type="button" onclick="certButton();" >전송</button>
							<br>
							<input type="text" name="secret" id="secret1" maxlength="6">
							<div id="secret" width="200" style="font-size:0.7em;"></div> 
						</td>	 
						
					</tr>
						<!-- <td><button class="emailCheck" onclick="emailCheck">인증</button></td> -->
					
					<!--  
					<tr>
						<td> 이메일 인증 &nbsp;&nbsp;</td>
						<td><input id="checkEmail" class="emailCheck" size=3 maxlength=5></td>
					</tr>
					-->
					<tr>
						<td> 핸드폰번호  &nbsp;&nbsp;</td>
						<td><input type="text" id="phone" name="phone" placeholder="숫자만 입력해주세요"  required></td>
					</tr>
				</table>
				<button id="btn-submit" type="submit" class="join-button">회원가입</button>
			</form>
			
			
			
			<!-- 
			<script>
			$(function(){
				$(document).on('focusout', 'input[name=memId]', function(){
					$('#checkId').text('ㅇ하하하하')
				})	
			})

			</script>
			 -->
			
			
			
			
			
			
			
			<script>
			// 이메일 인증번호
				function certButton() {
					console.log($('#email').val());
					
					if($('#email').val() != ''){
						$.ajax({
							url : 'certButton.me',
							data : {
								email : $('#email').val()
							}
							,success :function(result){
								alert('인증번호가 전송되었습니다.')
							},
							error :function(){
							}	
						})
					}
					else {
						alert('이메일을 입력해주세요.');
					}
					
					
				}
			
			</script>

			<script>
				$(function(){
					$(document).on('focusout', 'input[name=secret]', function(){
							$.ajax({
								url : 'check',
								data : {
									secret : $('#secret1').val()
								}
								,success :function(result1){
									//console.log(result1 + "????")
									
									if(result1){
										$('#secret').text('일치합니다.')
										$('#secret').css('color','blue')
										$('#btn-submit').attr('type', 'submit');
									}
									else{
										$('#secret').text('일치하지 않습니다.')
										$('#secret').css('color','red')
										//$('#enroll-form :submit').removeAttr('disabled');
										$('#btn-submit').css('background-color', 'lightgray');
										$('#btn-submit').attr('type', 'button');
									}
								},
								error :function(){
									console.log()
								}
							})
						
					})
				})
			</script>
			
			
			<script>
				$(function(){
					
					let $idInput = $('#enroll-form #memId');
			
					// 제이쿼리를 사용할때는 맞춰준다. 제이퀄리를 사용해서 변수를 사용하면 자바스크립트에서 못쓸때가 있다. 
						
					// 사용자가 input태그에 뭐 쓸때 이벤트가 생긴다.
					$idInput.keyup(function(){
						//console.log($idInput.val());
						
						// 최소 다섯글자 이상으로 입력할때만 ajax요청
						if($idInput.val().length >= 5){
							//중복체크 요청
							$.ajax({
								url : 'idCheck.me',
								data : {checkId : $idInput.val()},// // 객체를 만들어서 객체의 속성명으로 넣는 과정. checkId는 키값$idInput.val()키의 벨류값
								success : function(result){ //성공했을때 돌아오는 매개변수로 넣는다 result
									console.log(result);
									
									if(result == 'NNNNN'){
										$('#checkId').show();
										$('#checkId').css('color', 'red').text('중복된 아이디가 존재합니다.');
										$('#enroll-form :submit').attr('disabled');
									}
									else{
										$('#checkId').show();
										$('#checkId').css('color', 'blue').text('사용가능한 아이디 입니다.')
										$('#enroll-form :submit').removeAttr('disabled');
									}

								},
								error : function(){
									console.log("아이디 중복체크 실패");
								}
							});
						} 
						else { // 5글자를 쓰거 지웠는데 버튼이 활성화 될수 있기때문에 막는다.
							$('#checkId').hide();
							$('#enroll-form :submit').attr('disabled', true);
						}
					});
					
					
					$(document).on('focusout','input[name=memPwd]',function(){
						var memPwd = $("#memPwd").val();
						var memId = $("#memId").val();
							
						var reg = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
						var hangulCheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
						
						if(false === reg.test(memPwd)) {
							alert('비밀번호는 8자 이상이어야 하며, 숫자, 대/소문자.');
							return false;
						}else if(memPwd.search(memId) > -1){
						 	alert("비밀번호에 아이디가 포함되었습니다.");
						 return false;
						}else if(memPwd.search(/\s/) != -1){
						 	alert("비밀번호는 공백 없이 입력해주세요.");
						return false;
						}else if(hangulCheck.test(memPwd)){
						 	alert("비밀번호에 한글을 사용 할 수 없습니다."); 
						 	return false;
						}else {
						 	console.log("통과");
						}

						})
						
						
						$(document).on('keyup','input[name=phone]', function () {
						    $(this).val($(this).val().replace(/[^0-9]/g, ""));
			
						});
					
					
					
					
				})
				
				
				
				
				
			</script>
			
			
			<script>
			$(function(){
				
			});
			
			
			</script>
			
			
			<script>
			<%--
			$("#phone").keyup(function(event){
			    var inputVal = $(this).val();
			    $(this).val(inputVal.replace(/[^0-9]/gi,''));
			});
			--%>
			
			
			
			<%--
			let idInput = /^[a-z]+[a-z0-9]{5,19}$/g; 	
    		if( !idInput.test( $("input[name=memId]").val() ) ) {

       	 		alert("아이디는 영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다.");
       	 	
    		}else{
    			alert("사용 가능한 아이디입니다.")
    		}
			--%>
			
			<%--
			$(function())
			chk(event) {
				  const regExp = /[^0-9a-zA-Z]/g;
				  const ele = event.target;
				  if (regExp.test(ele.value)) {
				    ele.value = ele.value.replace(regExp, '');
				  }
				};
			--%>
			</script>
			
			
			<%--
				$(function(){
					$(document).on('focusout','input[name=memPwd]',function(){
						var reg = "^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
						var '
					})
				})
				--%>
			
	
			<script>
			function $idInput(asValue) {

				var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; //  8 ~ 10자 영문, 숫자 조합

				return regExp.test(asValue); // 형식에 맞는 경우 true 리턴

				}
			</script>
			
			<!--
			<script>
				$('input[name=checkPwd]').focusout(function(){
					var $memPwd
				})
			</script>
			
			  
			<script>
				$(function(){		//input name=memId 인 곳에 focusout 이벤트가 일어나면 function() 안의 함수 실행
					//document는 현재 페이지중에 이러한 변화가 일어나면~
					$(document).on('focusout', 'input[name=memId]', function(){
						
						$('#checkId').text($('인증인증').val())
					})
				})
			</script>
			-->
			

	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
<body>
	
	<jsp:include page="../common/menubar_user.jsp"/>
	<br><br>

	<div class="out">
		<div class="include">
			<jsp:include page="../member/myPage.jsp"/>
		</div>
		
		<div id="enrollForm">
		<h2>회원 정보 수정</h2>
			<div class="form-group">
				<span class="form-title">아이디</span>
				<span class="form-fix">user01</span>
			</div>	
			<div class="form-group">
				<span class="form-title">비밀번호</span>
				<span class="form-pwd"><button>비밀번호 변경하기</button></span>
			</div>	
			<div class="form-group">
				<span class="form-title">이름</span>
				<span class="form-fix">박혜진</span>
			</div>	
			<div class="form-group">
				<span class="form-title">핸드폰번호</span>
				<span class="form-fix"><input type="text" placeholder="01041396013"></span>
			</div>	

		
		</div>
	</div>
</body>
</html>
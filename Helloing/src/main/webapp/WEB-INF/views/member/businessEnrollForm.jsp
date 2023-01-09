<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 파트너 등록</title>
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
#btn-address{
	height: 30px;

}
.hold-form {
	color: #053E99;

}

</style>
</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/>
	
	<div class="inner" align="center">
	<br><br><br><br>
	<h1>기업 파트너 등록</h1>
	<br><br>
		<div class="enroll-form">
			<form action="insertCompany.bu" method="post" id="enroll-form"> 
				<table>
					<tr>
						<td> 파트너 이름 &nbsp;&nbsp;</td>
						<td><input type="text" name="memName" maxlength="20" class="hold-form" readonly value=${ loginUser.memName } ></td>
						<td id="checkId" width="80"></td>
					</tr>
					<tr>
						<td> 전화번호 &nbsp;&nbsp;</td>
						<td><input type="text" name="phone" maxlength="20" class="hold-form" readonly value=${ loginUser.phone } ></td>
					</tr>
					<tr>
						<td> 사업장명  &nbsp;&nbsp;</td>
						<td><input type="text" name="businessName" required></td>
					</tr>
					<tr>
						<td> 사업자번호  &nbsp;&nbsp;</td>
						<td><input type="text" name="businessNo" required></td>
					</tr>
					<tr>
						<td> 사업자주소 &nbsp;&nbsp;</td>
						<td><input type="text" class="address" name="address" ></td>
						<td><input type="text" class="addAddress" ></td>
						
					</tr>
					<tr>
						<td></td>
						<td><button id="btn-address" onclick="address();">주소 찾기</button></td>
					</tr>
				</table>
				<button type="submit" class="join-button">파트너 등록</button>
			</form>

		</div>
	</div>
	
	
	
	
</body>
</html>
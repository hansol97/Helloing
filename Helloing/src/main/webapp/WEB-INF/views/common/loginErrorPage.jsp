<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러가 났다 푸하하</title>
</head>
<body>
    <jsp:include page="../common/menubar_user.jsp"/>

    <br>
    <div align="center">
        <br><br><br><br>
        <img src="/helloing/resources/img/logo_outline.png" alt="logo">
        <h1 style="font-weight:bold;">${ errorMsg }</h1> <!-- request에 담은거  -->
        <a href="loginForm.me">로그인 다시하기</a> / <a href="memberEnrollForm.me">회원가입</a> 
    </div>
    <br>
    
</body>
</html>
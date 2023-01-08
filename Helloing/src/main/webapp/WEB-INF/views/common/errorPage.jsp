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
        <img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-256.png">
        <br><br>
        <h1 style="font-weight:bold;">${ errorMsg }</h1> <!-- request에 담은거  -->
    </div>
    <br>
    
</body>
</html>
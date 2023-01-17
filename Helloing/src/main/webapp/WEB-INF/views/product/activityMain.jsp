<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>

<link href="resources/css/product/activityMain.css" rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/> <!-- 헤더를 넣으니까 검색창이 헤더 밑으로 간다... relative, absolute 속성 때문일까? -->

    <div style="height: 70px;"></div>

	<div class="inner">
	
        <div class="top-content">
            <form action="search.activity">
                <input type="text" name="keyword" placeholder="&nbsp&nbsp&nbsp🔍&nbsp 상품을 검색해보세요"><button>검색</button>
            </form>
        </div>

        <h3>티켓</h3> <!-- 4개까지만 뿌려주자 / 더 보기로 인기 액티비티 20개정도? 뿌려주기 -->
                           <!-- N글자 이상인 경우 ... 하는거 추가하기 -->
        <div class="hot" id="hot-ticket"> 
        
        	<c:forEach items="${ actList }" var="a">
        		<div class="productbox">
                    <input type="hidden" name="activityNo" value="${ a.activityNo }">
	                <img src="${ a.attachment }" width="240" height="200">
	                <p><span class="activityName">${ a.activityName }</span><br>
	                    	⭐⭐⭐⭐⭐ ${ a.reviewCount }<br>
	                    ${ a.rowPrice }원 ~
	                </p>
	            </div>
        	</c:forEach>
        </div>

		
	</div>
	
	<script type="text/javascript" src="resources/js/product/activityMain.js"></script>
	
</body>
</html>
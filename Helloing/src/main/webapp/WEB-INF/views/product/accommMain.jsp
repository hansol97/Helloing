<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>

<link href="resources/css/product/accommMain.css" rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/> <!-- 헤더를 넣으니까 검색창이 헤더 밑으로 간다... relative, absolute 속성 때문일까? -->
	
	<div style="height: 70px;"></div>  
	
	<div class="inner">  
	
		
        <div class="top-content">
            <form action="search.accomm">
                <h1>어떤 숙소 찾으세요?</h1>
                <div id="searchbox">
                    <div>
                        <input type="radio" name="category" id="all" value="all" checked><label for="all">전체</label>
                        <input type="radio" name="category" id="hotel" value="hotel"><label for="hotel">호텔</label>
                        <input type="radio" name="category" id="pension" value="pension"><label for="pension">펜션</label>
                        <input type="radio" name="category" id="motel" value="motel"><label for="motel">모텔</label>
                        <input type="radio" name="category" id="guestHouse" value="guestHouse"><label for="guestHouse">게스트하우스</label>
                        <input type="radio" name="category" id="house" value="house"><label for="house">민박</label>
                    </div>
                    <hr>
                    <div style="padding: 0px 18px;">
                    	<table>
                    		<tr>
                    			<td></td>
                    			<%--<td width="400">날짜</td>
                    			<td width="200">인원</td> --%>
                    			
                    		</tr>
                    		<tr height="30">
                    			<!-- 스크립트로 min=오늘날짜, max=오늘+한달후날짜 계산해서 집어넣기 --> 
                    			<!--https://wooncloud.tistory.com/26 : 날짜 여러개 픽하는 플러그인 참고!-->
                    			<td><input type="text" name="accommName" placeholder="검색하실 숙소 명을 입력해주세요"></td>
                    			<%--<td><input type="date" name="" min="2023-01-03" max="2023-02-01" /></td>
                    			<td><div><a>-</a>&nbsp&nbsp<span>0</span>&nbsp&nbsp<a>+</a></div></td> --%>
                    			<td rowspan="2"><button id="btn-search" type="button" onclick="search();">검색</button></td>
                    		</tr>
                    	</table>
                    </div>
                </div>
                <div class="info">
                
                </div>
            </form>
        </div>
        
        
        <%--
        <h3>최근 본 숙소</h3> <!-- 쿠키 사용해서 뿌려줄 것 / 쿠키가 없다면 최근 본 숙소도 없음 -->
                              <!-- N글자 이상이면 ... 하는것도 만들기 -->
        <div class="recentlyAccom">
            <div class="accommCookie" style="display: flex; justify-content: flex-start;">
                <div><img src="/helloing/resources/img/logo_outline.png" width="200"></div>
                <div>
                    <p>호텔<br>
                    <span class="accommName">호텔이름 1</span><br>
                    ⭐ 4.5 (10)<br>
                    86,000원</p>
                </div>
            </div>
            <div class="accommCookie" style="display: flex; justify-content: flex-start;">
                <div><img src="/helloing/resources/img/logo_outline.png" width="200"></div>
                <div>
                    <p>호텔<br>
                        <span class="accommName">호텔이름 1</span><br>
                        ⭐ 4.5 (10)<br>
                        86,000원</p>
                </div>
            </div>
            <div class="accommCookie" style="display: flex; justify-content: flex-start;">
                <div><img src="/helloing/resources/img/logo_outline.png" width="200"></div>
                <div>
                    <p>호텔<br>
                        <span class="accommName">호텔이름 1</span><br>
                        ⭐ 4.5 (10)<br>
                        86,000원</p>
                </div>
            </div>
        </div>
        <hr>
         --%>
        
        <h3>호텔</h3> <!-- for문 돌릴거임 / 10개까지만 뿌려주자 / outer 밖 요소들은 가리기 어떻게?-->
        <div class="hot" id="hot-hotel"> 
	        <c:forEach items="${ acList }" var="ac" begin="0" end="6" step="1">
	        	<c:if test="${ ac.category == 'hotel' }">
	        		<div class="productbox">
		            	<input type="hidden" name="accommNo" value="${ ac.accommNo }">
		                <img src="${ ac.filePath }" width="150"><br>
		                <p>호텔<br>
			                <span class="accommName">${ ac.accommName }</span><br>
			               	 ⭐ ${ ac.avg } (${ ac.reviewCount })<br>
			                ${ ac.rowPrice }원 ~</p>
		            </div>
	        	</c:if>
	        </c:forEach>
            
        </div>

        <h3>펜션</h3>
        <div class="hot" id="hot-pension">
        	<c:forEach items="${ acList }" var="ac" begin="0" end="6">
        		<c:if test="${ ac.category == 'pension' }">
        			<div class="productbox">
        				<input type="hidden" name="accommNo" value="${ ac.accommNo }">
		                <img src="${ ac.filePath }" width="150"><br>
		                <p>펜션<br>
			                <span class="accommName">${ ac.accommName }</span><br>
			               	 ⭐ ${ ac.avg } (${ ac.reviewCount })<br>
			                ${ ac.rowPrice }원 ~</p>
		            </div>
        		</c:if>
        	</c:forEach>
        </div>

        <h3>모텔</h3>
        <div class="hot" id="hot-motel">
            <c:forEach items="${ acList }" var="ac" begin="0" end="6">
        		<c:if test="${ ac.category == 'motel' }">
        			<div class="productbox">
        				<input type="hidden" name="accommNo" value="${ ac.accommNo }">
		                <img src="${ ac.filePath }" width="150"><br>
		                <p>모텔<br>
			                <span class="accommName">${ ac.accommName }</span><br>
			               	 ⭐ ${ ac.avg } (${ ac.reviewCount })<br>
			                ${ ac.rowPrice }원 ~</p>
		            </div>
        		</c:if>
        	</c:forEach>
        </div>

        <h3>게스트하우스</h3>
        <div class="hot" id="hot-guestHouse">
            <c:forEach items="${ acList }" var="ac" begin="0" end="6">
        		<c:if test="${ ac.category == 'guestHouse' }">
        			<div class="productbox">
        				<input type="hidden" name="accommNo" value="${ ac.accommNo }">
		                <img src="${ ac.filePath }" width="150"><br>
		                <p>게스트하우스<br>
			                <span class="accommName">${ ac.accommName }</span><br>
			               	 ⭐ ${ ac.avg } (${ ac.reviewCount })<br>
			                ${ ac.rowPrice }원 ~</p>
		            </div>
        		</c:if>
        	</c:forEach>
        </div>
        
        <h3>민박</h3>
        <div class="hot" id="hot-guestHouse">
            <c:forEach items="${ acList }" var="ac" begin="0" end="6">
        		<c:if test="${ ac.category == 'house' }">
        			<div class="productbox">
        				<input type="hidden" name="accommNo" value="${ ac.accommNo }">
		                <img src="${ ac.attachment }" width="150"><br>
		                <p>민박<br>
			                <span class="accommName">${ ac.accommName }</span><br>
			               	 ⭐ ${ ac.avg } (${ ac.reviewCount })<br>
			                ${ ac.rowPrice }원 ~</p>
		            </div>
        		</c:if>
        	</c:forEach>
        </div>
		
	</div>
	
	<script type="text/javascript" src="resources/js/product/accommMain.js"></script>
</body>
</html>
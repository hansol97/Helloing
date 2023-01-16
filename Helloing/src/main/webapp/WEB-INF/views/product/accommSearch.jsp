<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>
<link href="resources/css/product/accommSearch.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/> <!-- 헤더를 넣으니까 검색창이 헤더 밑으로 간다... relative, absolute 속성 때문일까? -->
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
        <div class="top-content">
                <div id="searchbox">
                    <div style="padding: 0px 18px;">
                    <h2>검색</h2>
                    	<table>
                    		<tr height="30">
                    			<!-- 스크립트로 min=오늘날짜, max=오늘+한달후날짜 계산해서 집어넣기 --> 
                    			<!--https://wooncloud.tistory.com/26 : 날짜 여러개 픽하는 플러그인 참고!-->
                    			<td><input type="text" name="keyword" value="${ ac.accommName }"></td>
                    			<td rowspan="2"><button type="submit">검색</button></td>
                    		</tr>
                    	</table>
                    </div>
                </div>
        </div>
        
        <div class="middle-content">
            <div class="side-bar">
                <button id="btn-map">🗺️지도로 보기</button> <!-- 검색해서 나온 시설들 지도에 띄워주기 -->
                <div>
                    <h4>종류</h4>
                    <input type="radio" name="category" id="hotel" checked><label for="hotel">호텔</label><br>
                    <input type="radio" name="category" id="pension"><label for="pension">펜션</label><br>
                    <input type="radio" name="category" id="poolVilla"><label for="poolVilla">풀빌라</label><br>
                    <input type="radio" name="category" id="guestHouse"><label for="guestHouse">게스트하우스</label><br>
                </div>

                <hr>

                <span>필터</span>
                <span id="reset">전체 초기화</span>

                <hr>

                <h4>총 숙박 요금</h4> <!-- 양방향 input range 미친놈인가? -->
                <input type="number" class="price"> 원 ~ <input type="number" class="price"> 원
                
                <hr>

                <h4>호텔 등급</h4>
                <div name="myform" id="myform">
                    <fieldset>
                        <input type="radio" name="rating" value="5" id="rate1"><label for="rate1">⭐</label>
                        <input type="radio" name="rating" value="4" id="rate2"><label for="rate2">⭐</label>
                        <input type="radio" name="rating" value="3" id="rate3"><label for="rate3">⭐</label>
                        <input type="radio" name="rating" value="2" id="rate4"><label for="rate4">⭐</label>
                        <input type="radio" name="rating" value="1" id="rate5"><label for="rate5">⭐</label>
                    </fieldset>
                </div>

                <hr>

            </div>
            <div class="main">
                


				<c:choose>
					<c:when test="${ not empty accommList }">
						<h4>검색된 숙소 ${ fn:length(accommList) }개</h4>
		                <div class="radio-sort">
		                    <input type="radio" name="radio-sort" id="recomm"><label for="recomm">추천순</label>
		                    <input type="radio" name="radio-sort" id="manyreview"><label for="manyreview">많은 후기순</label>
		                    <input type="radio" name="radio-sort" id="highstar"><label for="highstar">높은 평점순</label>
		                    <input type="radio" name="radio-sort" id="lowprice"><label for="lowprice">낮은 가격순</label>
		                    <input type="radio" name="radio-sort" id="highprice"><label for="highprice">높은 가격순</label>
		                </div>
		                
						<c:forEach items="${ accommList }" var="ac">
							<div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
		                    <div><img src="${ ac.attachment }" width="250" height="250"></div>
		                    <div>
		                        <p><span class="accommName">${ ac.accommName }</span><br><br>
		                            	⭐${ ac.avg }(${ ac.reviewCount }) · ${ ac.address }<br><br><br>
		                        <span class="accommName">${ ac.rowPrice }원</span></p>
		                    </div>
		                </div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h4>검색된 숙소가 없습니다. 🥲<br>
						    다른 숙소는 어떠세요?</h4> <br>
						    <c:forEach items="${ anoList }" var="an" end="3">
								<div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
			                    <div><img src="${ an.attachment }" width="250" height="250"></div>
			                    <div>
			                        <p><span class="accommName">${ an.accommName }</span><br><br>
			                            	⭐${ an.avg }(${ an.reviewCount }) · ${ an.address }<br><br><br>
			                        <span class="accommName">${ an.rowPrice }원</span></p>
			                    </div>
			                </div>
			                <br>
							</c:forEach>
					</c:otherwise>
				</c:choose>
				
                
            </div>
        </div>
		
	</div>

</body>
</html>
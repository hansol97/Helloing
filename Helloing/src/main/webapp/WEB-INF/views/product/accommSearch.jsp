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
	<form action="search.accomm" method="get">
        <div class="top-content">
               <div id="searchbox">
                   <div style="padding: 0px 18px;">
                   <h2>검색</h2>
                   	<table>
                   		<tr height="30">
                   			<td><input type="text" name="accommName" value="${ keyword }"></td>
                   			<td rowspan="2"><button id="btn-search" type="button" onclick="search();">검색</button></td>
                   		</tr>
                   	</table>
                   </div>
               </div>
        </div>
        
        <div class="middle-content">
            <div class="side-bar">
                <button id="btn-map" onclick="showMap();" type="button">🗺️지도로 보기</button> <!-- 검색해서 나온 시설들 지도에 띄워주기 -->
                <div>
                    <h4>종류</h4>
                    <input type="radio" name="category" id="all" value="all" checked><label for="all">전체</label><br>
                    <input type="radio" name="category" id="hotel" value="hotel"><label for="hotel">호텔</label><br>
                    <input type="radio" name="category" id="pension" value="pension"><label for="pension">펜션</label><br>
                    <input type="radio" name="category" id="motel" value="motel"><label for="motel">모텔</label><br>
                    <input type="radio" name="category" id="guestHouse" value="guestHouse"><label for="guestHouse">게스트하우스</label><br>
                    <input type="radio" name="category" id="house" value="house"><label for="house">민박</label><br>
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
						<h4>'<span id="keyword">${ keyword }</span>' 검색된 숙소 ${ fn:length(accommList) }개</h4>
		                <div class="radio-sort">
		                    <input type="radio" name="radio-sort" id="recomm"><label for="recomm">추천순</label>
		                    <input type="radio" name="radio-sort" id="manyreview"><label for="manyreview">많은 후기순</label>
		                    <input type="radio" name="radio-sort" id="highstar"><label for="highstar">높은 평점순</label>
		                    <input type="radio" name="radio-sort" id="lowprice"><label for="lowprice">낮은 가격순</label>
		                    <input type="radio" name="radio-sort" id="highprice"><label for="highprice">높은 가격순</label>
		                </div>
		                
						<c:forEach items="${ accommList }" var="ac">
							<div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
								<input type="hidden" name="accommNo" value="${ ac.accommNo }">
			                    <div><img src="${ ac.filePath }" width="250" height="250"></div>
			                    <div>
			                        <p><span class="accommName">${ ac.accommName }</span><br><br>
			                            	⭐${ ac.avg }(${ ac.reviewCount }) · ${ ac.address }<br><br><br>
			                        <span class="accommName">${ ac.rowPrice }원</span></p>
			                    </div>
			                </div>
			                <br>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<h4>검색된 숙소가 없습니다. 🥲<br>
						    다른 숙소는 어떠세요?</h4> <br>
						    <c:forEach items="${ anoList }" var="an" end="3">
								<div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
									<input type="hidden" name="accommNo" value="${ an.accommNo }">
				                    <div><img src="${ an.filePath }" width="250" height="250"></div>
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
	</form>	
	</div>
	<script type="text/javascript" src="resources/js/product/accommSearch.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>
<link href="resources/css/product/activitySearch.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/> <!-- 헤더를 넣으니까 검색창이 헤더 밑으로 간다... relative, absolute 속성 때문일까? -->
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
        <div class="top-content">
            <form action="search.activity">
                <input type="text" name="keyword" value="${ keyword }"><button>검색</button>
            </form>
        </div>
        
        <div class="middle-content">
        
            <div class="side-bar">
                <%--<span>필터</span>
                <span id="reset">전체 초기화</span>

                <hr>

                <h4>가격대</h4> <!-- 양방향 input range 미친놈인가? -->
                <input type="number" class="price"> 원 ~ <input type="number" class="price"> 원
                
                <hr>

                <h4>평점</h4>
                <div>
                    <input type="radio" name="star" id="allstar"><label for="allstar">전체</label><br>
                    <input type="radio" name="star" id="4star"><label for="4star">4점 이상</label><br>
                    <input type="radio" name="star" id="5star"><label for="5star">5점만</label><br>
                </div>

                <hr>--%>

            </div>
             
            
            <div class="main">
            	<c:choose>
            		<c:when test="${ not empty searchList }">
            			<h4>'${ keyword }' 검색 결과 | 총 ${ fn:length(searchList) }개</h4>
            		</c:when>
            		<c:otherwise>
            			<h4>검색된 결과가 없습니다.🥲<br>다른 액티비티는 어떠세요?</h4>
            		</c:otherwise>
            	</c:choose>
            	
            	<div class="radio-sort">
                    <input type="radio" name="radio-sort" id="recomm"><label for="recomm">추천순</label>
                    <input type="radio" name="radio-sort" id="manyreview"><label for="manyreview">많은 후기순</label>
                    <input type="radio" name="radio-sort" id="highstar"><label for="highstar">높은 평점순</label>
                    <input type="radio" name="radio-sort" id="lowprice"><label for="lowprice">낮은 가격순</label>
                    <input type="radio" name="radio-sort" id="highprice"><label for="highprice">높은 가격순</label>
                </div>
                <div class="product-list">
	            	<c:choose>
	            		<c:when test="${ not empty searchList }">
	            			<c:forEach items="${ searchList }" var="sl">
			            		<div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
			                        <img src="${ sl.attachment }" width="250" height="250"><br>
			                        <div>
			                            <p>${ sl.activityName }<br>
			                            	⭐${ sl.avg } (${ sl.reviewCount })<br>
			                            ${ sl.rowPrice }원</p>
			                        </div>
			                    </div>
	            			</c:forEach>
	            		</c:when>
	            		<c:otherwise>
	            			<c:forEach items="${ activityList }" var="al">
			            		<div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
			                        <img src="${ al.attachment }" width="250" height="250"><br>
			                        <div>
			                            <p>${ al.activityName }<br>
			                            	⭐ ${ al.avg } (${ al.reviewCount })<br>
			                            ${ al.rowPrice }원</p>
			                        </div>
			                    </div>
	            			</c:forEach>
	            		</c:otherwise>
	            	</c:choose>
            	</div>
                
            </div>
        </div>
		
	</div>

</body>
</html>
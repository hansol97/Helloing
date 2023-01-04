<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>
<style>
/* 최근 본 숙소 */
.recentlyAccom{
    display: flex;
    justify-content: space-between;
    margin-bottom: 30px;
}
.recentlyAccom>div{
    width: 350px;
}
/* 최근본 숙소 끝 */

/* 검색창 */
#searchbox{
    background-color: rgb(237, 237, 237);
    padding: 20px 15px;
    margin-top: 10px;
    margin-bottom: 30px;
}
#searchbox table{
	width: 100%;
}
#searchbox table input{
	width: 90%;
	height: 30px;
}
#searchbox table div{
	width: 90%;
	height: 30px;
	background: white;
	padding: 0px 5px;
	box-sizing: border-box;
    border: 1px solid rgb(105, 105, 105);
}
#searchbox table button{
	width: 100%;
	height: 30px;
    font-weight: bold;
    color: white;
    background-color: #053E99;
    border: 0;
    border-radius: 3px;
}
/* 검색창 끝*/

.middle-content{
    display: flex;
    justify-content: space-between;
}

.side-bar{
    width: 280px;
    padding: 0px 5px;
}
.main{
    width: 800px;
}

/* 사이드바 */
#btn-map{
    width: 100%;
    height: 70px;
    border-radius: 3px;
    font-size: 20px;
    border: 1px solid rgb(144, 144, 144);
}

.side-bar input[name=category]{
    display: none;
}
.side-bar input[name=category]+label{
    display: inline-block;
    height: 35px;
    width: 250px;
    border: 1px solid black;
    line-height: 35px;
    margin-left: 10px;
    padding-left: 10px;
    margin: 5px 10px;
    border-radius: 3px;
    background-color: rgb(241, 241, 241);
    border: 1px solid rgb(206, 206, 206);
}
.side-bar input[name=category]:checked+label{
    font-weight: bold;
    color: white;
    background-color: #053E99;
}

.side-bar span{
    font-size: 18px;
	font-weight: bold;
	margin: 20px 0px 0px 10px;
}
#reset{
    font-size: 15px;
    font-weight: 100;
    color: gray;
}
.price{
    width: 90px;
}
input[class="price"]::-webkit-outer-spin-button,
input[class="price"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

/* 별점 */
#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    border: 0; /* 필드셋 테두리 제거 */
}
#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
    font-size: 30px; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 rgb(175, 175, 175); /* 새 이모지 색상 부여 */
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #FFEA24; /* 마우스 클릭 체크 */
}
#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
}
/* 별점 끝 */
/* 사이드바 끝 */

/* 메인 컨텐츠 */
.radio-sort{
    text-align: right;
    margin-bottom: 15px;
}
.radio-sort>input[type=radio]{
    opacity: 0;
}
.radio-sort>input[type=radio]>label{
    padding: 5px 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}
.radio-sort>input[type=radio]:checked+label{
    font-weight: bold;
    color: #053E99;
}

.productbox{
    width: 800px;
    height: 250px;
    display: flex;
    align-items: center;
    margin-bottom: 20px;
}
.productbox>div{
    margin-right: 20px;
}
.accommName{
    font-size: 22px;
    font-weight: bold;
}
/* 메인 컨텐츠 끝 */



hr{
    margin: 20px 0px;
}
.inner h4{
	font-size: 18px;
	font-weight: bold;
	margin: 20px 0px 0px 10px;
}








</style>
</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/> <!-- 헤더를 넣으니까 검색창이 헤더 밑으로 간다... relative, absolute 속성 때문일까? -->
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
        <div class="top-content">
                <div id="searchbox">
                    <div style="padding: 0px 18px;">
                    	<table>
                    		<tr>
                    			<td width="300">이름</td>
                    			<td width="400">날짜</td>
                    			<td width="200">인원</td>
                    			
                    		</tr>
                    		<tr height="30">
                    			<!-- 스크립트로 min=오늘날짜, max=오늘+한달후날짜 계산해서 집어넣기 --> 
                    			<!--https://wooncloud.tistory.com/26 : 날짜 여러개 픽하는 플러그인 참고!-->
                    			<td><input type="text" name="keyword" placeholder="전주"></td>
                    			<td><input type="date" name="" min="2023-01-03" max="2023-02-01" /></td>
                    			<td><div><a>-</a>&nbsp&nbsp<span>0</span>&nbsp&nbsp<a>+</a></div></td>
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
                <h4>검색된 숙소 ㅇ개</h4>
                <div class="radio-sort">
                    <input type="radio" name="radio-sort" id="recomm"><label for="recomm">추천순</label>
                    <input type="radio" name="radio-sort" id="manyreview"><label for="manyreview">많은 후기순</label>
                    <input type="radio" name="radio-sort" id="highstar"><label for="highstar">높은 평점순</label>
                    <input type="radio" name="radio-sort" id="lowprice"><label for="lowprice">낮은 가격순</label>
                    <input type="radio" name="radio-sort" id="highprice"><label for="highprice">높은 가격순</label>
                </div>

                <div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
                    <div><img src="/helloing/resources/img/logo_outline.png" width="250" height="250"></div>
                    <div>
                        <p><span class="accommName">호텔이름1</span><br><br>
                            ⭐4.5(30) · 전주시 ㅇㅇ길 24<br><br><br>
                        <span class="accommName">35,000원</span></p>
                    </div>
                </div>
                <div class="productbox">
                    <div><img src="/helloing/resources/img/logo_outline.png" width="250" height="250"></div>
                    <div>
                        <p><span class="accommName">호텔이름1</span><br><br>
                            ⭐4.5(30) · 전주시 ㅇㅇ길 24<br><br><br>
                        <span class="accommName">35,000원</span></p>
                    </div>
                </div>
                <div class="productbox">
                    <div><img src="/helloing/resources/img/logo_outline.png" width="250" height="250"></div>
                    <div>
                        <p><span class="accommName">호텔이름1</span><br><br>
                            ⭐4.5(30) · 전주시 ㅇㅇ길 24<br><br><br>
                        <span class="accommName">35,000원</span></p>
                    </div>
                </div>
                <div class="productbox">
                    <div><img src="/helloing/resources/img/logo_outline.png" width="250" height="250"></div>
                    <div>
                        <p><span class="accommName">호텔이름1</span><br><br>
                            ⭐4.5(30) · 전주시 ㅇㅇ길 24<br><br><br>
                        <span class="accommName">35,000원</span></p>
                    </div>
                </div>
            </div>
        </div>
		
	</div>

</body>
</html>
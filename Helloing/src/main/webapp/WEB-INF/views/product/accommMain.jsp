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
.top-content input[type=radio]{
    opacity: 0;
}
.top-content input[type=radio]>label{
    padding: 5px 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}
.top-content input[type=radio]:checked+label{
    font-weight: bold;
    color: #053E99;
}
#searchbox{
    background-color: rgb(237, 237, 237);
    padding: 20px 15px;
    margin-top: 10px;
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


.accommName{
    font-size: 22px;
    font-weight: bold;
}
.hot{
    display: flex;
    margin-bottom: 50px;
}
.productbox{
    margin-right: 20px;
}


.inner h1{
	font-size: 30px;	
	font-weight: bold;
}
.inner h3{
	font-size: 25px;
	font-weight: bold;
	margin: 20px 0px;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/> <!-- 헤더를 넣으니까 검색창이 헤더 밑으로 간다... relative, absolute 속성 때문일까? -->
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
        <div class="top-content">
            <form action="search.accomm" method="">
                <h1>어떤 숙소 찾으세요?</h1>
                <div id="searchbox">
                    <div>
                        <input type="radio" name="category" id="hotel" checked><label for="hotel">호텔</label>
                        <input type="radio" name="category" id="pension"><label for="pension">펜션</label>
                        <input type="radio" name="category" id="poolVilla"><label for="poolVilla">풀빌라</label>
                        <input type="radio" name="category" id="guestHouse"><label for="guestHouse">게스트하우스</label>
                    </div>
                    <hr>
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
            </form>
        </div>
        <h3>최근 본 숙소</h3> <!-- 쿠키 사용해서 뿌려줄 것 / 쿠키가 없다면 최근 본 숙소도 없음 -->
                              <!-- N글자 이상이면 ... 하는것도 만들기 -->
        <div class="recentlyAccom">
            <div style="display: flex; justify-content: flex-start;">
                <div><img src="/helloing/resources/img/logo_outline.png" width="200"></div>
                <div>
                    <p>호텔<br>
                    <span class="accommName">호텔이름 1</span><br>
                    ⭐ 4.5 (10)<br>
                    86,000원</p>
                </div>
            </div>
            <div style="display: flex; justify-content: flex-start;">
                <div><img src="/helloing/resources/img/logo_outline.png" width="200"></div>
                <div>
                    <p>호텔<br>
                        <span class="accommName">호텔이름 1</span><br>
                        ⭐ 4.5 (10)<br>
                        86,000원</p>
                </div>
            </div>
            <div style="display: flex; justify-content: flex-start;">
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

        <h3>인기 호텔</h3> <!-- for문 돌릴거임 / 10개까지만 뿌려주자 / outer 밖 요소들은 가리기 어떻게?-->
        <div class="hot" id="hot-hotel"> 
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
        </div>

        <h3>인기 펜션</h3>
        <div class="hot" id="hot-pension">
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
        </div>

        <h3>인기 풀빌라</h3>
        <div class="hot" id="hot-poolVilla">
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
        </div>

        <h3>인기 게스트하우스</h3>
        <div class="hot" id="hot-guestHouse">
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
        </div>
		
	</div>
</body>
</html>
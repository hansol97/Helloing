<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>
<style>
div{
	border: 1px solid pink;
}
.outer{
	width: 1200px;
	margin: auto;
}
.recentlyAccom{
    display: flex;
    justify-content: space-between;

    margin-bottom: 30px;
}
.recentlyAccom>div{
    width: 350px;
}
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
}

#searchbox{
    background-color: rgb(233, 233, 233);
    padding: 0px 10px;
}
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

</style>
</head>
<body>
	<div class="outer">
        <div class="top-content">
            <form action="" method="">
                <h1>어떤 숙소 찾으세요?</h1>
                <div id="searchbox">
                    <div>
                        <input type="radio" name="category" id="hotel" checked><label for="hotel">호텔</label>
                        <input type="radio" name="category" id="pension"><label for="pension">펜션</label>
                        <input type="radio" name="category" id="poolVilla"><label for="poolVilla">풀빌라</label>
                        <input type="radio" name="category" id="guestHouse"><label for="guestHouse">게스트하우스</label>
                    </div>
                    <hr>
                    <div>
                        <input type="text" name="keyword" placeholder="전주">
                        <input type="date" name="" min="2023-01-03" max="2023-02-01" /> <!-- 스크립트로 min=오늘날짜, max=오늘+한달후날짜 계산해서 집어넣기 -->
                        <!--https://wooncloud.tistory.com/26 : 날짜 여러개 픽하는 플러그인 참고!-->
                        <input type="number" name="" >
                        <button type="submit">검색</button>
                    </div>
                </div>
            </form>
        </div>
        <h3>최근 본 숙소</h3> <!-- 쿠키 사용해서 뿌려줄 것 / 쿠키가 없다면 최근 본 숙소도 없음 -->
        <div class="recentlyAccom">
            <div style="display: flex; justify-content: flex-start;">
                <div><img src="IMG-5743.jpg" width="200"></div>
                <div>
                    <p>호텔<br>
                    <span class="accommName">호텔이름 1</span><br>
                    ⭐ 4.5 (10)<br>
                    86,000원</p>
                </div>
            </div>
            <div style="display: flex; justify-content: flex-start;">
                <div><img src="IMG-5743.jpg" width="200"></div>
                <div>
                    <p>호텔<br>
                        <span class="accommName">호텔이름 1</span><br>
                        ⭐ 4.5 (10)<br>
                        86,000원</p>
                </div>
            </div>
            <div style="display: flex; justify-content: flex-start;">
                <div><img src="IMG-5743.jpg" width="200"></div>
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
                <img src="IMG-5743.jpg" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>호텔<br>
                <span class="accommName">호텔이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
        </div>

        <h3>인기 펜션</h3>
        <div class="hot" id="hot-pension">
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>펜션<br>
                <span class="accommName">펜션이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
        </div>

        <h3>인기 풀빌라</h3>
        <div class="hot" id="hot-poolVilla">
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>풀빌라<br>
                <span class="accommName">풀빌라이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
        </div>

        <h3>인기 게스트하우스</h3>
        <div class="hot" id="hot-guestHouse">
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
            <div class="productbox">
                <img src="IMG-5743.jpg" width="150"><br>
                <p>게스트하우스<br>
                <span class="accommName">게스트하우스이름</span><br>
                ⭐ 4.5 (10)<br>
                86,000원</p>
            </div>
        </div>
		
	</div>
</body>
</html>
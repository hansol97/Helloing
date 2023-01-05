<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>
<style>
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
input[name=star]{
    margin: 10px;
}
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
.product-list{
    display: flex;
    flex-wrap: wrap;
}
.productbox{
    width: 250px;
    height: 400px;
    margin-bottom: 20px;
    margin-right: 10px;
}
.productbox>div{
    padding: 10px;
}
.productbox img{
    border-radius: 5px;
}
.accommName{
    font-size: 22px;
    font-weight: bold;
}
/* 메인 컨텐츠 끝 */



hr{
    margin: 20px 0px;
}
.inner h1{
	font-size: 30px;
	font-weight: bold;
	margin: 0px 0px 30px 0px;
}
.inner h4{
	font-size: 18px;
	font-weight: bold;
	margin-left: 10px;
}







</style>
</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/> <!-- 헤더를 넣으니까 검색창이 헤더 밑으로 간다... relative, absolute 속성 때문일까? -->
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
        <div class="top-content">
                <h1>'ㅇㅇ' 검색 결과</h1>
        </div>
        
        <div class="middle-content">
            <div class="side-bar">
                <span>필터</span>
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

                <hr>

            </div>
            <div class="main">
                <h4>총 ㅇ개</h4>
                <div class="radio-sort">
                    <input type="radio" name="radio-sort" id="recomm"><label for="recomm">추천순</label>
                    <input type="radio" name="radio-sort" id="manyreview"><label for="manyreview">많은 후기순</label>
                    <input type="radio" name="radio-sort" id="highstar"><label for="highstar">높은 평점순</label>
                    <input type="radio" name="radio-sort" id="lowprice"><label for="lowprice">낮은 가격순</label>
                    <input type="radio" name="radio-sort" id="highprice"><label for="highprice">높은 가격순</label>
                </div>
                <div class="product-list">
                    <div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
                        <div>
                            <p><span>[강원 춘천]</span>엘리시안 강촌 스키 전일권/주중권 & 장비렌탈<br> <!-- N 글자 넘어가면 ... 만들기 -->
                            ⭐ 5.0 (2)<br>
                            97,000원</p>
                        </div>
                    </div>
                    <div class="productbox">
                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
                        <div>
                            <p><span>[강원 춘천]</span>엘리시안 강촌 스키 전일권/주중권 & 장비렌탈<br>
                            ⭐ 5.0 (2)<br>
                            97,000원</p>
                        </div>
                    </div>
                    <div class="productbox">
                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
                        <div>
                            <p><span>[강원 춘천]</span>엘리시안 강촌 스키 전일권/주중권 & 장비렌탈<br>
                            ⭐ 5.0 (2)<br>
                            97,000원</p>
                        </div>
                    </div>
                    <div class="productbox">
                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
                        <div>
                            <p><span>[강원 춘천]</span>엘리시안 강촌 스키 전일권/주중권 & 장비렌탈<br>
                            ⭐ 5.0 (2)<br>
                            97,000원</p>
                        </div>
                    </div>
                    <div class="productbox">
                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
                        <div>
                            <p><span>[강원 춘천]</span>엘리시안 강촌 스키 전일권/주중권 & 장비렌탈<br>
                            ⭐ 5.0 (2)<br>
                            97,000원</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
		
	</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>
<style>
/* 검색창 */
.top-content{
    text-align: center;
    margin-bottom: 50px;
}
.top-content input{
    height: 40px;
    width: 400px;
    border-radius: 3px;
    border: 1px solid rgb(154, 154, 154);
}
.top-content button{
    height: 44px;
    width: 60px;
    margin: 0px 10px;
    border: 0;
    background-color: #053E99;
    color: white;
    border-radius: 3px;
}
/* 검색창 끝*/


.activityName{
    font-size: 20px;
    font-weight: bold;
}
.hot{
    display: flex;
    margin-bottom: 50px;
}
.productbox{
    border: 1px solid rgb(154, 154, 154);
    margin-right: 20px;
    height: 330px;
    width: 255px;
}
.productbox p{
    margin: 0px 10px;
}

.inner h3{
	font-size: 25px;
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/> <!-- 헤더를 넣으니까 검색창이 헤더 밑으로 간다... relative, absolute 속성 때문일까? -->

    <div style="height: 70px;"></div>

	<div class="inner">
        <div class="top-content">
            <form action="" method="">
                <input type="text" placeholder="&nbsp&nbsp&nbsp🔍&nbsp 상품을 검색해보세요"><button>검색</button>
            </form>
        </div>

        <h3>인기 티켓</h3> <!-- 4개까지만 뿌려주자 / 더 보기로 인기 액티비티 20개정도? 뿌려주기 -->
                           <!-- N글자 이상인 경우 ... 하는거 추가하기 -->
        <div style="text-align: right">
            <a href="">더보기 &gt; &nbsp&nbsp</a>
        </div>
        <div class="hot" id="hot-ticket"> 
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
        </div>

        <h3>인기 티켓</h3>
        <div style="text-align: right">
            <a href="">더보기 &gt; &nbsp&nbsp</a>
        </div>
        <div class="hot" id="hot-ticket"> 
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
        </div>

        <h3>인기 티켓</h3>
        <div style="text-align: right">
            <a href="">더보기 &gt; &nbsp&nbsp</a>
        </div>
        <div class="hot" id="hot-ticket"> 
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
        </div>

        <h3>인기 티켓</h3>
        <div style="text-align: right">
            <a href="">더보기 &gt; &nbsp&nbsp</a>
        </div>
        <div class="hot" id="hot-ticket"> 
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
            <div class="productbox">
                <img src="/helloing/resources/img/logo_outline.png" width="255" height="200">
                <p>가이드 투어<br>
                    <span class="activityName">[당일투어][365일 매일 출발] 그랜드캐년 + 앤텔롭</span><br>
                    ⭐⭐⭐⭐⭐ 1,844<br>
                    189,200원 / 1인
                </p>
            </div>
        </div>

		
	</div>
</body>
</html>
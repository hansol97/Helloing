<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <form action="search.activity" method="">
                <input type="text" placeholder="&nbsp&nbsp&nbsp🔍&nbsp 상품을 검색해보세요"><button>검색</button>
            </form>
        </div>

        <script>
			$(function(){
				// 상품 div 클릭 시 상세보기 페이지로 이동
				$(document).on('click', '.productbox', function(){
					var $activityNo = $(this).children().eq(0).val();
					//console.log($activityNo);
                    location.href = "detail.activity"; // 나중에 겟방식 url로 바꾸기
				})
			})
		</script>

        <h3>인기 티켓</h3> <!-- 4개까지만 뿌려주자 / 더 보기로 인기 액티비티 20개정도? 뿌려주기 -->
                           <!-- N글자 이상인 경우 ... 하는거 추가하기 -->
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
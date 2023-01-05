<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardEnrollForm</title>
<style>
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

	<jsp:include page="../common/menubar_user.jsp" />
	
	<div class="inner">
  
        <div class="middle-content">
            <div class="side-bar">
                <span>필터</span>
                <span id="reset">전체 초기화</span>



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
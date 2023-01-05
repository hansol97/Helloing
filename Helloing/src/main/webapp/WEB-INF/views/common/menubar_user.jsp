<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>반갑소잉</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@100&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <style>
  @font-face {
     font-family: 'S-CoreDream-3Light';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}
    /* common(공통) */
  body{
      color: #333;
      font-size: 16px;
      font-weight: 500;
      line-height: 1.4; /*줄 높이*/
      height: 3000px;
      font-family: 'S-CoreDream-3Light';
  }
  img{
      display: block;
  }
  a{
      text-decoration: none; 
      color: #2c2a29;
      
  }
  a:hover{
    cursor: pointer;
  }
  .inner{
      width: 1100px;
      margin: 0 auto;/*가운데 정렬*/
      position: relative;
  }

  /* Header */
  header{
      width: 100%;
      background-color: white;
      border-bottom: 1px solid #c8c8c8;
      position: fixed;
      top:0;
      z-index: 20;
  }
  header> .inner{
      height: 180px;
  }
  header .logo{
      position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      margin: auto;
  }
  header .logo img{
    height: 70%;
    margin-top: 20px;
  }
  header .sub-menu{
      position:absolute;
      top: 10px;
      right: 0;
      display: flex;
  }
  header .sub-menu ul.menu{
      display: flex; /*수평으로 정렬*/
  }
  header .sub-menu ul.menu li{
      position: relative;
  }
  header .sub-menu ul.menu li:before{/*구분선*/
      content: "";
      display: block;
      width: 1px;
      height: 12px;
      background-color: #e5e5e5;
      position: absolute;
      top: 0;
      bottom: 0;
      margin: auto;
  }
  header .sub-menu ul.menu li:first-child:before{
      display: none;
  }
  header .sub-menu ul.menu a{
      font-size: 15px;
      padding: 11px 16px;
      display: block;
      color: #656565;
  }
    
  header .main-menu{
      position: absolute;
      bottom: 0;
      left: 180px;
      z-index: 1;
      display: flex;
      
  }
  header .main-menu .item .item__name{
      padding: 20px 40px 20px;
      width: 100px;
      font-size: 17px;
      font-weight: 600;
  }
  header .main-menu .item:hover .item__name{
      border-bottom: 5px solid #FFEA24;
      color:#053E99 !important;
      border-radius: 6px 6px 0 0;
  }
  header .main-menu .item:hover .item__name a{
      color:#053E99 !important;
      border-radius: 6px 6px 0 0;
  }


/* 검색창 */
.search{
      height: 34px;
      width: 400px;
      position: relative;
}
.search input{
     width: 400px;
     height: 50px;
      padding: 4px 10px;
      margin: 50px 200px;
      border: 1px solid #ccc; 
      box-sizing: border-box;
      border-radius: 20px;
      outline: none;
      background-color: #fff;
      color: black;
      font-size: 18px;
  }
   .search input:focus{
      border-color:#053E99 ;
  }
  .search #searchImg{
      height: 25px;
      position: absolute;
      top: 60px;
      left: 550px;
      margin: auto;
  }
   .search #searchImg img{
  		height: 30px;
  }
  .search #searchImg button{
  	  left: 350px;
  	  border:none; 
	  background-color:white;
  }
  
  .search.focused #searchImg{
      opacity: 0;
  }
  /* 검색창 끝 */
  </style>

</head>
<body>

  <!--HEADER-->
  <header>
    <div class="inner">
      <!-- 로고(홈) -->
      <a href="#" class="logo"><!--/은 현재 index파일로 이동-->
        <img src="/helloing/resources/img/logo_outline.png" alt="logo" >
      </a>

      <div class="sub-menu">
        <ul class="menu">
	          <!-- 로그인 안했을 때 보이는 화면 -->
	          <li>
	            <a href="#" >회원가입</a>
	          </li>
	
	          <li>
	            <a href="#">로그인</a>
	          </li>



            <!--로그인 시 보이는 화면-->
          <!-- 
            <li style="margin: auto;">
              OOO님 반갑소잉👋
            </li>
             -->
          <li>
            <a href="#">기업 회원 신청</a>
          </li>

              
           <li>
            <a href="myPage.hj">마이페이지</a>
          </li>
          <!--기업회원일 시 보이는 화면-->
          <!--사용자 화면일 경우-->
          
          <li>
            <a href="#">기업관리</a>
          </li>
         
          <!--기업관리 화면일 경우-->
         
          <li>
            <a href="page.ad">관리자페이지</a>
          </li>
         
          <!--관리자일 시 보이는 화면-->
         <!--사용자 화면일 경우-->
          <!--
          <li>
            <a href="#">관리자페이지</a>
          </li>
          -->
          <!--관리자 화면일 경우-->
          <!--
          <li>
            <a href="#">메인페이지</a>
          </li>

          -->
        </ul>
      </div>

      <!-- 검색창 -->
          <div class="search">
            <form action="#" method="get">
              <input type="text" name="keyword" placeholder="숙소명이나 액티비티명을 입력해주세요.">
              
              <span id="searchImg"><button type="submit" style="cursor: pointer;"><img  src="/helloing/resources/img/search.png"></button></span>
            </form>
          </div>


      <ul class="main-menu">
      
		<!-- 카테고리 -->
        <li class="item">
          <div class="item__name"><a href="accomm">🏡숙소</a></div>
        </li>
        <li class="item">
          <div class="item__name"><a href="activity">🎫액티비티</a></div>
        </li>
        <li class="item">
          <div class="item__name" ><a href="#" >🍽️전라맛집</a></div>
        </li>
        <li class="item">
          <div class="item__name" ><a href="#" >🌉전라관광</a></div>
        </li>       
        <li class="item">
          <div class="item__name"><a href="selectTripBoard" >💾여행리뷰</a></div>
        </li>
      </ul>

    </div>
    

  </header>
  <br><br><br><br><br><br>


</body>
</html>
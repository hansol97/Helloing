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
      background-color: #d3d3d3;
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
    height: 100%;
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
      width: 150px;
      font-size: 17px;
      font-weight: 600;
      text-align: center;
      border-bottom: 5px solid #d3d3d3;
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

  /* 관리자 메뉴바 */
  .main-menu{
      list-style : none;
      /* ul요소는 기본적으로 위, 아래 margin이 존재한다. 심지어 padding도 있다. */
      margin: 0px;
      padding: 0px;
  }

  .main-menu > li > ul {
      list-style : none;
      padding : 0px;
      display : none; /* 평소에는 안보이다가 마우스가 올라가는 순간 펼쳐지는 효과 */
  }

  .main-menu > li > a:hover + ul{
      display :block; /* 평소에는 안보이다가 마우스가 올라가는 순간 펼쳐지는 효과2 */
  }

  .main-menu > li > ul:hover {
      display : block; /* 평소에는 안보이다가 마우스가 올라가는 순간 펼쳐지는 효과3 */
  }
 
  </style>

</head>
<body>

  <!--HEADER-->
  <header>
    <div class="inner">
      <!-- 로고(홈) -->
      <a href="#" class="logo"><!--/은 현재 index파일로 이동-->
        <img src="/helloing/resources/img/admin_logo.png" alt="logo" >
      </a>

      <div class="sub-menu">
        <ul class="menu">
          <li>
	      	<h4 style="padding : 10px;">반갑소잉 관리자님, 환영합니다.😊</h4>
	      </li>
          <li>
            <a href="#">메인페이지로 가기</a>
          </li>

        </ul>
      </div>


      <ul class="main-menu">
      
		<!-- 카테고리 -->
        <li class="item">
          <div class="item__name"><a href="memList.ad">👤회원 관리</a></div>
        </li>
        <li class="item">
          <div class="item__name"><a href="activity">📄게시글 관리</a></div>
        </li>
        <li class="item">
          <div class="item__name" ><a href="#" >💬챗봇관리</a></div>
        </li>
        <li class="item">
          <div class="item__name" ><a href="#" >💰결제관리</a></div>
        </li>       
      </ul>

    </div>
    

  </header>
  <br><br><br><br><br><br>


  </script>
</body>
</html>
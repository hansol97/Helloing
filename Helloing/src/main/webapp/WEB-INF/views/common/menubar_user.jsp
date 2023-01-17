<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
     //치환 변수 선언합니다.
      pageContext.setAttribute("crcn", "\r\n"); //Space, Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%>
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

  /* 모달 */
    
  .chat_modal {
    position: absolute;
    top: 0;
    left: 0;

    width: 100%;
    height: 100%;

    display: none;

  }

  .chat_modal.show {
    display: block;
  }

  .chat_modal_body {
    position: absolute;
    bottom:2%;
    right:1%;

    width: 320px;
    height: 400px;

    padding: 40px;

    
    /* text-align: center; */

    background-color: rgb(255, 255, 255);
    border-radius: 10px;
    box-shadow: 2px 5px 6px 4px rgba(21, 22, 24, 0.15);

    /* transform: translateX(-50%) translateY(-50%); */
  }

  .chat_modal-title{
    margin-bottom:20px;
  }

  .chat_modal-title span{
    font-weight: bold;
  }

  #chatbot_btn {
    position: absolute;
    /* top:880px;
    right:0px; */
    bottom:0%;
    right:0%;

    width: 40px;
    height: 40px;

    padding: 5px;

    overflow-x: auto;
    text-align: center;

    background-color: #ffffff;
    border-radius: 50px;
    box-shadow: 2px 5px 6px 4px rgba(21, 22, 24, 0.15);
    opacity: 0.9;

    transform: translateX(-50%) translateY(-50%);
  }

  #chatbot_btn span{
    font-size: 25px;
    color:#ffffff;
    font-weight:bold;
  }

  /* 챗봇 */

  chatbot #chatbot_btn, .chat_modal{
    position:fixed;
  }


  #chat_view{
    padding:5px;
    width:300px;
    height:310px;
    padding:0px;
    overflow-x: auto;
  }

  .admin_chat{
    width:250px;
    margin-bottom:10px;
    background-color: rgb(226, 226, 226);
    border-radius: 10px;
    padding:10px;
    white-space: pre-wrap;
    
    clear:both;
    
  }

  .user_chat{
    float:right;
    margin-bottom:10px;
    padding:10px;
    background-color: #65a0ff;
    color:white;
    border-radius: 10px;
  }

  #chat_input input{
    width:235px;
    height:23px;
    margin:8px;
    margin-right:0px;
    border-radius: 3px;
    border:1px solid grey;
  }

  #chat_input button{
    font-size:21px;
    vertical-align: middle;
    padding:3px;
    margin-bottom:6px;
    background-color: white;
    border:none;
  }

  button.admin_chat{
    border:2px solid rgb(226, 226, 226);
    font-family: 'S-CoreDream-3Light';
    text-align:left;
    width:250px;
  }

  button.admin_chat:hover{
    cursor:pointer;
    border:2px solid rgb(193, 193, 193);
    font-size:13px;
  }

  .wrap_user_chat{
    float:left;
    width:280px;
    height:50px;
    margin:0px;
    padding:0px;
  }

  .chat_qa_btn{
    background-color: rgb(233, 233, 233);
    display:inline-block;
    width:120px;
    height:27px;
    text-align: center;
    border-radius: 3px;
    border:1px solid rgb(150, 150, 150);
    margin-left:25px;
    margin-top:5px;
  }

  .admin_chat.chat_qa_area{
    width:180px;
  }

  </style>

</head>
<body>

<c:if test="${not empty alertMsg}">
    <script>
    alert('${alertMsg}')
    </script>
    <c:remove var="alertMsg" scope="session"/>
</c:if>


  <!--HEADER-->
  <header>
    <div class="inner">
      <!-- 로고(홈) -->
      <a href="/helloing" class="logo"><!--/은 현재 index파일로 이동-->
        <img src="/helloing/resources/img/logo_outline.png" alt="logo" >
      </a>

      <div class="sub-menu">
     	
        <ul class="menu">

        	<c:choose>
        		<c:when test="${ empty loginUser }"	>
		          <!-- 로그인 안했을 때 보이는 화면 -->
		          <li>
		            <a href="terms.me" >회원가입</a>
		          </li>
		
		          <li>
		            <a href="loginForm.me">로그인</a>
		          </li>

		          
		          <li>
		            <a href="loginMove.bu">기업 회원 신청</a>
		          </li>
	          	</c:when>
	          		<c:otherwise>
	          			<!--로그인 시 보이는 화면-->

						<li style="margin: auto;">${ loginUser.memName }님 반갑소잉👋</li>

						<li><a href="logout.me">로그아웃</a></li>

						<!-- 기업 회원을 신청하지 않은 회원에게만 보여주기 -->
						<c:if test="${ empty loginCompany and loginUser.status != 'A' }">
							<li><a href="businessEnrollForm.bu">기업 회원 신청</a></li>
						</c:if>

						<li><a href="accommBook.hj">마이페이지</a></li>
						<!--기업회원일 시 보이는 화면-->
						<!--사용자 화면일 경우-->

						<!-- 기업 회원에게만 보여주기 -->
						<c:if test="${ not empty loginCompany }">
							<li><a href="accommList.bu">기업관리</a></li>
						</c:if>
						<!--기업관리 화면일 경우-->
						<c:if test="${ loginUser.status == 'A' }" >
						<li><a href="memList.ad">관리자페이지</a></li>
						</c:if>
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
					</c:otherwise>
				</c:choose>
        </ul>
        
      </div>

      <!-- 검색창 -->
      <%--
          <div class="search">
            <form action="search.pd" method="get">
              <input type="text" name="keyword" placeholder="숙소명이나 액티비티명을 입력해주세요.">
              
              <span id="searchImg"><button type="submit" style="cursor: pointer;"><img  src="/helloing/resources/img/search.png"></button></span>
            </form>
          </div>
 --%>

      <ul class="main-menu">
      
		<!-- 카테고리 -->
        <li class="item">
          <div class="item__name"><a href="accomm">🏡숙소</a></div>
        </li>
        <li class="item">
          <div class="item__name"><a href="activity">🎫액티비티</a></div>
        </li>
        <li class="item">
          <div class="item__name" ><a href="hotPlace" >🍽️전라맛집</a></div>
        </li>
        <li class="item">
          <div class="item__name" ><a href="#" >🌉전라관광</a></div>
        </li>       
        <li class="item">
          <div class="item__name"><a href="tripBoard">💾여행리뷰</a></div>
        </li>
      </ul>

    </div>
    

  </header>
  <br><br><br><br><br><br>

  <chatbot>
    <div id="chatbot_btn" class="chat-btn-open">
      <span>🙋‍♂️</span>
    </div>

    <div class="chat_modal">
      <div class="chat_modal_body">
          <div>
              <div class="chat_modal-title">
                  <span>반갑소잉 : 전라</span>
              </div>

              <div id="chat_view">
                
              </div>
              <div id="chat_input">
                  <input id="chatbot_user_input" type="text">
                  <button onclick="addUserChat(); return false;">📄</button>
              </div>
          </div>
      </div>
  </div>
  </chatbot>

  <script>
    const cbBody = document.querySelector('body');
    const chatModal = document.querySelector('.chat_modal');
    const chatBtnOpen = document.querySelector('.chat-btn-open');

    chatBtnOpen.addEventListener('click', () => {
      chatModal.classList.toggle('show');

    });

    chatModal.addEventListener('click', (event) => {
      if (event.target === chatModal) {
        chatModal.classList.toggle('show');

      }
    });



    var $chatBody = $('#chat_view')

    $(function(){
      $('#chatbot_btn').click(function(){
        $chatBody.children().remove('');
        $.ajax({
          url:'adminInfo.ch'
          ,data : {
            chatbotKeyword : '[admin]안내메세지'
          }
          ,success: function(c){
            console.log(c[0].chatbotA);

            $chatBody.append('<div class="admin_chat">' + c[0].chatbotA + '</div>');
          }
          ,error : function(){
            console.log('실패');
          }
        })
      })
    });
    
    var chatbotList = '';
    let $userInput = $('#chatbot_user_input');
    
    function addUserChat(){
      $chatBody.append('<div class="wrap_user_chat"><div class="user_chat"><p>' + $userInput.val() + '</p></div></div>');
      $.ajax({
        url : 'adminInfo.ch'
        ,data : {
          chatbotKeyword : $userInput.val()
        }
        ,success: function(cList){
          $userInput.val(null);
          if(cList == ''){
            $chatBody.append('<div class="admin_chat chat_qa_area" onclick="QAInfo();"> 검색된 결과가 없습니다.<br>'+
              '<button class="chat_qa_btn">1:1문의 바로가기</button></div>');
          }
          for(var i = 0; i < cList.length; i++){
            $chatBody.append('<button class="admin_chat" onclick="bringChatbotA(' + i + ');">'+ (i+1) + '. ' + cList[i].chatbotQ + '</button>');
          }
          $chatBody.scrollTop($chatBody[0].scrollHeight);
          chatbotList = cList;
        }
        ,error : function(){
          console.log('실패');
        }
      });
    }

    function bringChatbotA(num){
      $chatBody.append('<div class="admin_chat">' + chatbotList[num].chatbotA + '</div>')
      $chatBody.scrollTop($chatBody[0].scrollHeight);
      }
    
    
  </script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록한 숙소 조회</title>
<link rel="stylesheet" type="text/css" href="resources/css/accommList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
    
</style>


</head>
<body>

    <div class="header"></div>
    <jsp:include page="menubar_business.jsp"/>
    
    
    <div class="container-fluid px-lg-5 body">
        <div class="row justify-content-center">
          <br><br><br>
          <div class="accommTitle">등록 숙소 관리</div>
          
          <button class="button button--ujarak button--border-thin button--text-thick enrollBtn"  onclick="location.href='goInsertAccom.bu'">숙소 등록</button>


            
        <!-- 한 뭉치 반복 시작 -->
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card w-100">
              <div class="meta">
                <!--"첫번째 호텔 사진"-->
                <div class="photo" style="background-image: url(resources/img/IHimg/hotelex.jpg)"></div>
              </div>
              <div class="description">
                <span style="font-size: larger;">숙소 이름 : ${requestScope.accList[0].accommName}  </span>                                            
                <div class="more_details">
                    <img class="more" src="resources/img/IHimg/more.png" alt="더보기">
                    <!-- 여기 이미지를 클릭하면 리스트가 펴져서 팔로우, 신고, 수정, 삭제 버튼 뜨게 -->
                    <div class="more_buttons">
                        <button onclick='location.href="goInsertRoom.bu?accommNo=${requestScope.accList[0].accommNo}"' class="more_button">객실등록</button>
                        <!-- <button onclick='location.href="goInsertRoom.bu?accommNo=$"' class="more_button">객실등록</button> -->
                        <button onclick='location.href="goUpdateAccom.bu?accommNo=${requestScope.accList[0].accommNo}"' class="more_button">숙소수정</button>
                        <button onclick='location.href="deleteAccom.bu?accommNo=${requestScope.accList[0].accommNo}"' class="more_button">숙소삭제</button>
                        <button onclick='location.href="goPayAccom.bu?accommNo=${requestScope.accList[0].accommNo}"' class="more_button">추가결제</button>
                    </div>
                </div>
                <br>
                <div class="endDate"> 🕑결제 만료일 : ${requestScope.accList[0].endDate}   </div><br> 
                <h2 class="pt-1 pb-4"> &nbsp; 내용 :  ${requestScope.accList[0].accommContent}
                </h2>
                <h2 class="pt-1 pb-4"> &nbsp; 주소 : ${requestScope.accList[0].address}</h2>
                

                <div class="room-area">▶️ ${requestScope.accList[0].roomList[0].roomName} &nbsp; &nbsp;
                
                  <button onclick='location.href="accommBookList.bu"' class="button button--ujarak button--border-thin button--text-thick">예약자 확인</button>
                  <button onclick='location.href="goUpdateRoom.bu"' class="button button--ujarak button--border-thin button--text-thick" >수정</button>
                  <button onclick='location.href="accommBookList.bu"' class="button button--ujarak button--border-thin button--text-thick">삭제</button>
                </div>

                <!-- 위 div 반복시키고 삭제할 것  -->
                <div class="room-area">▶️ 객실1 쓰는 곳 객실이름입니다다객이름00000000000000000 &nbsp; &nbsp;                
                  <button class="button button--ujarak button--border-thin button--text-thick">예약자 확인</button>
                  <button class="button button--ujarak button--border-thin button--text-thick">수정</button>
                  <button class="button button--ujarak button--border-thin button--text-thick">삭제</button>
                </div>
                <div class="room-area">▶️ 객실1 쓰는 곳 객실이름입니다다객이름00000000000000000 &nbsp; &nbsp;                
                  <button class="button button--ujarak button--border-thin button--text-thick">예약자 확인</button>
                  <button class="button button--ujarak button--border-thin button--text-thick">수정</button>
                  <button class="button button--ujarak button--border-thin button--text-thick">삭제</button>
                </div>
               

                <div class="read-more">
                  <a href="#">숙소 상세보기</a>
                </div>
              </div>
            </div>
          </div>

        <!-- 반복 끝 -->

        
       

                    
            

        
      <br><br><br>
      <div class="nomore">더 이상 숙소가 없습니다 <br><br>
          <a class="scrollToTop" href="">🔝맨 위로 이동🔝</a>
      </div>
      <script>
          let scrollToTop = document.querySelector(".scrollToTop");
          scrollToTop.onclick = () => window.scrollTo({ top: 0, behavior: "smooth" });
          // scrollToTop.onclick(function() { window.scrollTo({ top: 0, behavior: "smooth" })});

      $(function () {
        $(".more").click(function(){
          $(this).siblings(0).toggle(500);
        })
      });
		

      </script>
        

      





    </div>
  </div>




</body>
</html>
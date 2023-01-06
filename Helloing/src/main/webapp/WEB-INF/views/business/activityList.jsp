<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록한 액티비티 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/activityList.css">
<style>
    
</style>


</head>
<body>
    <div class="header"></div>
    <jsp:include page="menubar_business.jsp"/>
    
    
    <div class="container-fluid px-lg-5 body">
        <div class="row justify-content-center">
          <br><br><br>
          <div class="accommTitle">등록한 액티비티<div class="inAT"></div></div>
            
          <button class="button button--ujarak button--border-thin button--text-thick enrollBtn">액티비티 등록</button>


            
        <!-- 한 뭉치 반복 시작 -->
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card w-100">
              <div class="meta">
                <!--"첫번째 호텔 사진"-->
                <div class="photo" style="background-image: url(resources/img/IHimg/bungi.png)"></div>
              </div>
              <div class="description">
                <span style="font-size: larger;">이곳이 바로 액티비티 이름을 쓰는 곳입니다</span>                                            
                <div class="more_details">
                    <img class="more" src="resources/img/IHimg/more.png" alt="더보기">
                    <!-- 여기 이미지를 클릭하면 리스트가 펴져서 팔로우, 신고, 수정, 삭제 버튼 뜨게 -->
                    <div class="more_buttons">
                      <button class="more_button">만료연장</button><!--결제페이지로-->
                      <button class="more_button">삭제</button>
                      <button class="more_button">수정</button>
                      <button class="more_button">티켓등록</button>
                    </div>
                </div>
                <br>
                <div class="endDate"> 🕑결제 만료일 : 2023.12.12 </div><br>
                <h2 class="pt-1 pb-4"> &nbsp; 티켓내용 쓰는 곳 
                    티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 
                    티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 
                    티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 
                    티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 티켓내용 쓰는 곳 

                </h2>
                <h2 class="pt-1 pb-4"> &nbsp; 주소 쓰는곳 주소주소주소</h2>
                <div class="room-area">▶️ 티켓1 쓰는 곳 티켓이름입니다다티켓이름입니다티켓이름입니다티켓이름 &nbsp; &nbsp;                
                  <button class="button button--ujarak button--border-thin button--text-thick" disabled>예약자수 X명</button>
                  <button class="button button--ujarak button--border-thin button--text-thick">수정</button>
                  <button class="button button--ujarak button--border-thin button--text-thick">삭제</button>
                </div>
                <div class="room-area">▶️ 티켓1 쓰는 곳 티켓이름입니다다티켓이름입니다티켓이름입니다티켓이름 &nbsp; &nbsp;                
                  <button class="button button--ujarak button--border-thin button--text-thick" disabled>예약자수 X명</button>
                  <button class="button button--ujarak button--border-thin button--text-thick">수정</button>
                  <button class="button button--ujarak button--border-thin button--text-thick">삭제</button>
                </div>
                <div class="room-area">▶️ 티켓1 쓰는 곳 티켓이름입니다다티켓이름입니다티켓이름입니다티켓이름 &nbsp; &nbsp;                
                  <button class="button button--ujarak button--border-thin button--text-thick" disabled>예약자수 X명</button>
                  <button class="button button--ujarak button--border-thin button--text-thick">수정</button>
                  <button class="button button--ujarak button--border-thin button--text-thick">삭제</button>
                </div>




                <div class="read-more">
                  <a href="#">액티비티 상세보기</a>
                </div>
              </div>
            </div>
          </div>

        <!-- 반복 끝 -->
                    

        
        
        <br><br><br>
        <div class="nomore">더 이상 액티비티가 없습니다 <br><br>
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
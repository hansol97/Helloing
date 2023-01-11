<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <span style="font-size: larger;">이곳이 바로 숙소 이름이 나오는 곳입니다</span>                                            
                <div class="more_details">
                    <img class="more" src="resources/img/IHimg/more.png" alt="더보기">
                    <!-- 여기 이미지를 클릭하면 리스트가 펴져서 팔로우, 신고, 수정, 삭제 버튼 뜨게 -->
                    <div class="more_buttons">
                        <button onclick='location.href="goInsertRoom.bu?accommNo=3"' class="more_button">객실등록</button>
                        <!-- <button onclick='location.href="goInsertRoom.bu?accommNo=$"' class="more_button">객실등록</button> -->
                        <button onclick='location.href="goUpdateAccom.bu"' class="more_button">숙소수정</button>
                        <button onclick='location.href="#"' class="more_button">숙소삭제</button>
                        <button onclick='location.href="goPayAccom.bu"' class="more_button">추가결제</button>
                    </div>
                </div>
                <br>
                <div class="endDate"> 🕑결제 만료일 : 2023.12.12 </div><br> 
                <h2 class="pt-1 pb-4"> &nbsp; 숙소의 내용을 쓰는 곳입니다. 크하하하하하!!!!!!!!!숙소의 내용을 쓰는 곳입니다. 크하하하하하!!!!!!!!!숙소의 내용을 쓰는 곳입니다.
                    내용이 얼마나 들어갈까내용이 얼마나 들어갈까내용이 얼마나 들어갈까내용이 얼마나 들어갈까내용이 얼마나 들어갈까내용이 얼마나 들어갈까
                    내용이 얼마나 들어갈까내용이 얼마나 들어갈까내용이 얼마나 들어갈까내용이 얼마나 들어갈까
                    숙소의 내용을 쓰는 곳입니다. 크하하하하하!!!!!!!!!숙소의 내용을 쓰는 곳입니다. 크하하하하하!!!!!!!!!숙소의 내용을 쓰는 곳입니다.
                  
                     크하하하하하!!!!!!!!!숙소의 내용을 쓰는 곳입니다. 크하하하하하!!!!!!!!!</h2>
                <h2 class="pt-1 pb-4"> &nbsp; 주소 쓰는곳 주소주소주소</h2>
                <div class="room-area">▶️ 객실1 쓰는 곳 객실이름입니다다객이름00000000000000000 &nbsp; &nbsp;
                
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
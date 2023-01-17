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


        <c:forEach items="${requestScope.accList}" var="aL">    
        <!-- 한 뭉치 반복 시작 -->
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card w-100">
              <div class="meta">
                <!--"첫번째 호텔 사진"-->
                <div class="photo" style="background-image: url(${aL.attachment})"></div>
              </div>
              <div class="description">
                <span style="font-size: larger;">숙소 이름 : ${aL.accommName}  / 숙소 번호 : ${aL.accommNo}</span>                                            
                <div class="more_details">
                    <img class="more" src="resources/img/IHimg/more.png" alt="더보기">
                    <!-- 여기 이미지를 클릭하면 리스트가 펴져서 팔로우, 신고, 수정, 삭제 버튼 뜨게 -->
                    <div class="more_buttons">
                      <button onclick='location.href="goPayAccom.bu?accommNo=${aL.accommNo}&accommName=${aL.accommName}"' class="more_button">만료연장</button>
                      <button onclick='location.href="deleteAccomm.bu?accommNo=${aL.accommNo}"' class="more_button">숙소삭제</button>
                      <button onclick='location.href="goUpdateAccom.bu?accommNo=${aL.accommNo}"' class="more_button">숙소수정</button>
                      <button onclick='location.href="goInsertRoom.bu?accommNo=${aL.accommNo}"' class="more_button">객실등록</button>
                    </div>
                </div>
                <br>
                <div class="endDate"> 🕑결제 만료일 : ${aL.endDate}   </div><br> 
                <h2 class="pt-1 pb-4"> &nbsp; 내용 :  ${aL.accommContent}
                </h2>
                <h2 class="pt-1 pb-4"> &nbsp; 주소 : ${aL.address}</h2>
                
                  <c:choose> 
                    <c:when test="${ not empty aL.roomList }">
                      <c:forEach items="${aL.roomList}" var="rL">
                        <div class="room-area">▶️ 객실명 :  ${rL.roomName} &nbsp; &nbsp;
                          <button onclick='location.href="accommBookList.bu?roomNo=${rL.roomNo}"' class="button button--ujarak button--border-thin button--text-thick">예약자 확인</button>
                          <button onclick='location.href="goUpdateRoom.bu?roomNo=${rL.roomNo}"' class="button button--ujarak button--border-thin button--text-thick" >수정</button>
                          <button onclick='location.href="deleteRoom.bu?roomNo=${rL.roomNo}"' class="button button--ujarak button--border-thin button--text-thick">삭제</button>
                        </div>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <div class="room-area">▶️ 등록된 객실이 없습니다. 등록 해주세요!🙋‍♀️🙋‍♀️ &nbsp; &nbsp;
                        <button onclick='location.href="goInsertRoom.bu?accommNo=${aL.accommNo}"' class="button button--ujarak button--border-thin button--text-thick">객실등록</button>
                      </div>
                    </c:otherwise>

                  </c:choose>

                <div class="read-more">
                  <a href="detail.accomm?accommNo=${rL.accommNo}">숙소 상세보기(사용자 페이지로 이동)</a>
                </div>
              </div>
            </div>
          </div>

        <!-- 반복 끝 -->
      </c:forEach>
        
       

                    
            

        
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록한 액티비티 페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/activityList.css">
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
      <div class="accommTitle">등록한 액티비티<div class="inAT"></div></div>
        
      <button class="button button--ujarak button--border-thin button--text-thick enrollBtn" onclick="location.href='goInsertAct.bu';">액티비티 등록</button>


      <c:forEach items="${requestScope.actList}" var="aL">
        <!-- 한 뭉치 반복 시작 -->
        <div class="col-lg-4 col-md-6 d-flex">
          <div class="blog-card w-100">
            <div class="meta">
              <!--"첫번째 호텔 사진"-->
              <div class="photo" style="background-image: url(${aL.attachment})"></div>
            </div>
            <div class="description">
              <span style="font-size: larger;">액티비티 이름 : ${aL.activityName} /  액티비티 번호 : ${aL.activityNo}</span>                                            
              <div class="more_details">
                  <img class="more" src="resources/img/IHimg/more.png" alt="더보기">
                  <!-- 여기 이미지를 클릭하면 리스트가 펴져서 팔로우, 신고, 수정, 삭제 버튼 뜨게 -->
                  <div class="more_buttons">
                    <button onclick='location.href="goPayAct.bu?activityNo=${aL.activityNo}&activityName=${aL.activityName}"'  class="more_button">만료연장</button><!--결제페이지로-->
                    <button onclick='location.href="deleteAct.bu?activityNo=${aL.activityNo}"'  class="more_button">액티삭제</button>
                    <button onclick='location.href="goUpdateAct.bu?activityNo=${aL.activityNo}"'  class="more_button">액티수정</button>
                    <button onclick='location.href="goInsertTicket.bu?activityNo=${aL.activityNo}"'  class="more_button">티켓등록</button>
                  </div>
              </div>
              <br>
              <div class="endDate"> 🕑결제 만료일 : ${aL.endDate} </div><br>
              <h2 class="pt-1 pb-4"> &nbsp; 
                ${aL.activityContent}
              </h2>

              <c:choose> 
                <c:when test="${ not empty aL.ticketList }">
                  <c:forEach items="${aL.ticketList}" var="tL">
                    <div class="room-area">▶️ ${tL.ticketName} &nbsp; &nbsp;                
                      <button class="button button--ujarak button--border-thin button--text-thick" disabled>예약자수 ${tL.count}명</button>
                      <button onclick='location.href="goUpdateTicket.bu?${tL.ticketNo}"' class="button button--ujarak button--border-thin button--text-thick">수정</button>
                      <button onclick='location.href="deleteTicket.bu?${tL.ticketNo}"' class="button button--ujarak button--border-thin button--text-thick">삭제</button>
                    </div>
                  </c:forEach>
                </c:when>
                <c:otherwise>
                  <div class="room-area">▶️ 등록된 티켓이 없습니다. 등록 해주세요!🙋‍♀️🙋‍♀️ &nbsp; &nbsp;
                    <button onclick='location.href="goInsertTicket.bu?activityNo=${aL.activityNo}"' class="button button--ujarak button--border-thin button--text-thick">티켓등록</button>
                  </div>
                </c:otherwise>
              </c:choose>

              <div class="read-more">
                <a href="detail.activity?activityNo=${aL.activityNo}">액티비티 상세보기(사용자 페이지로 이동)</a>
              </div>
            </div>
          </div>
        </div>

      </c:forEach>        
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
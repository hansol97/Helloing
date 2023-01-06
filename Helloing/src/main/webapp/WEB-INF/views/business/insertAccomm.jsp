<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소등록페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/accommList.css">
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
          
            
        <!-- 한 뭉치 반복 시작 -->
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card enrollform">
               

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
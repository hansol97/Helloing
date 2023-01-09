<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업결제 - 숙소</title>
<link rel="stylesheet" type="text/css" href="resources/css/accommList.css">
<style>
</style>

</head>
<body>
    <jsp:include page="menubar_business.jsp"/>
    
    <div class="container-fluid px-lg-5 body">
        <div class="row justify-content-center">
          <br><br><br>
            <div class="accommTitle">기업결제 - 숙소</div>
            
          
            <!--등록 폼 박스-->
            <div class="fatherEnrollForm">
                <div class="blog-card enrollform" >
                    <form action="insertAcomm.bu" method="post" enctype="multipart/form-data" class="innerform">
                    <!-- 피드 등록 내용물 -->
                    <div style="font-size: 30px; display:inline; text-align: center; margin-left: 8%;"> <br><br>&nbsp;&nbsp;&nbsp; &nbsp;🏠기업결제 - 숙소 </div>
                        <br><br><br>
                    <div class="billBox">
                        숙소 이름 : <span id="accomName"> 대관령 대박호텔 </span><br><br>
                        <!-- 숙소번호 -->
                        <input type="hidden" name="accomNo">
                    </div>
      
                    <div class="paymentBox">
                        <h1 style="font-size: larger; font-weight: bolder;">숙소 등록권 1년 정기결제 - 300,000 원</h1>
                        <br><br>
                        <h3>       1년 정기 결제하시면 1년간 등록하신 숙소가 사용자 조회 목록에 나타납니다 </h3>
                    </div>
                        <br><br>
                    <div class="feed_modal_btns" align="center">
                        <br>
                        <button type="submit" class="button--ujarak button" id="red_btn2"> 결제하기 </button>
                        <button type="reset" class="button--ujarak button">취소하기</button>

                    </div>
                    </form>

                </div>
            </div>
            <!-- 등록 폼 박스 끝 -->
        </div>
    </div>


</body>
</html>
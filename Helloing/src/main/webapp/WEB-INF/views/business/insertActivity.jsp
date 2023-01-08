<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액티비티등록페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/accommList.css">
<style>
    
</style>


</head>
<body id="insertActBody">
    <jsp:include page="menubar_business.jsp"/>
    
    
    <div class="container-fluid px-lg-5 body">
        <div class="row justify-content-center">
          <br><br><br>
          <div class="accommTitle">액티비티 등록 페이지</div>
          
        <!--등록 폼 박스-->
          <div class="fatherEnrollForm">
            <div class="blog-card enrollform" >
			<form action="insertAcomm.bu" method="post" enctype="multipart/form-data" class="innerform">
			<!-- 피드 등록 내용물 -->
			<div style="font-size: 30px; display:inline; text-align: center; margin-left: 8%;"> <br><br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;👉당신의 🎡액티비티를 등록해 😋주세요!❤️ </div>
				<table class="accommFormTable" cellpadding="10" cellspacing="10" style="width: 100%; margin-top: 50px; text-align: left;"  >
					<tr>
						<th width="150px" height="40px"> 액티비티 이름 :</th>
						<td width="400px">
							<input id="amName" type="text" name="title" height="100px" size="40" required placeholder="아무튼 입력"/>
						</td>
					</tr>

					<tr>
						<th style="vertical-align: middle;">액티비티 설명 :</th>
						<td height="40px">
							<textarea name="amDescription" rows="10" style="resize: none; width: 70%;" required placeholder="아무튼 입력"></textarea>
						</td>
					</tr>
	
                    <!-- 히든 넣는 곳 -->
					<tr>
						<td>
                            <input type="hidden" name="busiNo">
                        </td>
					</tr>

				</table>
					<input type="hidden" class="hidden" name="userNo" value=""/><!-- 사업자번호 히든 -->
					<div class="titleImg_class1" style="margin-left: 15px;">
						<br><br><p>🎈 액티비티의 외관이나 부대시설 사진을 등록해 주세요</p>	<br><br>
						<input type="file" name="accommPhoto1" /><br><br>
						<input type="file" name="accommPhoto2" /><br><br>
						<input type="file" name="accommPhoto3" /><br><br><br><br>
					</div>

			<div class="feed_modal_btns" align="center">
				<br>
				<button type="submit" class="button--ujarak button" id="red_btn2"> 등록 </button>
				<button type="reset" class="button--ujarak button">초기화</button>
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
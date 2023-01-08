<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업결제 - 객실</title>
<link rel="stylesheet" type="text/css" href="resources/css/accommList.css">
<style>
    
</style>


</head>
<body>
    <jsp:include page="menubar_business.jsp"/>
    
    
    <div class="container-fluid px-lg-5 body">
        <div class="row justify-content-center">
          <br><br><br>
          <div class="accommTitle">기업결제 - 객실</div>
          
        <!--등록 폼 박스-->
          <div class="fatherEnrollForm">
            <div class="blog-card enrollform" >
			<form action="insertAcomm.bu" method="post" enctype="multipart/form-data" class="innerform">
			<!-- 피드 등록 내용물 -->
			<div style="font-size: 30px; display:inline; text-align: center; margin-left: 8%;"> <br><br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;기업결제 - 객실 </div>
				<table class="accommFormTable" cellpadding="10" cellspacing="10" style="width: 100%; margin-top: 50px; text-align: left;"  >
					<tr>
						<th width="200px" height="40px"> 숙소 이름 :</th>
						<td width="400px">
							<h1> 정말로 잠 잘오는 숙소</h1>
						</td>
					</tr>
					<tr>
						<th width="200px" height="40px"> 객실 이름 :</th>
						<td width="400px">
							<input id="amName" type="text" name="roomName" height="100px" size="40" required placeholder="아무튼 입력"/>
						</td>
					</tr>
					<tr><!--히든인풋들 -->
						<th>&nbsp;&nbsp;</th>
						<td>
                            <input type="hidden">
                            <input type="hidden">
                            <input type="hidden">
                        </td>
					</tr>
					<tr>
						<th>수용 인원 수 : </th>
						<td>
							<input type="number" name="capacity" id="" placeholder="1"> 명
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<th>객실 가격 :</th>
						<td>
							<input type="number" name="price" id="" placeholder="10000"> 원
						</td>
					</tr>

				</table>
					<div class="titleImg_class1" style="margin-left: 15px;">
						<br><br><p>🎈객실 사진을 등록해 주세요</p>	<br><br>
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
  </div>




</body>
</html>
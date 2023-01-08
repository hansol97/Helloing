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
    <jsp:include page="menubar_business.jsp"/>
    
    
    <div class="container-fluid px-lg-5 body">
        <div class="row justify-content-center">
          <br><br><br>
          <div class="accommTitle">숙소 등록 페이지</div>
          
        <!--등록 폼 박스-->
          <div class="fatherEnrollForm">
            <div class="blog-card enrollform" >
			<form action="insertAcomm.bu" method="post" enctype="multipart/form-data" class="innerform">
			<!-- 피드 등록 내용물 -->
			<div style="font-size: 30px; display:inline; text-align: center; margin-left: 8%;"> 👉당신의 👍멋진 🛖숙소를 🕵️‍♀️등록해 😋주세요!❤️ </div>
				<table class="accommFormTable" cellpadding="10" cellspacing="10" style="width: 1000px;"  >
					<tr>
						<th width="100" height="40px"> 숙소 이름 :</th>
						<td width="400px">
							<input id="amName" type="text" name="title" height="100px" width="550px" required placeholder="아무튼 입력"/>
						</td>
					</tr>
					<tr>
						<th id="feed_content" style="vertical-align: middle;">숙소 주소 :</th>
						<td height="40px">
							<textarea name="amDescription" rows="2" style="resize: none; width: 70%;" required placeholder="아무튼 입력"></textarea>
						</td>
					</tr>
					<tr>
						<th id="feed_content" style="vertical-align: middle;">숙소 설명 :</th>
						<td height="40px">
							<textarea name="amDescription" rows="10" style="resize: none; width: 70%;" required placeholder="아무튼 입력"></textarea>
						</td>
						<br><br>
					</tr>
					<tr>
						<th>&nbsp;&nbsp;</th>
						<td>&nbsp;&nbsp;</td>
					</tr>
					<tr>
						<th id="feed_tag">등급 선택 :</th>
						<br>
						<td>
							<select name="rating" id="rating">
								<option value='1'>1 등급</option>
								<option value='2'>2 등급</option>
								<option value='3'>3 등급</option>
								<option value='4'>4 등급</option>
								<option value='5'>5 등급</option>
							</select>
						</td>
					</tr>
					<tr>
						<th id="feed_tag">카테고리 :</th>
						<br>
						<td>
							<select name="rating" id="rating"> 
								<option value='1'>호텔</option>
								<option value='2'>2 등급</option>
								<option value='3'>3 등급</option>
								<option value='4'>4 등급</option>
								<option value='5'>5 등급</option>
							</select>
						</td>
					</tr>
				</table>
					<input type="hidden" class="hidden" name="userNo" value=""/><!-- 사업자번호 히든 -->
					<div class="titleImg_class1" style="margin-left: 15px;">
						<p>🎈 숙소의 외관이나 부대시설 사진을 등록해 주세요</p>	<br />
						<input type="file" name="accommPhoto1" /><br><br>
						<input type="file" name="accommPhoto2" /><br><br>
						<input type="file" name="accommPhoto3" /><br><br>
					</div>

			<div class="feed_modal_btns" align="center">
				<br />
				<button type="submit" class="" id="red_btn2"> 등록 </button>
				<button type="reset" class="">초기화</button>
				<button type="reset" class="">취소하기</button>

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
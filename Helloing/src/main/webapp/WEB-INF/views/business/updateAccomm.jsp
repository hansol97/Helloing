<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙소수정페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/accommList.css">

<style>
    
</style>


</head>
<body>
    <jsp:include page="menubar_business.jsp"/>
    
    
    <div class="container-fluid px-lg-5 body">
        <div class="row justify-content-center">
          <br><br><br>
          <div class="accommTitle">숙소 수정 페이지</div>
          
        <!--등록 폼 박스-->
          <div class="fatherEnrollForm">
            <div class="blog-card enrollform" >

			<form action="updateAccomm.bu" method="post" enctype="multipart/form-data" class="innerform">

			<!-- 피드 등록 내용물 -->
			<div style="font-size: 30px; display:inline; text-align: center; margin-left: 8%;"> <br><br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;👉수정하실 🏠숙소 항목을 ✏️변경해 주세요👍 </div>
				<table class="accommFormTable" cellpadding="10" cellspacing="10" style="width: 100%; margin-top: 50px; text-align: left;"  >
					<tr>
						<th width="200px" height="40px"> 숙소 이름 :</th>
						<td width="600px">
							<input id="amName" type="text" name="title" height="100px" size="40" required placeholder="아무튼 입력" value="${requestScope.acc.accommName}"/>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">숙소 주소 :</th>
						<td height="40px">
							<textarea name="amDescription" rows="2" style="resize: none; width: 70%;" required placeholder="아무튼 입력">${requestScope.acc.address}</textarea>
						</td>

					</tr>
					<tr>
						<th style="vertical-align: middle;">숙소 설명 :</th>
						<td height="40px">
							<textarea name="amDescription" rows="10" style="resize: none; width: 70%;" required placeholder="아무튼 입력">${requestScope.acc.accommContent} </textarea>
						</td>
					</tr>
					<tr>
						<th>&nbsp;&nbsp;</th>
						<td>
                            <input type="hidden" name="사업자번호" value="${requestScope.acc.businessNo}">
                            <input type="hidden" name="위도" value="${requestScope.acc.lat}">
                            <input type="hidden" name="경도" value="${requestScope.acc.lng}">
                        </td>
					</tr>
					<tr>
						<th>등급 선택 :</th>
						<td>
							<select name="rating" id="rating" value="${requestScope.acc.grade}" required>
								<option value='1'>1 등급</option>
								<option value='2'>2 등급</option>
								<option value='3'>3 등급</option>
								<option value='4'>4 등급</option>
								<option value='5'>5 등급</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<th>카테고리 :</th>
						<td>
							<select name="category" id="category" value="${requestScope.acc.category}" required> 
								<option value='hotel'>호텔</option>
								<option value='pension'>펜션</option>
								<option value='motel'>모텔</option>
								<option value='house'>민박</option>
								<option value='guestHouse'>게스트하우스</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>체크인 / 체크아웃 시간 : </th>
						<script>
							$(function(){
								var checkInout =  '${requestScope.acc.checkInout}';
								var checkInoutArr = checkInout.split(" / ");
								var checkIn = checkInoutArr[0];
								var checkOut = checkInoutArr[1]; 
								$('#checkIn').val(checkIn);
								$('#checkOut').val(checkOut);
							})
						</script>
						<td>
							<input type="time" name="checkIn" id="checkIn" value="" required/>&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;
							<input type="time" name="checkOut" id="checkOut" value="" required/>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">환불 규정 : </th>
						<td>
							<textarea name="refundDescription" rows="5" style="resize: none; width: 70%;" required placeholder="아무튼 입력">${requestScope.acc.refund}</textarea>
						</td>
					</tr>

				</table>
					<input type="hidden" class="hidden" name="userNo" value="${requestScope.acc.businessNo}"/><!-- 사업자번호 히든 -->
					<div class="titleImg_class1" style="margin-left: 15px;">
						<br><br><p>🎈 숙소의 외관이나 부대시설 사진을 등록해 주세요</p>	<br><br>
						
						<input type="file" name="upfile" id="up1" value="${photoList[0].attachment}" required /><br><br>
						<input type="file" name="upfile" id="up2"/><br><br>
						<input type="file" name="upfile" id="up3"/><br><br><br><br>

						<c:forEach items="${photoList}" var="pL" varStatus="count">
							<input type="hidden" class="hiddenPhoto" name="hiddenPhoto${count.index + 1}" value="${pL.attachment}">
							
							현재 업로드된 파일 ${count.index + 1} : 
							<a href="${pL.attachment}" download="${pL.originName }">${pL.originName }</a>
							<input type="hidden" name="originName" value="${pL.originName }"><br>
							<input type="hidden" name="changeName" value="${pL.changeName }">
						</c:forEach>
					</div>



			<div class="feed_modal_btns" align="center">
				<br>
				<button type="submit" class="button--ujarak button" id="red_btn2"> 수정 완료 </button>
				<button type="button" onclick="location.href='accommList.bu'" class="button--ujarak button">취소하기</button>

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
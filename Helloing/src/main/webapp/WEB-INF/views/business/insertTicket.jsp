<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓등록페이지</title>
<link rel="stylesheet" type="text/css" href="resources/css/accommList.css">
<style>
    
</style>


</head>
<body id="insertActBody">

    <jsp:include page="menubar_business.jsp"/>
    
    
    <div class="container-fluid px-lg-5 body">
        <div class="row justify-content-center">
          <br><br><br>
          <div class="accommTitle">티켓 등록 페이지</div>
          
        <!--등록 폼 박스-->
          <div class="fatherEnrollForm">
            <div class="blog-card enrollform" >
			<form action="insertTicket.bu" method="post" enctype="multipart/form-data" class="innerform">
			<!-- 피드 등록 내용물 -->
			<div style="font-size: 30px; display:inline; text-align: center; margin-left: 8%;"> <br><br>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;👉당신의 🎡티켓을 등록해 😋주세요!❤️ </div>
				<table class="accommFormTable" cellpadding="10" cellspacing="10" style="width: 100%; margin-top: 50px; text-align: left;"  >
					<tr>
						<th width="330px" height="40px"> 액티비티 이름 :</th>
						<td width="500px">
							<h1><span id="accomName"> ${requestScope.activityName} </span></h1>
						</td>
					</tr>
					<tr>
						<th > 티켓 이름 :</th>
						<td>
							<input id="amName" type="text" name="ticketName" height="100px" size="40" required placeholder="아무튼 입력"/>
						</td>
					</tr>
					<tr>
						<th style="vertical-align: middle;"> 이름 작성 예시 :</th>
						<td>
							<img src="resources/img/IHimg/enrollTicket.png" alt="example" style="height: 200px;">
						</td>
					</tr>
                    <tr>
                        <th>티켓 가격 :</th>
                        <td>
                            <input type="number" name="price" id="" placeholder="숫자만 입력해 주세요" required> 원
                        </td>
                    </tr>
					<tr>
						<th>총 티켓 수량 : </th>
						<td>
							<input type="number" name="capacity" id="" placeholder="숫자만 입력해 주세요" required> 장
						</td>
					</tr>
					<tr>
                        <th>운영 시작 / 운영 종료일 : </th>
						<td>
                            <input type="date" name="startDate" id="" required> &nbsp;&nbsp;&nbsp;&nbsp; / &nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="date" name="endDate" id="" required> 
                        </td>
					</tr>
	
                    <!-- 히든 넣는 곳 -->
					<tr>
						<td>
                            <input type="hidden" name="activityNo" id="" value="${requestScope.activityNo}"><!-- 조회하고 나서 리퀘스트에서 빼서 넣자-->
                        </td>
					</tr>

				</table>


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
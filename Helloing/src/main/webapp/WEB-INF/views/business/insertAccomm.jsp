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
          <div class="accommTitle">숙소 등록 페이지</div>
          
        <!--등록 폼 박스-->
          <div class="col-lg-4 col-md-6 d-flex">
            <div class="blog-card enrollform">
              
		<form action="insertAcomm.bu" method="post" enctype="multipart/form-data" >
          <!-- 피드 등록 내용물 -->
          <div class="feed_modal_insert_content">
            <div class="feed_modal_insert_content1">

              
              <input type="hidden" class="hidden" name="userNo" value=""/><!-- 사업자번호 히든 -->

              <table id="feed_insert_table" cellpadding="20" cellspacing="20">
                <tr>
                  <th width="100" height="40px"> 숙소 이름 :</th>
                  <td width="500px">
                    <input id="feed_insert_title" type="text" name="title" height="100px" width="550px" required />
                  </td>
                </tr>
                <tr>
                  <th id="feed_content" style="vertical-align: middle;">숙소 설명 :</th>
                  <td height="40px">
                    <textarea name="feedText" rows="10" style="resize: none; width: 580px" required></textarea>
                  </td>
                  <br /><br />
                </tr>
                <tr>
                  <th id="feed_tag">태그 선택 :</th>
                  <br />
                  <br />
                  <td>
                    <input type="checkbox" name="tag" value="일상" />일상
                    &nbsp;&nbsp;
                    <input type="checkbox" name="tag" value="뷰티" />뷰티
                    &nbsp;&nbsp;
                    <input type="checkbox" name="tag" value="음식" />음식
                    &nbsp;&nbsp;
                    <input type="checkbox" name="tag" value="환경" />환경
                    &nbsp;&nbsp;
                    <input type="checkbox" name="tag" value="꿀팁" />꿀팁
                  </td>
                </tr>
              </table>
			  <div class="titleImg_class1">
                <p>🎈 숙소의 외관이나 부대시설 사진을 등록해 주세요</p>
                <br />
          </div>

          <div class="feed_modal_btns" align="center">
            <br />
            <button type="submit" class="custom-btn btn-15" id="red_btn2"> 등록 </button>
            <button type="reset" class="custom-btn btn-15">초기화</button>
            <button type="reset" class="custom-btn btn-15">취소하기</button>

          </div>
        </form>


















            </div>
          </div>

       

                    
            

        
        

      





    </div>
  </div>




</body>
</html>
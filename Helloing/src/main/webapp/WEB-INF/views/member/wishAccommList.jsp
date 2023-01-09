<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	/* 구조 관련 */
	.out{
		width : 1200px; 
		height : 100%;
		margin : auto;
		position: relative;
	}
	.out .include{
		width : 300px;
		float : left;
	}
    .placeImage {
        width :300px; 
        height :300px;
      	object-fit: cover;
        padding-top: 30px;
        padding-right: 10px; 
        padding-bottom: 1px;
        padding-left: 10px;
    }
   .heart{
	      width: 30px;
	      height: 30px;
	      position:absolute;
	      top:20px;
	      right : 5px;
   }
    .list-area{
	      text-align : center;
	      border : 1px solid white;
   }
    .thumbnail{
	      width: 400px;
	      display:inline-block;
	      margin: 0px;
	   }
   .thumbnail {
 		  transition: all 0.2s linear;
   }
   .thumbnail:hover {
  		 transform: scale(1.05);
   }
   .heart {
     z-index: 10;
   }
   
   #title{
   	padding:20px;
   	font-size:30px;
   	font-weight:600;
   }
    </style>
</head>
<body>
   	<jsp:include page="../common/menubar_user.jsp"/>
	<br><br>

	<div class="out">
		<div class="include">
			<jsp:include page="../member/myPage.jsp"/>
		</div>
		
		<div id="title">
		<h3>찜한 숙소</h3>
	    </div>
	    <div align="center">
	        <div class="list-area">
			    <c:forEach var="a" items="${list}">
	               <div class="thumbnail" align="center" border="1">
	                  <div  class="z_area" style="position:relative;">
	                     <img class="heart"  onclick = "location.href = 'deleteWishAccount.hj'" src="/helloing/resources/img/heart.png" alt=""> 
	                     <img  class="placeImage"  onclick = "location.href = '#'" src="${a.filePath}">
	                  </div>
	                  <p>
	                    	${a.accommName}
	                  </p>
	               </div>
			      </c:forEach>
	      	</div>
	    </div>
	</div>
     <br><br>

   <script>

         $(function() {
	         $('.heart').click(function() {
	               $(this).attr("src", "/helloing/resources/img/deleteheart.png");
	               location.href="wishAccommList.hj";
       		  });
         });

   </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     
    <div align="center">
        <div class="list-area">
               <div class="thumbnail" align="center" border="1">
                  <div  class="z_area" style="position:relative;">
                  
                     <img class="heart"  onclick = "location.href = '#'" src="" alt=""> 
                     <img  class="placeImage"  onclick = "location.href = '#'" src="">
                     <div  class="placeDiv">
                        <button> 🥑보러가기🌿</button>
                     </div> 
                  </div>
                  <p>
                    	신라호텔
                  </p>
               </div>
      </div>
    </div>

     <br><br>

   <script>

         $(function() {
	         $('.heart').click(function() {
	               $(this).attr("src", "");
       		  });
         });

         $('.z_area').hover(function() {
                $(this).find('.placeDiv').css({'display':'block', 'cursor':'pointer'});
            }, function() {
                $(this).find('.placeDiv').css('display', 'none');
            });

   </script>
</body>
</html>
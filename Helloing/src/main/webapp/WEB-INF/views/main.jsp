<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.accomm, .activity {
	display: flex;
	flex-wrap: wrap;
}
.productbox{
    border: 1px solid rgb(154, 154, 154);
    height: 320px;
    width: 240px;
    margin-top: 10px;
    margin-right: 30px;
    margin-bottom: 10px;
}
.productbox p{ padding: 7px; }
.activityName, .accommName { font-size: 20px; font-weight: bold; }
.inner h3{ 
	font-size: 30px;
	font-weight: bold;
	margin-top: 40px;	
	margin-bottom : 10px;
}
.main-img>img{
	width: 100%;
}
</style>

</head>
<body>
	<jsp:include page="common/menubar_user.jsp"/>
	
	<div style="height: 70px;"></div>
	
	
	
	<div class="inner">
		<div class="main-img">
			<img src="/helloing/resources/img/main.jpg">
		</div>
	
		<h3>π₯μ§κΈ κ°μ₯ ν«ν μμπ₯</h3>
		<div class="accomm"> 
	        
        </div>
        
        <h3>π₯μ§κΈ κ°μ₯ ν«ν μ‘ν°λΉν°π₯</h3>
        <div class="activity"> 
        	
        </div>
	</div>
	
	<script>
		$(function(){
			loadAccomm();
			loadActivity();
			
			
			$(document).on('click', '.productbox', function(){
				var num = $(this).children().eq(0).val();
				
				if($(this).parent('.activity').length == 1){
					location.href = 'detail.activity?activityNo=' + num;
				}
				else if($(this).parent('.accomm').length == 1){
					location.href = 'detail.accomm?accommNo=' + num;
				}
			})
		})
		
		// μΈκΈ° μμ λΆλ¬μ€κΈ°
		function loadAccomm(){
			$.ajax({
				url : "hot.accomm",
				success : function(result){
					let text = '';
					
					for (let i in result) {
						text += '<div class="productbox">'
						      + '<input type="hidden" name="accommNo" value="' + result[i].accommNo + '">'
						      + '<img src="' + result[i].filePath + '" width="240" height="200">'
						      + '<p>' + result[i].category + '<br>'
						      + '<span class="accommName">' + result[i].accommName + '</span><br>'
						      + 'β­' + result[i].avg + '(' + result[i].reviewCount + ')<br>'
						      + result[i].rowPrice + 'μ ~</p>'
					          + '</div>';
					}
					
					$('.accomm').html(text);
				},
				error : function(){
					console.log('ν΅μ  μ€ν¨');
				}
			})
		}
		
		// μΈκΈ° μ‘ν°λΉν° λΆλ¬μ€κΈ°
		function loadActivity(){
			$.ajax({
				url : "hot.activity",
				success : function(result){
					let text = '';
					
					for (let i in result) {
						text += '<div class="productbox">'
						      + '<input type="hidden" name="activityNo" value="' + result[i].activityNo + '">'
						      + '<img src="' + result[i].filePath + '" width="240" height="200">'
						      + '<p><span class="activityName">' + result[i].activityName + '</span><br>'
						      + 'β­β­β­β­β­ ' + result[i].reviewCount + '<br>'
						      + result[i].rowPrice + 'μ ~</p>'
						      + '</div>';
					}
					
					$('.activity').html(text);
				},
				error : function(){
					console.log('ν΅μ  μ€ν¨');
				}
			})
		}
		
	
	</script>
</body>
</html>
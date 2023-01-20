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
	
		<h3>🔥지금 가장 핫한 숙소🔥</h3>
		<div class="accomm"> 
	        
        </div>
        
        <h3>🔥지금 가장 핫한 액티비티🔥</h3>
        <div class="activity"> 
        	
        </div>
	</div>
	
	<script>
		$(function(){
			loadAccomm();
			loadActivity();
			accommNameSplit();
			activityNameSplit();
		})
		
		// 인기 숙소 불러오기
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
						      + '⭐' + result[i].avg + '(' + result[i].reviewCount + ')<br>'
						      + result[i].rowPrice + '원 ~</p>'
					          + '</div>';
					}
					
					$('.accomm').html(text);
				},
				error : function(){
					console.log('통신 실패');
				}
			})
		}
		
		// 인기 액티비티 불러오기
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
						      + '⭐⭐⭐⭐⭐ ' + result[i].reviewCount + '<br>'
						      + result[i].rowPrice + '원 ~</p>'
						      + '</div>';
					}
					
					$('.activity').html(text);
				},
				error : function(){
					console.log('통신 실패');
				}
			})
		}
		
		// 숙소 이름이 14글자 이상이면 뒤에 .. 붙이기
		function accommNameSplit(){
			$('.productbox').each(function(){
				if($(this).find('.accommName').text().length >= 14){
					var newName = $(this).find('.accommName').text().substr(0, 14) + "...";

					$(this).find('.accommName').text(newName);
				}
			})
		}
		
		// 숙소 이름이 23글자 이상이면 뒤에 .. 붙이기
		function activityNameSplit(){
			$('.productbox').each(function(){
				if($(this).find('.activityName').text().length >= 23){
					var newName = $(this).find('.activityName').text().substr(0, 23) + "...";

					$(this).find('.activityName').text(newName);
				}
			})
		}
	
	</script>
</body>
</html>
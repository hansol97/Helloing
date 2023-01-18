<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>

<style>
	.inner h1{ font-size: 30px;	font-weight: bold; }
	#map { height: 600px;	}
</style>

</head>
<body>
	<jsp:include page="../common/menubar_user.jsp"/> <!-- 헤더를 넣으니까 검색창이 헤더 밑으로 간다... relative, absolute 속성 때문일까? -->
	
	<div style="height: 70px;"></div>  
	
	<div class="inner">  
		<h1>'${ keyword }' 검색 결과 지도보기 🗺️</h1>
		
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=845d6f2d0a76ec3940c1f29877d83414"></script>
		
		<div id="map">
		
		</div>
	</div>
	
	<script>
	
		var arr = new Array(); // 자바 스크립트 배열에 컨트롤러로부터 받아온 ArrayList 집어넣기
		<c:forEach items="${ accommList }" var="a">
			arr.push({
				name : "${ a.accommName }",
				lng : "${ a.lng }",
				lat : "${ a.lat }"
			});
		</c:forEach> 
		
		console.log(arr);

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = { 
				center: new kakao.maps.LatLng(35.1595454, 126.8526012), // 지도의 중심좌표 : 광주 광역시로 설정
				level: 10 // 지도의 확대 레벨
			};
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	

		// 마커가 표시될 위치입니다 
		for(var i = 0; i < arr.length; i++){
			var marker = new kakao.maps.Marker({
				position : new kakao.maps.LatLng(arr[i].lng, arr[i].lat)
			})
			marker.setMap(map);
		}

		/*
		var markerPosition  = new kakao.maps.LatLng(${ ac.lng }, ${ ac.lat }); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position: markerPosition
		});
		
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
		*/
	</script>

</body>
</html>
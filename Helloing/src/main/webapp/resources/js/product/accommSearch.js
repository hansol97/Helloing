$(function(){

	// 상품 div 클릭 시 상세보기 페이지로 이동
	$(document).on('click', '.productbox, .accommCookie', function(){
		var $accommNo = $(this).children().eq(0).val();
		console.log($accommNo);
		location.href = "detail.accomm?accommNo=" + $accommNo; // 나중에 겟방식 url로 바꾸기
	})
})

// 검색버튼 클릭 시 검색창이 비어있지 않을 때만 검색버튼 -> 서브밋
function search(){
	if($('input[name=accommName]').val() != ''){
		$('#btn-search').attr('type', 'submit');
	}
	else{
		alert('검색어를 입력해주세요.');
	}
}

// 지도 보기 클릭 시 목록들 지도에 띄워주기
function showMap(){
	
	var keyword = $('#keyword').text();

	if(keyword == ''){ // 검색된 숙소가 없다면 지도 안띄워줄거다.
		alert('검색된 숙소가 없으므로 지도를 보옂ㄹ 수 없습니다.');
		return false;
	}
	
	location.href= "accomm.map?accommName=" + keyword;
}
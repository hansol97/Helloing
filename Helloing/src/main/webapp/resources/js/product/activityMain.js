$(function(){
	// 상품 div 클릭 시 상세보기 페이지로 이동
	$(document).on('click', '.productbox', function(){
		var $activityNo = $(this).children().eq(0).val();
		console.log($activityNo);
        location.href = "detail.activity?activityNo=" + $activityNo; // 나중에 겟방식 url로 바꾸기
	})
})
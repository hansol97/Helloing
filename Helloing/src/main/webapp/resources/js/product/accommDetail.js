$(function(){
	// 예약 버튼 클릭 시 결제 페이지로 이동
	$(document).on('click', '.accommbox', function(){
		var $roomNo = $(this).children().eq(0).val();
		//console.log($roomNo);
        location.href = "reserve.accomm"; // 나중에 겟방식 url로 바꾸기
	})
})
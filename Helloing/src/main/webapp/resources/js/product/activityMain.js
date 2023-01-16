$(function(){

	nameSplit();

	// 상품 div 클릭 시 상세보기 페이지로 이동
	$(document).on('click', '.productbox', function(){
		var $activityNo = $(this).children().eq(0).val();
		console.log($activityNo);
        location.href = "detail.activity?activityNo=" + $activityNo; // 나중에 겟방식 url로 바꾸기
	})
})

// 숙소 이름이 23글자 이상이면 뒤에 .. 붙이기
function nameSplit(){
	$('.productbox').each(function(){
		if($(this).find('.activityName').text().length >= 23){
			var newName = $(this).find('.activityName').text().substr(0, 23) + "...";

			$(this).find('.activityName').text(newName);
		}
	})
}
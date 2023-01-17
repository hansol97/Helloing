$(function(){

	nameSplit();

	// 상품 div 클릭 시 상세보기 페이지로 이동
	$(document).on('click', '.productbox, .accommCookie', function(){
		var $accommNo = $(this).children().eq(0).val();
		console.log($accommNo);
		location.href = "detail.accomm?accommNo=" + $accommNo; // 나중에 겟방식 url로 바꾸기
	})
})

// 숙소 이름이 14글자 이상이면 뒤에 .. 붙이기
function nameSplit(){
	$('.productbox').each(function(){
		if($(this).find('.accommName').text().length >= 14){
			var newName = $(this).find('.accommName').text().substr(0, 14) + "...";

			$(this).find('.accommName').text(newName);
		}
	})
}

// 검색버튼 클릭 시 검색창이 비어있지 않을 때만 검색버튼 -> 서브밋
function search(){
	if($('input[name=accommName]').val() != ''){
		$('#btn-search').attr('type', 'submit');
	}
}
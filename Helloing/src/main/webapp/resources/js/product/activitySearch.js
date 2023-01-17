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
	if($('input[name=keyword]').val() != ''){
		$('#btn-search').attr('type', 'submit');
	}
}
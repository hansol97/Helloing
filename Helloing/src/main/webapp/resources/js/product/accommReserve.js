// 예약자 정보 변경 버튼 클릭 시 모달창 띄우기
function openModal(){
	$('.modal').addClass('show');
}

function closeModal(){
	// 수정 버튼 누르면 모달창 없어지기
	$('.modal').removeClass('show');

	// 예약자 수정 함수
	updateInfo();
}

// 예약자 수정
function updateInfo(){
	$('#bookName').text($('input[name=newName]').val());
	$('#bookEmail').text($('input[name=newEmail]').val());
	$('#bookPhone').text($('input[name=newPhone]').val());
}

// 체크박스 눌러야만 결제하기 이동
function check(){
	if($('input[type=checkbox]').length == $('input[type=checkbox]:checked').length){
		location.href="pay.accomm";
	}
	else{
		$('#check').text('모든 약관에 동의 하셔야합니다.')
		$('#check').css('color', 'red');
	}
}
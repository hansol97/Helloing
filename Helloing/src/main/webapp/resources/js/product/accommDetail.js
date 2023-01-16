$(function(){

	checkWish(); // 위시리스트에 추가되어있는지 확인하는 함수
	sysdate(); // 오늘 날짜 이후로만 체크인/체크아웃 가능

	// 예약 버튼 클릭 시 예약하기 페이지로 이동
	$(document).on('click', '.btn-reserve', function(){
		var checkIn = $('#startDate').val();
		var checkOut = $('#endDate').val();

		if(checkDate(checkIn, checkOut)){// 날짜 체크 제대로 됐는지 확인

			var info = $(this).closest('.accommbox');

			var text = '';
			text += '<input type="hidden" name="startDate" value="' + checkIn + '">'
				  + '<input type="hidden" name="endDate" value="' + checkOut + '">'
				  + '<input type="hidden" name="headCount" value="' + $('select[name=headCount] option:selected').val().replace("명","") + '">'
				  + '<input type="hidden" name="accommNo" value="' + $('input[name=accommNo]').val() + '">'
				  + '<input type="hidden" name="accName" value="' + $('[name=accName]').text() + '">'
				  + '<input type="hidden" name="checkIn" value="' + $('#checkIn').text() + '">'
				  + '<input type="hidden" name="checkOut" value="' + $('#checkOut').text() + '">'
				  + '<input type="hidden" name="day" value="' + calDate(checkIn, checkOut) + '">'
				  + '<input type="hidden" name="attachment" value="' + $('#attachment').attr('src') + '">';
			$('#info').html(text);
		}
		else{
			return false;
		}
	})
})

// 위시리스트에 추가
function addWish(){
	$.ajax({
		url : "addAcWish",
		data : { accommNo : $('input[name=accommNo]').val() },
		success : function(result){
			console.log(result);
			if(result == 'success'){
				alert('추가되었습니다😘');
				$('#btn-add').css('display', 'none');
				$('#btn-rev').css('display', 'block');
			}
			else if(result == 'login please'){
				alert("로그인이 필요한 서비스 입니다.");
			}
			else { alert("알 수 없는 이유로 실패..");}
		},
		error : function(){
			console.log("실패");
		}
	})
}

// 위시리스트에서 삭제
function removeWish(){
	$.ajax({
		url : "removeAcWish",
		data : { accommNo : $('input[name=accommNo]').val() },
		success : function(result){
			if(result == 'success'){
				alert('삭제되었습니다🤨');
				$('#btn-rev').css('display', 'none');
				$('#btn-add').css('display', 'block');
			}
			else if(result == 'fail'){
				alert('삭제 실패 ㅋㅋ');
			}
			else { alert('알 수 없는 이유로 실패..');}
		},
		error : function(){
			console.log('실패');
		}
	})
}

// 위시리스트에 추가되어있는지 확인
function checkWish(){
	if($('input[name=checkWish]').val() == 'none'){ // 추가 안한 상태
		$('#btn-add').css('display', 'block');
		$('#btn-rev').css('display', 'none');
	}
	else { // 추가한 상태
		$('#btn-add').css('display', 'none');
		$('#btn-rev').css('display', 'block');
	}
}


// 객실 선택하기 버튼 클릭 시 객실 선택하는 곳으로 스크롤 이동
function selectRoom(){
	var height = $('.selectoption').offset();
	// offset : document 안에서 위치값 반환 // 절대 좌표를 반환한다.
	
	height.top = (height.top - 200);
	// 헤더를 float 해놔서 좌표가 제대로 안먹음 => 객체에 접근해서 해당 값 직접 수정
	
	$('html, body').animate({scrollTop : height.top}, 400);
}

// 별점 클릭 시 후기 목록으로 스크롤 이동
function selectReview(){
	var height = $('.reviewtitle').offset();

	height.top = (height.top - 200);

	$('html, body').animate({scrollTop : height.top}, 400);
}

// 체크인 날짜에 오늘 날짜 이후 날짜로 뿌려주기
function sysdate(){

	var now = new Date();
	var year = now.getFullYear();
	var month = now.getMonth() + 1;
	var date = now.getDate();

	if(month < 10) month = '0' + month;
	if(date < 10) date = '0' + date;

	var sysdate = year + '-' + month + '-' + date;

	$('#startDate').attr('min', sysdate);
	$('#endDate').attr('min', sysdate);
}

// 체크인/아웃 날짜 확인하기
function checkDate(checkIn, checkOut){
	if(checkIn == ''){
		alert('체크인 날짜를 지정해주세요.');
		return false;
	}
	if(checkOut == ''){
		alert('체크아웃 날짜를 지정해주세요.');
		return false;
	}
	if(checkIn >= checkOut){
		alert('체크인/체크아웃 날짜를 다시 확인해주세요.');
		return false;
	}
	return true;
}

// 숙박일 계산하는 함수
function calDate(checkIn, checkOut){
	var startDate = new Date(checkIn);
	var endDate = new Date(checkOut);

	var diffMSce = endDate.getTime() - startDate.getTime();
	var stayDay = diffMSce / (24 * 60 * 60 * 1000);

	return stayDay;
}


$(function(){

	checkWish(); // 위시리스트에 추가되어있는지 확인하는 함수

	// 예약 버튼 클릭 시 예약하기 페이지로 이동
	$(document).on('click', '.btn-reserve', function(){
		var checkIn = $('input[name=startDate]').val();
		var checkOut = $('input[name=endDate').val();

		// 체크인/아웃 날짜 확인하기
		if(checkIn == ''){
			alert('체크인 날짜를 지정해주세요.');
			return false;
		}
		if(checkOut == ''){
			alert('체크아웃 날짜를 지정해주세요.');
			return false;
		}
		if(checkIn > checkOut){
			alert('체크인/체크아웃 날짜를 다시 확인해주세요.');
			return false;
		}



		var info = $(this).closest('.accommbox');

		
		$.ajax({
			type : 'POST',
			url : 'reserve.accomm',
			data : {
				  "startDate" : checkIn,
				  "endDate" : checkOut,
				  "headCount" : $('select[name=headCount] option:selected').val().replace("명",""),
				  "accommNo" : $('input[name=accommNo]').val(),
				  "accName" : $('[name=accName]').text(),
				  "price" : info.find('input[name=price]').val(),
				  "roomNo" : info.find('input[name=roomNo]').val(),
				  "roomName" : info.find('[name=roomName]').text()
			},
			success : function(result){
				if(result == ''){

				}
				else if(result == 'login please'){
					alert('로그인이 필요한 서비스 입니다.');
				}
			},
			error : function(){
				console.log('알 수 없는 이유로 실패...');
			}
		});

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


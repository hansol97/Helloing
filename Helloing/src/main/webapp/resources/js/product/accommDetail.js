$(function(){

	checkWish(); // 위시리스트에 추가되어있는지 확인하는 함수

	// 예약 버튼 클릭 시 결제 페이지로 이동
	$(document).on('click', '.accommbox', function(){
		var $roomNo = $(this).children().eq(0).val();
		//console.log($roomNo);
        location.href = "reserve.accomm"; // 나중에 겟방식 url로 바꾸기
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
$(function(){

	checkWish();

	// +, - 버튼 클릭 시 티켓 수 바뀌기
	$(document).on('click', '.btn-minus, .btn-plus', function(){
		var ticketcount = Number($(this).siblings('.count').text());
		// Number로 형변환을 해야 +연산을 했을 때 숫자로 인식됨.
		// (안하면 문자에 더하기 되서 1111 이 되는 참사가 일어난다.)

		if($(this).text() == '-'){
			if(ticketcount > 0) $(this).siblings('.count').text(ticketcount - 1);
		}
		else{
			$(this).siblings('.count').text(ticketcount + 1);
		}

		// 결제 정보에 티켓 수량이 0 이상인 티켓 정보들 추가하기
		var text = '';
		$('.ticketbox').each(function(idx){
			if($(this).find('.count').text() > 0){
				var ticketName = $(this).find('.ticketName').text();
				var ticketPrice = $(this).find('.ticket-price').children().eq(0).text().replace("원", "").replace(",", "");
				var count = $(this).find('.count').text();
				var ticketNo = $(this).find('input[name=ticketNo]').val();
				var endDate = $(this).find('#endDate').text();
				var activityName = $('.activityName').text();
				var ticketSum = ticketPrice * count;
				var allSum = $('.point').text().replace("원", "");

				console.log(endDate);

				text += '<div><span class="ticketName">' + ticketName + '</span>'
					  + '<span>' + count + ' X ' + ticketPrice + '원<span class="text-bold">' + (count * ticketPrice) + '원</span></span></div>'
					  + '<input type="hidden" name="ticketPayment[' + idx + '].ticketNo" value="' + ticketNo + '">'
					  + '<input type="hidden" name="ticketPayment[' + idx + '].count" value="' + count + '">'
					  + '<input type="hidden" name="ticketPayment[' + idx + '].ticketName" value="' + ticketName + '">'
					  + '<input type="hidden" name="ticketPayment[' + idx + '].ticketSum" value="' + ticketSum + '">'
					  + '<input type="hidden" name="ticketPayment[' + idx + '].allSum" value="' + allSum + '">'
					  + '<input type="hidden" name="ticketPayment[' + idx + '].ticketPrice" value="' + ticketPrice + '">';

					  //$('.order-info').append(abc(idx).attr('name', 'ticketPay' + idx).val(ticketName));
					}
				})
				
			$('.order-info').html(text);


		// 모든 티켓 가격 합계
		var allPrice = 0;
		$('.text-bold').each(function(){
			var price = Number($(this).text().replace("원", ""));
			allPrice += price;
		})
		var textPrice = '<p>총 티켓 금액<span class="point">' + allPrice + '원</span></p>';
		$('input[name=allSum]').val(allPrice);
		$('.all-price').html(textPrice);

		// 결제버튼 보이기
		$('#btn-pay').attr('style', 'display: block;');
		
		function abc(idx){
			return $('<input>').attr('type','hidden');
		}
	})
})

// 티켓 선택하기 버튼 클릭 시 티켓 선택하는 곳으로 스크롤 이동
function selectTicket(){
	var height = $('.ticketlist').offset();
	// offset : document 안에서 위치값 반환 // 절대 좌표를 반환한다.
	
	height.top = 850;
	// 헤더를 float 해놔서 좌표가 제대로 안먹음 => 객체에 접근해서 해당 값 직접 수정
	
	$('html, body').animate({scrollTop : height.top}, 400);
}

// 별점 클릭 시 후기 목록으로 스크롤 이동
function selectReview(){
	var height = $('.reviewtitle').offset();

	height.top = 1500;
	$('html, body').animate({scrollTop : height.top}, 400);
}

// 위시리스트에 추가
function addWish(){
	$.ajax({
		url : "addActWish",
		data : { activityNo : $('input[name=activityNo]').val() },
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
		url : "removeActWish",
		data : { activityNo : $('input[name=activityNo]').val() },
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
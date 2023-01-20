<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='en'>
<head>
<style>
    .business-content {
    background-color:#f9fbff;
    width:1500px;
    margin:auto;
    }
    .business-innerOuter {
    font-family: 'S-CoreDream-3Light';
    width:1450px;
    height:660px;
    
    margin:auto;
    padding:50px 100px;
    
    background-color:rgb(255, 255, 255);
    word-break:break-all;
    }
    
    button[title="month view"]
    , button[title="week view"]
    , button[title="day view"]{
        display: none !important;
    }

    #calendar-area{
        width:600px;
        height:600px;
        /* float:right; */

        position:absolute;
        top:250px;
    }

    #book-info-area{
        width:690px;
        /* float:left; */

        position:absolute;
        top:290px;
        right:220px;
    }

    #book-info-area > div{
        border:1px solid lightgrey;
        border-radius:5px;
        width:600px;
        margin-left:20px;
    }

    #book-info-area p{
        margin-left:10px;
        margin-right:10px;
        padding:10px;
        margin:10px
    }

    #book-info-area>div>span:first-child{
        width:400px;
    }

    #book-info-date{
        margin-left:0px;
        font-size:20px;
        font-weight:bold;
        padding-left:0px;
    }
    
    
	
</style>

<meta charset='utf-8' />
<title>객실별 예약자 조회</title>
<link rel="stylesheet" type="text/css" href="resources/css/accommList.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.0.2/index.global.min.js'></script>
<script>

document.addEventListener('DOMContentLoaded', function() {
	
	function selectBookInfo(date){
		 $.ajax({
			url:'selectBookInfo.bu'
			,data : {
				chooseDate : date
				,roomNo : $('#roomNo_input').val()
			}
			,success : function(bookInfo){
				if(bookInfo != null){
					
					$('#book-info-area').show();
					$('#book-info1>p.info_1').text(bookInfo.category);
					$('#book-info1>p.info_2').text(bookInfo.accName+ '/' + bookInfo.roomName);
		
					$('#book-info2>p.info_1').text('예약자명 : ' + bookInfo.memName);
					$('#book-info2>p.info_2').text('인원 수 : ' + bookInfo.headCount + '명');
					
					$('#book-info3>p.info_1').text('이용기간 : ' + bookInfo.startDate + ' ~ ' + bookInfo.endDate);
					$('#book-info3>p.info_2').text('총 지불금액 : ' + bookInfo.price + '원');
				}
				else{
					$('#book-info-area').hide();
				}
				
			}
			,error : function(){
				console.log('실패');
			}
		});
	}
	
    var calendarEl = document.getElementById('calendar'); // div요소 선택

    var calendar = new FullCalendar.Calendar(calendarEl, {
        selectable: true, // 달력 클릭하게 해주는 속성
        headerToolbar: {
        left: 'prev,next today', // 왼쪽 상단 툴바
        center: 'title', // X월 XXXX년 위치
        right: 'dayGridMonth,timeGridWeek,timeGridDay' // 오른쪽 상단 툴바
        },
        dateClick: function(info) {// 날짜만 클릭 했을 때 핸들러
        	//$('div.book-info-area').
        	$('#book-info-date').text(info.dateStr);
        	selectBookInfo(info.dateStr);
        	
        },
       
    });
    
    

    calendar.render(); // 달력 화면에 뿌려주는 렌더링함수
    });
    
    $(function(){
    	
    	$('button[title="This month"]').hide();
    	$('#book-info-area').hide();
    	
    	checkBookDate();
    	
    	function checkBookDate(){
    		
	    	$.ajax({
	    		url: 'bookedDate.bu'
				,data: {
					roomNo : $('#roomNo_input').val()
				}
	    		,success : function(dList){
					for(var i = 0; i < dList.length; i++){
						
						var startDate = new Date(dList[i].startDate); // 시작날짜 Date로 형변환
						var endDate = new Date(dList[i].endDate); // 끝날짜 Date로 형변환
						
						var night = (endDate-startDate)/(1 * 24 * 60 * 60 * 1000); // 숙소에서 자는 날 수
						
						var sDate = dList[i].startDate;
						
						for(var j = 0; j < night; j++){ // 자는 날 수 만큼 반복
							
							var firstDate = sDate; 
							var bookMonth = dList[i].startDate.substr(5, 2); // 예약한 날짜의 달
							
							var firstDay = Number(firstDate.substr(8, 2)); // 시작날짜 yyyy-mm-dd에서 dd만 추출
							
							var nextDay = firstDay + j; 
							if(nextDay < 10){
								nextDay = '0' + nextDay;
							}
							
							var $month = $('table.fc-scrollgrid-sync-table > tbody').children('tr').eq(2).children('td').eq(0).data('date').substr(5,2);
							var bookDay = firstDate.substr(0,8) + nextDay;
							//console.log($('td[data-date="'+ firstDate.substr(0,8) + '31' + '"]'));
							if((nextDay == '28' && $('td[data-date="'+ firstDate.substr(0,8) + '29' + '"]').length == 0)
							   || (nextDay == '29' && $('td[data-date="'+ firstDate.substr(0,8) + '30' + '"]').length == 0)
							   || (nextDay == '30' && $('td[data-date="'+ firstDate.substr(0,8) + '31' + '"]').length == 0)
							   || (nextDay == '31')){
								 var nextMonth = (Num(firstDate.substr(5,2)) + 1);
								 if(nextMonth < 10){
									 nextMonth = '0' + nextMonth;
									 bookDay = firstDate.substr(0,5) + nextMonth + '-01';
								 }else{
									 bookDay = firstDate.substr(0,5) + nextMonth + '-01';
								 }
							}
							
							if(bookMonth != $month){
								$('td[data-date="'+ bookDay +'"]').children().eq(0).css({'background-color' : 'lightgrey','opacity' : '0.5'});
							}
							else{
								$('td[data-date="'+ bookDay +'"]').children().eq(0).css({'background-color' : 'lightgrey','opacity' : '1'});
							}
							
						} 
					}
	    		}
	    		,error : function(){
	    			console.log('실패')
	    		}
	    	});
    	}
    	
    	 $('button[title="Previous month"], button[title="Next month"]').click(function(){
    	    	checkBookDate();
    	 });
     
    	 
    	 
    });
    
    
   
    //button[title="Next month"]

</script>


</head>
<body>
	<input id="roomNo_input" type="hidden" value="${roomNo}">
    <div class="header"></div>
    <jsp:include page="menubar_business.jsp"/>
    <div class="business-content">
        <br><br>
        <div class="business-innerOuter">
            <div id="calendar-area">
                <div id='calendar'></div>
            </div>
            <div id="book-info-area">
                <p id="book-info-date">2022-08-03</p>
                <div id="book-info1">
                    <p class="info_1">숙소/호텔</p>
                    <p class="info_2">서울신라호텔/디럭스 패키지(더블)</p>
                </div>
                <div id="book-info2">
                    <p class="info_1">예약자명 : 유저2</p>
                    <p class="info_2">인원 수 : 3명</p>
                </div>
                <div id="book-info3">
                    <p class="info_1">이용기간 : 2022.08.02 ~ 2022.08.04</p>
                    <p class="info_2">총 지불금액 : 155,000원</p>
                </div>
            </div>
        </div>
    </div>
   
  </body>
</html>
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
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.0.2/index.global.min.js'></script>
<script>

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar'); // div요소 선택

    var calendar = new FullCalendar.Calendar(calendarEl, {
        selectable: true, // 달력 클릭하게 해주는 속성
        headerToolbar: {
        left: 'prev,next today', // 왼쪽 상단 툴바
        center: 'title', // X월 XXXX년 위치
        right: 'dayGridMonth,timeGridWeek,timeGridDay' // 오른쪽 상단 툴바
        },
        dateClick: function(info) {// 날짜만 클릭 했을 때 핸들러
        alert('clicked ' + info.dateStr); 
        },
        // select: function(info) { // dateClick + 범위를 선택해서 클릭 했을 때 핸들러
        // alert('selected ' + info.startStr + ' to ' + info.endStr);
        // },
        events: [ // 화면에 띄워줄 이벤트 객체 배열
            // {
            // title: '종강',
            // start: '2023-01-25'
            // },
            // {
            // title: '수업시작',
            // start: '2023-01-06T09:00:00',
            // },
            // {
            // title: '수업끝',
            // start: '2023-01-06T17:50:00',
            // },
            // {
            // title: '기능구현하기',
            // start: '2023-01-09',
            // end: '2023-01-14'
            // },
            // {
            // title: '점심시간',
            // start: '2023-01-16T12:50:00'
            // },
            // {
            // title: '휴강',
            // start: '2023-01-18'
            // },
            // {
            // title: 'URL요청??',
            // url: 'http://google.com/', // a태그 달기
            // start: '2023-01-20'
            // }
        ]
    });

    calendar.render(); // 달력 화면에 뿌려주는 렌더링함수
    });

</script>


</head>
<body>
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
                    <p>숙소/호텔</p>
                    <p>서울신라호텔/디럭스 패키지(더블)</p>
                </div>
                <div id="book-info2">
                    <p>예약자명 : 유저2</p>
                    <p>인원 수 : 3명</p>
                </div>
                <div id="book-info3">
                    <p>이용기간 : 2022.08.02 ~ 2022.08.04</p>
                    <p>총 지불금액 : 155,000원</p>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>
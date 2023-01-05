<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액티비티 결제</title>
<style>
    .content {
        background-color:rgb(247, 245, 245);
        width:1500px;
        margin:auto;
    }
    .innerOuter {
        border:1px solid lightgray;
        width:1200px;
        margin:auto;
        padding:50px 100px;
        background-color:white;
        word-break:break-all;
    }

    /* 리스트 스타일 */
    #boardList {
        text-align:center;
    }
    #boardList>tbody>tr:hover {cursor:pointer;}

    #pagingArea {width:fit-content; margin:auto;}
    
    #searchForm {
        width:60%;
        margin:auto;
    }
    #searchForm>* {
        float:left;
        margin:5px;
    }

    /* 페이지 설정 */
    #adminRoomName{
        color:rgb(95, 95, 95);
        font-size:13px;
    }
    
</style>
</head>
<body>

    <!-- <jsp:include page="../common/header.jsp" /> -->

    <div class="content">

        <div class="innerOuter">

            <table>
                <form id="searchForm" action="" method="get">
                    <tr>
                        <td>
                            <div class="text">
                                <input type="text" class="form-control" name="keyword">
                            </div>        
                        </td>
                        <td>
                            &nbsp;<button type="submit" class="searchBtn btn btn-secondary">검색</button>
                        </td>
                    </tr>
                </form>
            </table>
            
            <br><br>
            
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th width="100">예약번호</th>
                        <th width="120">회원아이디</th>
                        <th width="230">
                            숙소명/객실명
                        </th>
                        <th width="80">인원수</th>
                        <th width="120">가격</th>
                        <th width="200">예약기간</th>
                        <th width="110">결제일자</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>user02</td>
                        <td>
                               신라호텔 <br>
                            
                                <span id="adminRoomName">- 스위트룸</span>
                            
                        </td>
                        <td>3</td>
                        <td>44,500원</td>
                        <td>2023.01.06 ~ 2023.01.08</td>
                        <td>2023.01.01</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>user02</td>
                        <td>
                            신라호텔 <br>
                            스위트룸
                        </td>
                        <td>3</td>
                        <td>44,500원</td>
                        <td>2023.01.06 ~ 2023.01.08</td>
                        <td>2023.01.01</td>
                    </tr>
                </tbody>
            </table>
            <br><br>
            

            <div id="pagingArea">
                <button>&gt;</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>&lt;</button>
            </div>
            <br><br>

            <a href="boardList.ad">게시물 조회</a> <br>
            <a href="businessList.ad">사업자 조회</a> <br>
            <a href="memList.ad">회원 조회</a> <br>
            <a href="replyList.ad">댓글 조회</a> <br> 
            <a href="businessPayList.ad">사업자 등록 결제 조회</a> <br>
            <a href="chatBotList.ad">챗봇 키워드 조회</a> <br>
            <a href="reportList.ad">신고게시글 목록</a> <br> 
            <a href="roomPay.ad">숙소결제 조회</a> <br>
        </div>

    </div>
    
</body>
</html>
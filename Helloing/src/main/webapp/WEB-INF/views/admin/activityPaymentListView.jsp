<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .content {
        background-color:rgb(247, 245, 245);
        width:80%;
        margin:auto;
    }
    .innerOuter {
        border:1px solid lightgray;
        width:80%;
        margin:auto;
        padding:5% 10%;
        background-color:white;
    }

    /* 리스트 스타일 */
    #boardList {text-align:center;}
    #boardList>tbody>tr:hover {cursor:pointer;}

    #pagingArea {width:fit-content; margin:auto;}
    
    #searchForm {
        width:80%;
        margin:auto;
    }
    #searchForm>* {
        float:left;
        margin:5px;
    }
    .select {width:20%;}
    .text {width:53%;}
    .searchBtn {width:20%;}
</style>
</head>
<body>

    <div class="content">

        <div class="innerOuter">
            <form action="actPaySearch.ad">
                <input type="text" placeholder="회원아이디 입력">
                <button>검색</button>
            </form>
            <table id="boardList" align="center">
                <thead>
                    <tr>
                        <th>예약번호</th>
                        <th>회원아이디</th>
                        <th>숙소명</th>
                        <th>객실명</th>
                        <th>인원수</th>
                        <th>가격</th>
                        <th>예약기간</th>
                        <th>결제일자</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>user02</td>
                        <td>신라호텔</td>
                        <td>스위트룸</td>
                        <td>3</td>
                        <td>44,500원</td>
                        <td>2023.01.06 ~ 2023.01.08</td>
                        <td>2023.01.01</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>user02</td>
                        <td>신라호텔</td>
                        <td>스위트룸</td>
                        <td>3</td>
                        <td>44,500원</td>
                        <td>2023.01.06 ~ 2023.01.08</td>
                        <td>2023.01.01</td>
                    </tr>
                </tbody>
            </table>

            <div id="pagingArea">
                <button>&gt;</button>
                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>&lt;</button>
            </div>

        </div>

    </div>
    
</body>
</html>
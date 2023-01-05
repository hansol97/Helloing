<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록 조회</title>
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
    #boardList {text-align:center;}
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

    

    /* 페이지 스타일 */
    
    
</style>
</head>
<body>

    <div class="content">

        <div class="innerOuter">

            <table>
                <form id="searchForm" action="" method="get">
                    <tr>
                        <td>
                            <select class="form-control" name="" id="">
                                <option value="">작성자아이디</option>
                                <option value="">제목</option>
                            </select>
                        </td>
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
                        <th width="30">
                            <input type="checkbox" name="cboxAll" id="cboxAll" onclick="checkAll();">
                        </th>
                        <th width="80">글번호</th>
                        <th width="120">작성자아이디</th>
                        <th width="230">제목</th>
                        <th width="80">작성일</th>
                        <th width="80">추천수</th>
                        <th width="80">조회수</th>
                        <th width="60">상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td onclick="event.stopPropagation()">
                            <input name="cbox" type="checkbox" value="">
                        </td>
                        <td>2</td>
                        <td>user02</td>
                        <td>
                            제주도 여행
                            💾
                        </td>
                        <td>2023.01.01</td>
                        <td>2</td>
                        <td>5</td>
                        <td>N</td>
                    </tr>
                    <tr>
                        <td onclick="event.stopPropagation()">
                            <input name="cbox" type="checkbox" value="">
                        </td>
                        <td>2</td>
                        <td>user02</td>
                        <td>제주도 여행</td>
                        <td>2023.01.01</td>
                        <td>2</td>
                        <td>5</td>
                        <td>N</td>
                    </tr>
                </tbody>
            </table>
            <br><br>
            

            <div id="pagingArea">
                <a>&gt;</a>
                <a>1</a>
                <a>2</a>
                <a>3</a>
                <a>&lt;</a>
            </div>
            <br><br>

            
        </div>

    </div>

</body>
</html>
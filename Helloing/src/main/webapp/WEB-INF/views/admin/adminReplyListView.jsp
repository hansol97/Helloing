<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 댓글 관리</title>
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
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

    <div class="content">

        <div class="innerOuter">

            <table>
                <tr>
                    <form id="searchForm" action="" method="get">
                        <td>
                            <select class="form-control" name="" id="">
                                <option value="">아이디</option>
                                <option value="">이름</option>
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
                    </form>
                    <td width="420">

                    </td>
                    <td><button id="reportMemSelect" class="searchBtn btn btn-secondary">정지 회원 조회</button></td>
                    <td>&nbsp;&nbsp;<button class="searchBtn btn btn-secondary">정지</button></td>
                </tr>

                
            </table>
            
            <br><br>
            
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th width="30">
                            <input type="checkbox" name="cboxAll" id="cboxAll" onclick="checkAll();">
                        </th>
                        <th width="100">댓글번호</th>
                        <th width="170">게시글 제목</th>
                        <th width="200">댓글 내용</th>
                        <th width="130">회원아이디</th>
                        <th width="170">작성일자</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td onclick="event.stopPropagation()">
                            <input name="cbox" type="checkbox" value="">
                        </td>
                        <td>2</td>
                        <td>제주도 여행</td>
                        <td>재밌겠다</td>
                        <td>user02</td>
                        <td>23/01/03 06:15:55</td>
                    </tr>
                    <tr>
                        <td onclick="event.stopPropagation()">
                            <input name="cbox" type="checkbox" value="">
                        </td>
                        <td>2</td>
                        <td>제주도 여행</td>
                        <td>재밌겠다</td>
                        <td>user02</td>
                        <td>23/01/03 06:15:55</td>
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

            
        </div>

    </div>

</body>
</html>
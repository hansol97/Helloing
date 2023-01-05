<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="resources/css/adminPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>게시글 댓글 관리</title>
<style>

</style>
</head>
<body>

    <jsp:include page="menubar_admin.jsp"/>
    
    <div class="admin-content">

        <div class="admin-innerOuter" align="center">
            <br>
            <table>
                <tr id="admin-menu2">
                    <td><p><a href="boardList.ad">게시물 조회</a></p></td>
                    <td width="300"></td>
                    <td><p><a href="replyList.ad">댓글 조회</a></p></td>
                </tr>
                <tr>
                    <td><br><br></td>
                </tr>
                <tr>
                    <table id="admin-search_table">
                        <tr>
                            <form id="searchForm" action="" method="get">
                                <td>
                                    <select class="admin-search_form" name="" id="">
                                        <option value="">회원아이디</option>
                                        <option value="">제목</option>
                                    </select>
                                </td>
                                <td>
                                    <div class="text">
                                        <input type="text" class="admin-input_form" name="keyword">
                                    </div>        
                                </td>
                                <td class="td_search_button">
                                    &nbsp;<button type="submit" class="admin-search_button">검색</button>
                                </td>
                            </form>
                            <td width="610">
                                
                            </td>
                            <td><button id="admin-delete">삭제</button></td>
                        </tr>
                    </table>
                </tr>
                <br>
                <tr>
                    <table id="boardList" class="type02" align="center">
                        <thead>
                            <tr>
                                <th width="30">
                                    <input type="checkbox" name="cboxAll" id="cboxAll" onclick="checkAll();">
                                </th>
                                <th width="100">댓글번호</th>
                                <th width="260">게시글 제목</th>
                                <th width="300">댓글 내용</th>
                                <th width="120">회원 아이디</th>
                                <th width="150">작성일자</th>
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
                                <td>user01</td>
                                <td>2023.01.03</td>
                            </tr>
                            <tr>
                                <tr>
                                    <td onclick="event.stopPropagation()">
                                        <input name="cbox" type="checkbox" value="">
                                    </td>
                                    <td>2</td>
                                    <td>제주도 여행</td>
                                    <td>재밌겠다</td>
                                    <td>user01</td>
                                    <td>2023.01.03</td>
                                </tr>
                            </tr>
                        </tbody>
                    </table>
                </tr>
            </table>
            
            <br><br>
            

            <div id="pagingArea">
                <a>&lt;</a>
                <a>1</a>
                <a>2</a>
                <a>3</a>
                <a>&gt;</a>
            </div>
            <br><br>

            
        </div>

    </div>

</body>
</html>
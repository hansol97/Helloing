<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/adminPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>게시물 목록 조회</title>
<style>
    
    
    /* 검색창 */

    .admin-search_form{
        width:120px;
    }

    /* 관리자 해당 페이지 표시 */

    #admin-page_mark{
    color:#053E99;
    font-weight: bold;
    }

    
    
</style>
</head>
<body>

    <jsp:include page="menubar_admin.jsp"/>
    
    <div class="admin-content">

        <div class="admin-innerOuter" align="center">
            <br><br><br><br><br><br><br><br>
            <table>
                <tr id="admin-menu2">
                    <td><p><a id="admin-page_mark" href="boardList.ad">게시물 조회</a></p></td>
                    <td width="200"></td>
                    <td><p><a href="replyList.ad">댓글 조회</a></p></td>
                    <td width="200"></td>
                    <td><p><a href="reportList.ad">신고게시물 조회</a></p></td>
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
                                        <option value="">작성자 아이디</option>
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
                                <th width="100">회원번호</th>
                                <th width="100">아이디</th>
                                <th width="100">이름</th>
                                <th width="200">이메일</th>
                                <th width="150">전화번호</th>
                                <th width="80">상태</th>
                                <th>가입일자</th>
                                <th width="100">신고횟수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td onclick="event.stopPropagation()">
                                    <input name="cbox" type="checkbox" value="">
                                </td>
                                <td>2</td>
                                <td>user02</td>
                                <td>유저2</td>
                                <td>email2@mail.com</td>
                                <td>010-3333-3333</td>
                                <td>가입</td>
                                <td>2022.12.25</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td onclick="event.stopPropagation()">
                                    <input name="cbox" type="checkbox" value="">
                                </td>
                                <td>2</td>
                                <td>user02</td>
                                <td>유저2</td>
                                <td>email2@mail.com</td>
                                <td>010-3333-3333</td>
                                <td>가입</td>
                                <td>2022.12.25</td>
                                <td>2</td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="resources/css/adminPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
            <br>
            <table>
                <tr id="admin-menu2">
                    <td><p><a href="boardList.ad">게시물 조회</a></p></td>
                    <td width="200"></td>
                    <td><p><a   href="replyList.ad">댓글 조회</a></p></td>
                    <td width="200"></td>
                    <td><p><a id="admin-page_mark" href="reportList.ad">신고게시물 조회</a></p></td>
                </tr>
                <tr>
                    <td><br><br></td>
                </tr>
                <tr>
                    <table id="admin-search_table" >
                        <tr>
                            <form id="searchForm" action="" method="get">
                                <td>
                                    <select class="admin-search_form" name="" id="">
                                        <option value="">사업자명</option>
                                        <option value="">회원번호</option>
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
                            <td width="590">
                                
                            </td>
                            
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
                                <th width="100">글번호</th>
                                <th width="200">신고코드</th>
                                <th width="200">작성자 아이디</th>
                                <th width="200">신고자 아이디</th>
                                <td>신고일자</td>
                                <th width="100">내용</th>
                                <th>처리상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td onclick="event.stopPropagation()">
                                    <input name="cbox" type="checkbox" value="">
                                </td>
                                <td>10</td>
                                <td>액티비티 리뷰</td>
                                <td>user01</td>
                                <td>user04</td>
                                <td>2023.01.02</td>
                                <td><button>+</button></td>
                                <td>미처리</td>
                            </tr>
                            <tr>
                                <td onclick="event.stopPropagation()">
                                    <input name="cbox" type="checkbox" value="">
                                </td>
                                <td>10</td>
                                <td>액티비티 리뷰</td>
                                <td>user01</td>
                                <td>user04</td>
                                <td>2023.01.02</td>
                                <td><button>+</button></td>
                                <td>미처리</td>
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
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

    /* 객실명 설정 */
    #adminRoomName{
        color:rgb(95, 95, 95);
        font-size:13px;
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
                    <td><p><a href="businessPayList.ad">사업자 등록 결제</a></p></td>
                    <td width="150"></td>
                    <td><p><a id="admin-page_mark" href="roomPay.ad">숙소 결제</a></p></td>
                    <td width="150"></td>
                    <td><p><a href="actPay.ad">액티비티 결제</a></p></td>
                </tr>
                <tr>
                    <td><br><br></td>
                </tr>
                <tr>
                    <table id="admin-search_table">
                        <tr>
                            <form id="searchForm" action="" method="get">
                                <td>
                                    <div class="text">
                                        <input type="text" placeholder="회원아이디 입력" class="admin-input_form" name="keyword">
                                    </div>        
                                </td>
                                <td class="td_search_button">
                                    &nbsp;<button type="submit" class="admin-search_button">검색</button>
                                </td>
                            </form>
                            <td width="730">
                                
                            </td>
                        </tr>
                    </table>
                </tr>
                <br>
                <tr>
                    <table id="boardList" class="type02" align="center">
                        <thead>
                            <tr>
                                <th width="80">예약번호</th>
                                <th width="110">회원아이디</th>
                                <th width="210">
                                    숙소명/객실명
                                </th>
                                <th width="80">인원수</th>
                                <th width="120">가격</th>
                                <th width="210">예약기간</th>
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
                                    <span id="adminRoomName">- 스위트룸</span>
                                </td>
                                <td>3</td>
                                <td>44,500원</td>
                                <td>2023.01.06 ~ 2023.01.08</td>
                                <td>2023.01.01</td>
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
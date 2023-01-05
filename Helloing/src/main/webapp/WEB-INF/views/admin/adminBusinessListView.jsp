<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="resources/css/adminPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>사업자 조회</title>
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
                    <td><p><a href="memList.ad">일반회원 조회</a></p></td>
                    <td width="300"></td>
                    <td><p><a href="businessList.ad">사업자 조회</a></p></td>
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
                                <th width="100">회원번호</th>
                                <th width="100">사업자명</th>
                                <th width="200">사업자번호</th>
                                <th width="200">전화번호</th>
                                <th width="200">등록일자</th>
                                <th width="100">기타</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>10</td>
                                <td>사업자2</td>
                                <td>333-33-33333</td>
                                <td>010-3333-3333</td>
                                <td>2023.01.01</td>
                                <td onclick="event.stopPropagation()"><button>+</button></td>
                            </tr>
                            <tr>
                                <td>10</td>
                                <td>사업자2</td>
                                <td>333-33-33333</td>
                                <td>010-3333-3333</td>
                                <td>2023.01.01</td>
                                <td><button>+</button></td>
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
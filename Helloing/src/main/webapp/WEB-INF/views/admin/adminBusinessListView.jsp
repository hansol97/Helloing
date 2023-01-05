<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 조회</title>
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
                            <td width="">
                                
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

    <div class="content">

        <div class="innerOuter">

            <table>
                <form id="searchForm" action="" method="get">
                    <tr>
                        <td>
                            <select class="form-control" name="" id="">
                                <option value="">사업자명</option>
                                <option value="">회원번호</option>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="resources/css/adminPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>회원 조회</title>
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
            <br><br><br><br><br><br><br><br>
            <table>
                <tr id="admin-menu2">
                    <td><p><a id="admin-page_mark" href="memList.ad">일반회원 조회</a></p></td>
                    <td width="300"></td>
                    <td><p><a href="businessList.ad">사업자 조회</a></p></td>
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
                                        <option value="">아이디</option>
                                        <option value="">이름</option>
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
                            <td width="570">
                                
                            </td>
                            <td>&nbsp;&nbsp;<button id="reportMemDelete">정지</button></td>
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
                                <th width="80">회원번호</th>
                                <th width="100">아이디</th>
                                <th width="100">이름</th>
                                <th width="200">이메일</th>
                                <th width="150">전화번호</th>
                                <th width="80">상태</th>
                                <th width="180">가입일자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                            	<c:when test="${ empty list }" >
                            		<tr>
										<td colspan="8">
											조회할 회원이 없습니다.
										</td>
                            		</tr>
                            	</c:when>
                            	<c:otherwise>
                            		<c:forEach var="m" items="${ list }">
			                            <tr>
			                                <td onclick="event.stopPropagation()">
			                                    <input name="cbox" type="checkbox" value="">
			                                </td>
			                                <td>${m.memNo}</td>
			                                <td>${m.memId}</td>
			                                <td>${m.memName}</td>
			                                <td>${m.email}</td>
			                                <td>${m.phone }</td>
			                                <td>
			                                	<c:if test="${ m.status.equals('Y') }">
			                                		가입
			                                	</c:if>
			                                	<c:if test="${ m.status.equals('N') }">
			                                		탈퇴
			                                	</c:if>
			                                	<c:if test="${ m.status.equals('A') }">
			                                		관리자
			                                	</c:if>
			                                </td>
			                                <td>${ m.memEnrollDate }</td>
			                            </tr>
		                            </c:forEach>
		                         </c:otherwise>
		                     </c:choose>
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
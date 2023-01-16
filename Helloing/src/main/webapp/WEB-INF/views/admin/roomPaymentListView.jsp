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
    .adminRoomName{
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
                            <form id="searchForm" action="searchRoomPay.ad" method="get">
                                <td>
                                    <div class="text">
                                        <input id="roomPay_input"type="text" placeholder="회원아이디 입력" class="admin-input_form" name="keyword">
                                    </div>        
                                </td>
                                <td class="td_search_button">
                                    &nbsp;<button type="submit" class="admin-search_button">검색</button>
                                </td>
                            </form>
                            <td width="825">
                                
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
                                <th width="80">상태</th>
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
                            		<c:forEach var="rp" items="${ list }">
			                            <tr>
			                                <td>${rp.orderNo}</td>
			                                <td>${rp.memId}</td>
			                                <td>${rp.accName}<br>
	                                  			<span class="adminRoomName">- ${rp.roomName}</span>
	                            	  	 	</td>
	                            	  	 	<td>${rp.headCount}</td>
			                                <td>${rp.price}</td>
			                                <td>${rp.startDate} ~ ${rp.endDate}</td>
			                                <td>${rp.paymentDate}</td>
			                                <td>
			                                	<c:if test="${(rp.status).equals('Y')}">
			                                		결제
			                                	</c:if>
			                                	<c:if test="${(rp.status).equals('N')}">
			                                		취소
			                                	</c:if>
			                                </td>
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
                
                <c:choose>
                	<c:when test="${ pi.currentPage eq 1 }">
                		<a disabled onclick="return false;">&lt;</a>
                	</c:when>
                	<c:otherwise>
                		<a href="roomPay.ad?cpage=${ pi.currentPage - 1 }">&lt;</a>
                	</c:otherwise>
                </c:choose>
					
				<c:forEach var="p" begin="${ pi.startPage }"  end="${ pi.endPage }" >
					<a href="roomPay.ad?cpage=${ p }">${ p }</a> 
				</c:forEach>              
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<a didsabled onclick="return false;">&gt;</a>
					</c:when>
					<c:otherwise>
						<a href="roomPay.ad?cpage=${ pi.currentPage + 1 }">&gt;</a>
					</c:otherwise>
				</c:choose>
            </div>
            <br><br>

            
        </div>
        
         <script>
        	$(function(){
        		if('${keyword}' != ''){
					$('#roomPay_input').val('${keyword}')
                }
        	})
        </script>

    </div>   

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="resources/css/adminPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>기업 등록 결제</title>
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
                    <td><p><a id="admin-page_mark" href="businessPayList.ad">사업자 등록 결제</a></p></td>
                    <td width="150"></td>
                    <td><p><a href="roomPay.ad">숙소 결제</a></p></td>
                    <td width="150"></td>
                    <td><p><a href="actPay.ad">액티비티 결제</a></p></td>
                </tr>
                <tr>
                    <td><br><br></td>
                </tr>
                <tr>
                    <table id="admin-search_table">
                        <tr>
                            <form id="searchForm" action="busiPaySearch.ad" method="post">
                                <td>
                                    <div class="text">
                                        <input type="text" id="busiPay_input" placeholder="사업자명 입력" class="admin-input_form" name="keyword">
                                    </div>        
                                </td>
                                <td class="td_search_button">
                                    &nbsp;<button type="submit" class="admin-search_button">검색</button>
                                </td>
                            </form>
                            <td width="620">
                                
                            </td>
                        </tr>
                    </table>
                </tr>
                <br>
                <tr>
                    <table id="boardList" class="type02" align="center">
                        <thead>
                            <tr>
                                <th width="80">결제번호</th>
                                <th width="120">사업자명</th>
                                <th width="150">결제 금액</th>
                                <th width="300">숙소명/액티비티명</th>
                                <th width="180">결제 만료일자</th>

                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                            	<c:when test="${ empty list }" >
                            		<tr>
										<td colspan="5">
											조회할 회원이 없습니다.
										</td>
                            		</tr>
                            	</c:when>
                            	<c:otherwise>
                            		<c:forEach var="bp" items="${ list }" varStatus="status">
			                            <tr>
			                                <td>${ bp.paymentNo }</td>
			                                <td>${ bp.businessNo }</td>
			                                <td>${ bp.paymentAmount }</td>
			                                <td>
				                                <c:if test="${ !bp.accommName.equals('0')}" >
				                                	${ bp.accommName } 
				                                </c:if> 
				                                <c:if test="${ !bp.activityName.equals('0')}" >
				                                	${ bp.activityName }
				                                </c:if> 
			                                </td>
			                                <td>
			                                <c:if test="${ !bp.actEndDate.equals('0')}" >
			                                	${ bp.actEndDate }
			                                </c:if> 
			                                <c:if test="${ !bp.accEndDate.equals('0')}" >
			                                	${ bp.accEndDate }
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
                		<a href="businessPayList.ad?cpage=${ pi.currentPage - 1 }">&lt;</a>
                	</c:otherwise>
                </c:choose>
					
				<c:forEach var="p" begin="${ pi.startPage }"  end="${ pi.endPage }" >
					<a href="businessPayList.ad?cpage=${ p }">${ p }</a> 
				</c:forEach>              
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<a didsabled onclick="return false;">&gt;</a>
					</c:when>
					<c:otherwise>
						<a href="businessPayList.ad?cpage=${ pi.currentPage + 1 }">&gt;</a>
					</c:otherwise>
				</c:choose>
            </div>
            <br><br>
            
        </div>
        
        <script>
        	$(function(){
        		if('${keyword}' != ''){
					$('#busiPay_input').val('${keyword}')
                }
        	})
        </script>
        
    </div>
</body>
</html>
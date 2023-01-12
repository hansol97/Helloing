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
                            <form id="searchForm" action="memListSearch.ad" method="get">
                                <td>
                                    <select class="admin-search_form" name="condition">
                                        <option value="searchId">아이디</option>
                                        <option value="searchName">이름</option>
                                    </select>
                                </td>
                                <td>
                                    <div class="text">
                                        <input type="text" id="mem_search_input" class="admin-input_form" name="keyword">
                                    </div>        
                                </td>
                                <td class="td_search_button">
                                    &nbsp;<button type="submit" class="admin-search_button">검색</button>
                                </td>
                            </form>
                            <td width="580">
                                
                            </td>
                            <td>&nbsp;&nbsp;<button id="memDelete-btn">정지</button></td>
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
			                                    <input class="cbox" type="checkbox" value="">
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
			                                	<c:if test="${ m.status.equals('S') }">
			                                		정지
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
                
                <c:choose>
                	<c:when test="${ pi.currentPage eq 1 }">
                		<a disabled onclick="return false;">&lt;</a>
                	</c:when>
                	<c:otherwise>
                		<a href="memList.ad?cpage=${ pi.currentPage - 1 }">&lt;</a>
                	</c:otherwise>
                </c:choose>
					
				<c:forEach var="p" begin="${ pi.startPage }"  end="${ pi.endPage }" >
					<a href="memList.ad?cpage=${ p }">${ p }</a> 
				</c:forEach>              
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<a didsabled onclick="return false;">&gt;</a>
					</c:when>
					<c:otherwise>
						<a href="memList.ad?cpage=${ pi.currentPage + 1 }">&gt;</a>
					</c:otherwise>
				</c:choose>
            </div>
            <br><br>
			
			<script>
				$(function(){
					$('#memDelete-btn').click(function(){
                        var list = $(".cbox");
                        if($('input[type=checkbox]:checked').length == 1){
                            list.each(function(index, value){
                                if($(value).prop('checked')){
                                    $.ajax({
                                    	url:'deleteMem.ad'
                                    	,data : {
                                    		memNo : $(value).parent().next()[0].outerText
                                    	}
                                    	,success : function(result){
                                    		if(result == 'YYYY'){
                                    			alert('정지 성공');
                                    			location.href="memList.ad";
                                    		}
                                    		else{
                                    			alert('정지 실패');
                                    		}
                                    	}
                                    	,error : function(){
                                    		console.log('실패');
                                    	}
                                    })
                                }
                            });
                        }
                        else{
                            alert('하나를 선택하세요');
                        }
                    });
					
					if('${map.condition}' != ''){
   						if('${ map.condition }' == "searchId"){
   							$('select option:eq(0)').prop('selected', true);
   						}else{
   							$('select option:eq(1)').prop('selected', true);
   						};
    					
   						$('#mem_search_input').val('${map.keyword}');
                    }
				})
			</script>
            
        </div>

    </div>

</body>
</html>
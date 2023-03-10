<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="resources/css/adminPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>액티비티 결제</title>
<style>
    /* 관리자 해당 페이지 표시 */

    #admin-page_mark{
        color:#053E99;
        font-weight: bold;
    }

    /* 모달 */
    
    .modal {
    position: absolute;
    top: 0;
    left: 0;

    width: 100%;
    height: 100%;

    display: none;

    background-color: rgba(0, 0, 0, 0.4);
  }

  .modal.show {
    display: block;
  }

  .modal_body {
    position: absolute;
    top: 500px;
    left: 50%;

    width: 800px;
    height: 400px;

    padding: 40px;

    overflow-x: auto;
    /* text-align: center; */

    background-color: rgb(255, 255, 255);
    border-radius: 3px;
    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

    transform: translateX(-50%) translateY(-50%);
  }

  .modal-title{
    margin-left:30px;
  }

  .modal-title span{
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
                    <td><p><a href="businessPayList.ad">사업자 등록 결제</a></p></td>
                    <td width="150"></td>
                    <td><p><a  href="roomPay.ad">숙소 결제</a></p></td>
                    <td width="150"></td>
                    <td><p><a id="admin-page_mark" href="actPay.ad">액티비티 결제</a></p></td>
                </tr>
                <tr>
                    <td><br><br></td>
                </tr>
                <tr>
                    <table id="admin-search_table">
                        <tr>
                            <form id="searchForm" action="searchActPay.ad" method="post">
                                <td>
                                    <div class="text">
                                        <input id="actPay_input" type="text" placeholder="회원아이디 입력" class="admin-input_form" name="keyword">
                                    </div>        
                                </td>
                                <td class="td_search_button">
                                    &nbsp;<button type="submit" class="admin-search_button">검색</button>
                                </td>
                            </form>
                            <td width="690">
                                
                            </td>
                        </tr>
                    </table>
                </tr>
                <br>
                <tr>
                    <table id="boardList" class="type02" align="center">
                        <thead>
                            <tr>
                            	<th width="80">주문번호</th>
                                <th width="110">회원아이디</th>
                                <th width="350">액티비티명</th>
                                <th width="120">사업자명</th>
                                <th width="120">총 지불금액</th>
                                <th width="110">결제일자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                            	<c:when test="${ empty list }" >
                            		<tr>
										<td colspan="6">
											조회할 회원이 없습니다.
										</td>
                            		</tr>
                            	</c:when>
                            	<c:otherwise>
                            		<c:forEach var="tp" items="${ list }">
			                            <tr>
			                                <td>${tp.orderNo}</td>
			                                <td>${tp.memId}</td>
	                            	  	 	<td class="activity_name_td"><input type="hidden" value="${tp.orderNo}" >${tp.activityName}</td>
			                                <td>${tp.businessName}</td>
			                                <td>${tp.paymentAmount}</td>
			                                <td>${tp.paymentDate}</td>
			                            </tr>
		                            </c:forEach>
		                         </c:otherwise>
		                     </c:choose>
                        </tbody>
                    </table>
                </tr>
            </table>
            
            <script>
            	$(function(){
            		$('.activity_name_td').click(function(){
            			console.log($(this).children().eq(0).val());
            			$.ajax({
            				url : 'ticketList.ad'
            				,data : {orderNo : $(this).children().eq(0).val()}
            				,success : function(tList){
            					
            					var result = '';
            					
            					for(var i in tList){
            						result += '<tr>'
            								+ 	'<td>' + tList[i].ticketNo + '</td>'
            								+	'<td>' + tList[i].ticketName + '</td>'
            								+ 	'<td>' + tList[i].count + '</td>'
            								+ 	'<td>' + tList[i].price + '</td>' 
            								+ 	'<td>' + tList[i].startDate + ' ~ ' + tList[i].endDate + '</td>'
            								+ '</tr>'
            					}
            					
            					$('#ticket_detail_tb tbody').html(result);
            					
            					openModal();
            					
            				}
            				,error : function(){
            					console.log('실패');
            				}
            			})
            		})
            	})
            </script>
            
            <br><br>
            

            <div id="pagingArea">
                
                <c:choose>
                	<c:when test="${ pi.currentPage eq 1 }">
                		<a disabled onclick="return false;">&lt;</a>
                	</c:when>
                	<c:otherwise>
                		<a href="actPay.ad?cpage=${ pi.currentPage - 1 }">&lt;</a>
                	</c:otherwise>
                </c:choose>
					
				<c:forEach var="p" begin="${ pi.startPage }"  end="${ pi.endPage }" >
					<a href="actPay.ad?cpage=${ p }">${ p }</a> 
				</c:forEach>              
				
				<c:choose>
					<c:when test="${ pi.currentPage eq pi.maxPage }">
						<a didsabled onclick="return false;">&gt;</a>
					</c:when>
					<c:otherwise>
						<a href="actPay.ad?cpage=${ pi.currentPage + 1 }">&gt;</a>
					</c:otherwise>
				</c:choose>
            </div>
            <br><br>

            

            
        </div>

        
        

    </div>


    <div class="modal">
        <div class="modal_body">
            <div>
                <div class="modal-title">
                    <span>티켓 상세정보</span>
                </div>
                <div align="center">
                    <table class="type02" id="ticket_detail_tb">
                        <thead>
                            <th width="90">티켓번호</th>
                            <th width="200">티켓명</th>
                            <th width="80">수량</th>
                            <th width="110">가격</th>
                            <th width="200">사용기간</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>25</td>
                                <td>주중 종일권</td>
                                <td>2</td>
                                <td>43,800원</td>
                                <td>2022.12.24 ~ 2023.02.27</td>
                            </tr>
                            <tr>
                                <td>25</td>
                                <td>주중 종일권</td>
                                <td>2</td>
                                <td>43,800원</td>
                                <td>2022.12.24 ~ 2023.02.27</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
    
	    var body = document.querySelector('body');
	    var modal = document.querySelector('.modal');	
    
    	function openModal(){
    		var body = document.querySelector('body');
            var modal = document.querySelector('.modal');
      
              modal.classList.toggle('show');
      
              if (modal.classList.contains('show')) {
                body.style.overflow = 'hidden';
              }
            
    	}
    	
    	modal.addEventListener('click', (event) => {
            if (event.target === modal) {
              modal.classList.toggle('show');
    
              if (!modal.classList.contains('show')) {
                body.style.overflow = 'auto';
              }
            }
          });
    	
    	$(function(){
    		if('${keyword}' != ''){
				$('#actPay_input').val('${keyword}')
            }
    	})
        
      </script>
    
    
</body>
</html>
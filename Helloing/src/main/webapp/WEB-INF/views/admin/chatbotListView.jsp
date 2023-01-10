<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="resources/css/adminPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>챗봇</title>
<style>
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

    width: 450px;
    height: 360px;

    padding: 40px;

    overflow-x: auto;
    /* text-align: center; */

    background-color: rgb(255, 255, 255);
    border-radius: 3px;
    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

    transform: translateX(-50%) translateY(-50%);
  }

  .modal-title{
    margin-left:20px;
  }

  .modal-title span{
    font-weight: bold;
  }

  /* 챗봇 모달 설정 */
  .keyword_content{
    font-family: 'S-CoreDream-3Light';
    width:400px;
    height:200px;
    resize: none;
  }

  .keyword_input{
    font-family: 'S-CoreDream-3Light';
    width:400px;
    height:23px;
    border-radius: 2px;
    border:1px solid rgb(150, 150, 150);
  }

  #keyword_enroll_btn button{
    margin-left: 20px;
    margin-right: 20px;
    background-color: rgb(233, 233, 233);
    display:inline-block;
    width:45px;
    height:27px;
    text-align: center;
    border-radius: 3px;
    border:1px solid rgb(150, 150, 150);
    margin-left:10px;
  }
</style>
</head>
<body>
    <jsp:include page="menubar_admin.jsp"/>
    
    <c:if test="${ not empty alertMsg }">
    	<script>
    		alert('${alertMsg}');
    	</script>
    </c:if>
    
    <div class="admin-content">

        <div class="admin-innerOuter" align="center">
            <br><br><br><br><br><br><br><br>
            <table>
                <tr>
                    <td><br><br><br></td>
                </tr>
                <tr>
                    <table id="admin-search_table">
                        <tr>
                            <form id="searchForm" action="searchChatbot.ad" method="get">
                                <td>
                                    <select class="admin-search_form" name="condition" >
                                        <option value="chatbotName">키워드명</option>
                                        <option value="chatbotContent">내용</option>
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
                            <td width="420">
                                
                            </td>
                            <td><button onclick="openModal(1);" class="admin-grey">등록</button></td>
                            <td><button id="updateChatbot" class="admin-grey">수정</button></td>
                            <td><button class="admin-grey" onclick="delConfirm();">삭제</button></td>
                        </tr>
                    </table>
                </tr>
                
                <script>
                    $(function(){
                        $('#updateChatbot').click(function(){
                            var chatbotQ = '';
                            var list = $(".cbox");
                            if($('input[type=checkbox]:checked').length == 1){
                                list.each(function(index, value){
                                    if($(value).prop('checked')){
                                        console.log($(value).parents('td').next()[0].outerText);
                                        $('#update_chatbotQ').val($(value).parents('td').next()[0].outerText);
                                        $('#update_chatbotA').val($(value).parents('td').next().next()[0].outerText);
                                        $('#update_ori_chatbotQ').val($(value).parents('td').next()[0].outerText);
                                        openModal(2)
                                    }
                                })
                            }
                            else{
                                alert('하나만 선택하세요');
                            }
                        });
							
					})      
					
					function delConfirm(){
						if(confirm("삭제하시겠습니까?")){
							deleteChatbot();			
						}
						else{
							return false;
						}
					}
					
					function checkAll(){
						if($('#cboxAll').is(':checked')){
							$(".cbox").prop("checked", true);
						} else{
							$(".cbox").prop("checked", false);
						}
					};
					
					$(".cbox").click(function(){
						$("#cboxAll").prop("checked", false);
					});
					
					function deleteChatbot(){
						
						var cArr = new Array();
						var list = $(".cbox");
						for(var i = 0; i < list.length; i++){
							if(list[i].checked){
								cArr.push(list[i].value);
							}
						}
						console.log(cArr);
						
						$.ajax({
							url : "deleteChatbot.ad"
							,data : {
								cbox : cArr
							}
							,success : function(result){
								if(result > 0){
									location.href = "chatbotList.ad"
								} else{
									alert("삭제 실패");
								}
							}
						})
						
					};
                </script>

                <br>
                <tr>
                    <table id="boardList" class="type02" align="center">
                        <thead>
                            <tr>
                                <th width="30">
                                    <input type="checkbox" name="cboxAll" id="cboxAll" onclick="checkAll();">
                                </th>
                                <th width="200">키워드명</th>
                                <th width="700">키워드 답변용</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:choose>
                        		<c:when test="${ empty list }" >
                        			<tr>
                        				조회할 키워드가 없습니다.
                        			</tr>
                        		</c:when>
                        		<c:otherwise>
                        			<c:forEach var="c" items="${ list }">
			                            <tr>
			                                <td onclick="event.stopPropagation()">
			                                    <input class="cbox" name="originChatbotQ" type="checkbox" value="${ c.chatbotQ }">
			                                </td>
			                                <td>${ c.chatbotQ }</td>
			                                <td>${ c.chatbotA }</td>
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

    <div id="keword_enroll_page" class="modal modal1">
        <div class="modal_body">
            
            <div class="modal-title">
                <span>키워드 등록</span>
            </div>
            <div align="center">
                <br>
                <form action="insertChatbot.ad" method="post">
                    <table>
                        <tr>
                            <td>
                                <input class="keyword_input" type="text" placeholder="키워드명을 입력하세요" name="chatbotQ" required>
                            </td>
                        </tr>
                        <tr>
                            <td><br></td>
                        </tr>
                        <tr>
                            <td>
                                <textarea class="keyword_content" placeholder="키워드 답변내용을 입력하세요" name="chatbotA" required></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td><br></td>
                        </tr>
                    </table>

                    <div id="keyword_enroll_btn">
                        <button type="submit">등록</button>
                        <button id="keyword_cancel keyword_cancel1" type="button" onclick="keywordCancel(1);">취소</button>
                    </div>
                </form>
                
            </div>
            
        </div>
    </div>

    <div id="keword_enroll_page" class="modal modal2">
        <div class="modal_body">
            <div>
                <div class="modal-title">
                    <span>키워드 수정</span>
                </div>
                <div align="center">
                    <br>
                    <form action="updateChatbot.ad" method="post">
                    	<input id="update_ori_chatbotQ" type="hidden" name="originChatbotQ" >
                        <table>
                            <tr>
                                <td>
                                    <input class="keyword_input" id="update_chatbotQ" type="text" placeholder="키워드명을 입력하세요" name="chatbotQ" required>
                                </td>
                            </tr>
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr>
                                <td>
                                    <textarea class="keyword_content" id="update_chatbotA" name="chatbotA" placeholder="키워드 답변내용을 입력하세요" required></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td><br></td>
                            </tr>
                        </table>
    
                        <div id="keyword_enroll_btn">
                            <button type="submit">수정</button>
                            <button id="keyword_cancel keyword_cancel2" type="button" onclick="keywordCancel(2);">취소</button>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>

    

    <script>
        const body = document.querySelector('body');
        
        // const modal = document.querySelector('.modal');

        function keywordCancel(num){
            let modal = document.querySelector('.modal'+ num);
            const btnCancel = document.getElementById('#keyword_cancel'+ num);
            modal.classList.remove('show');
        };

        function openModal(num){
            let modal = document.querySelector('.modal'+num);
            modal.classList.toggle('show');
            
  
            if (modal.classList.contains('show')) {
            body.style.overflow = 'hidden';
            }

            
        };

        
        let modal = document.querySelector('.modal');
            modal.addEventListener('click', (event) => {
            if (event.target === modal) {
                modal.classList.toggle('show');

                if (!modal.classList.contains('show')) {
                body.style.overflow = 'auto';
                }
            }
        });

      </script>
</body>
</html>
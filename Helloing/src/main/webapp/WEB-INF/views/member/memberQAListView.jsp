
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Planner</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
/* 구조 관련 */
.out {
	width: 1200px;
	height: 100%;
	margin: auto;
}

.out .include {
	width: 300px;
	float: left;
}

#detail {
	width: 900px;
	float: left;
}

#detail h1 {
	font-size: 30px;
	font-weight: 600;
	padding: 10px;
}

.admin-innerOuter {
	font-family: 'S-CoreDream-3Light';
	width: 900px;
	margin: auto;

	background-color: white;
	word-break: break-all;
}

/* 리스트 스타일 */
#boardList {
	text-align: center;
}

#boardList>tbody>tr:hover {
	cursor: pointer;
}

#pagingArea {
	width: fit-content;
	margin: auto;
}

/* ------검색창 삭제------- */

/* 메뉴바2 */
#admin-menu2 p {
	border-bottom: 1px solid #d3d3d3;
}

#admin-menu2 a {
	font-size: 20px;
}

/* 페이징바 */
#pagingArea a {
	margin: 5px;
}

/* 제재대상 회원 조회버튼 */
#reportMemSelect {
	background-color: rgb(152, 152, 152);
	display: inline-block;
	width: 110px;
	height: 27px;
	text-align: center;
	border-radius: 3px;
	border: 1px solid rgb(150, 150, 150);
	margin-left: 10px;
}

/* 테이블 스타일2 */
table.type02 {
	border-collapse: separate;
	border-spacing: 0;
	line-height: 1.5;
	border: 1px solid rgb(236, 236, 236);
	margin: 20px 10px;
	text-align: center;
}

table.type02 th {
	font-weight: 600;
	color: rgb(24, 24, 24);
	padding: 5px;
	vertical-align: top;
	border: 1px solid rgb(236, 236, 236);
	background: #d3d3d3;
}

table.type02 td {
	padding: 7px;
	vertical-align: top;
	border: 1px solid rgb(236, 236, 236);
}
/* 테이블 스타일3 */
table.type03 {
	border-collapse: separate;
	border-spacing: 0;
	line-height: 1.5;
	border: 1px solid rgb(236, 236, 236);
	margin: 20px 10px;
	text-align: center;
}

table.type03 th {
	font-weight: 600;
	color: rgb(24, 24, 24);
	padding: 5px;
	vertical-align: top;
	border: 1px solid rgb(236, 236, 236);
	background: #d3d3d3;
}

table.type03 td {
	padding: 7px;
	vertical-align: top;
	border: 1px solid rgb(236, 236, 236);
}

/* 두글자 연회색 버튼 */
.admin-grey, #reportMemDelete, #admin-delete {
	background-color: rgb(233, 233, 233);
	display: inline-block;
	width: 45px;
	height: 27px;
	text-align: center;
	border-radius: 3px;
	border: 1px solid rgb(150, 150, 150);
	margin-left: 10px;
}
.modal {
    position: absolute;
    top: 0;
    left: 0;

    width: 100%;


    display: none;

    background-color: rgba(0, 0, 0, 0);
  }

  .modal.show {
    display: block;
  }

  .modal_body {
    position: absolute;
    top: 500px;
    left: 1000px;

    width: 600px;
    height: 500px;

    padding: 40px;

    overflow-x: auto;
    /* text-align: center; */

    background-color: rgb(255, 255, 255);
    border-radius: 3px;
    box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);

    transform: translateX(-50%) translateY(-50%);
  }

  .modal-title{
    margin-left:40px;
  }

  .modal-title span{
    font-weight: bold;
  }

  /* 문의 모달 설정 */
  /*문의제목*/
  .qnaTitle-text{
    font-family: 'S-CoreDream-3Light';
    width:400px;
    height:20px;
  }
  /*문의내용*/
  .qnaQ-text{
    font-family: 'S-CoreDream-3Light';
    width:400px;
    height:180px;
  }
   /*문의카테고리*/
  .modal_body select{
    font-family: 'S-CoreDream-3Light';
    border: 0px;
  }

  #QA_input{
    font-family: 'S-CoreDream-3Light';
    width:400px;
    height:23px;
    border-radius: 2px;
    border:1px solid rgb(150, 150, 150);
  }

  #QA_enroll_btn button{
    margin-left: 60px;
    margin-right: 20px;
    background-color: rgb(233, 233, 233);
    display:inline-block;
    width:45px;
    height:27px;
    text-align: center;
    border-radius: 3px;
    border:1px solid rgb(150, 150, 150);
  }
  .btn-update{
  	border:none;

  }

</style>

</head>
<body>

	<jsp:include page="../common/menubar_user.jsp" />
	<br>
	<br>

	<div class="out">
		<div class="include">
			<jsp:include page="../member/myPage.jsp" />
		</div>

		<div id="detail">
			<h1>1:1 문의</h1>
			<br><br><br><br>
		    <div class="admin-content">

        <div class="admin-innerOuter" >
            
            <table>
                <tr>
                    <td><br>
                </tr>
                <tr>
                    <table id="admin-search_table">
                        <tr>
                            <td width="590">
                            </td>
                            <td><button onclick="openModal1();" class="admin-grey">등록</button></td>
                            <!-- <td><button onclick="openModal(2);" id="updateQAList" class="admin-grey">수정</button></td>  -->
                            <td><button onclick="btnDelete()" id="btnDelete" class="admin-grey">삭제</button></td>
                        </tr>
                    </table>
                </tr>
                <tr>
                    <table id="boardList" class="type02" align="center">
                        <thead>
                            <tr>
                                <th width="30">
                                   <!--  <input type="checkbox" name="cboxAll" id="checkAll" onclick="checkAll();">  -->
                                </th>
                                <th width="80">문의번호</th>
                                <th width="120">문의종류</th>
                                <th width="250">제목</th>
                                <th width="110">등록일</th>
                                <th width="80">답변여부</th>
                                <th width="50">수정</th>
                                <th width="80">상세보기</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${ list }" var="qna"> 
                            <tr>
                                <td>
                                    <input class="cbox" type="checkbox" name="checkbox" value="${ qna.qnaNo }">
                                </td>
                                <td id="qnaNo">${ qna.qnaNo }</td>
                                <c:choose>
                                	<c:when test="${ qna.category == 'accomm' }" >
                                		<td>숙소관련</td>
                                	</c:when>
                                	<c:otherwise>
                                		<td>상품관련</td>
                                	</c:otherwise>
                                </c:choose>
	                                <td>${ qna.qnaTitle }</td>
	                                <td>${ qna.qnaDate }</td>
	                            <c:choose>
	                            	<c:when test="${ qna.ansYn =='N' }">
	                            		<td>미완료 </td>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<td>완료 </td>
	                            	</c:otherwise>
	                            </c:choose>
	                            	<td><button onclick="openModal2()"  id="updateQAList"  class="btn-update">수정</button></td>
	                            	<td><button onclick="openModal3()"  id="detailQAList"  class="btn-update">상세보기</button></td>
                            </tr>
                            </c:forEach>
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

    <div id="QA_enroll_page" class="modal modal1">
        <div class="modal_body">
            
            <div class="modal-title">
                <span>QA 문의 하기</span>
            </div>
            <div align="center">
                <br>
                <form action="insertQna.me" method="post">
                    <input type="hidden" name="memNo" id="memNo" value="${ sessionScope.loginUser.memNo }">
                   	<c:choose>
                   		<c:when test="${ not empty sessionScope.loginCompany.businessNo }">
                    		<input type="hidden" name="qnaSort" value="기업">
                   		</c:when>
                   		<c:otherwise>
                   			<input type="hidden" name="qnaSort" value="일반">
                   		</c:otherwise>
                   	</c:choose>
                    <table class="type02">
                        <tr>
                            <th>카테고리</th>
                            <td>
                                <select name="category">
                                    <option value="accomm">숙소관련</option>
                                    <option value="activity">상품관련</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th width="80">제목</th>
                            <td width="300"><input type="text" name="qnaTitle" class="qnaTitle-text" placeholder="제목을 입력하세요"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td width="300"><input type="text" name="qnaQ" class="qnaQ-text" placeholder="내용을 입력하세요"></td>
                            <!-- <textarea style="resize: none;" rows="4" cols="50" name="qnaQ" class="qnaQ-text" ></textarea> -->
                        </tr>
                        <tr>
                        </tr>
                    </table>

                    <div id="QA_enroll_btn">
                        <button type="submit">등록</button>
                        <button id="QA_cancel QA_cancel1" type="button" onclick="QACancel1();">취소</button>
                    </div>
                </form>
                
            </div>
            
        </div>
    </div>

    <div id="QA_enroll_page" class="modal modal2">
        <div class="modal_body">
            
            <div class="modal-title">
                <span>QA 수정</span>
            </div>
            <div align="center">
                <br>
                <form action="updateQna.me">
                    <table class="type03">
                    
                    	<!--  <input type="hidden" name="memNo" id="updateMemNo" value="${ sessionScope.loginUser.memNo }"> -->
                       	
                       <!--  	
                        <tr>
                            <th width="80">제목</th>
                            <td width="300"><input type="text" name="qnaTitle" maxlength="20"
							value="${ qna.qnaTitle }"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>안녕하세요 숙소관련 문의합니다</td>
                        </tr>
                        <tr>
                            <th>카테고리</th>
                            <td>숙소관련</td>
                        </tr>
                        <tr>
                            <th>구분</th>
                            <td>일반회원</td>
                        </tr>
                        <tr>
                            <th>답변</th>
                            <td><textarea name="" id="" placehold="답변을 입력하세요">답변입니다</textarea></td>
                        </tr>
                       -->
                    </table>

                    <div id="QA_enroll_btn">
                        <button type="submit">수정</button>
                        <button id="QA_cancel QA_cancel2" type="button" onclick="QACancel2();">취소</button>
                    </div>
                </form>
                
            </div>
            
        </div>
    	</div>
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	
    	<div id="QA_enroll_page" class="modal modal3">
        <div class="modal_body">
            
            <div class="modal-title">
                <span>상세보기</span>
            </div>
            <div align="center">
                <br>
                <form action="#">
                    <table class="type04">
                    
                    	<!--  <input type="hidden" name="memNo" id="updateMemNo" value="${ sessionScope.loginUser.memNo }"> -->
                       	
                       <!--  	
                        <tr>
                            <th width="80">제목</th>
                            <td width="300"><input type="text" name="qnaTitle" maxlength="20"
							value="${ qna.qnaTitle }"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>안녕하세요 숙소관련 문의합니다</td>
                        </tr>
                        <tr>
                            <th>카테고리</th>
                            <td>숙소관련</td>
                        </tr>
                        <tr>
                            <th>구분</th>
                            <td>일반회원</td>
                        </tr>
                        <tr>
                            <th>답변</th>
                            <td><textarea name="" id="" placehold="답변을 입력하세요">답변입니다</textarea></td>
                        </tr>
                       -->
                    </table>

                    <div id="QA_enroll_btn">
                        <button type="submit">수정</button>
                        <button id="QA_cancel QA_cancel3" type="button" onclick="QACancel3();">취소</button>
                    </div>
                </form>
                
            </div>
            
        </div>
    	</div>

		</div>

	</div>

<!-- 
		<script>
		$(function(){
			$('#updateQAList').click(function(){     
				$.ajax({
					url : 'selectQna1.sj',
					data : {qnaNo:$('#qnaNo').val()}, 
					success : function(result){
						console.log(result);
						
						value += '<tr>'
                        		+ '<th>내용</th>'
                        		+ '<td>안녕하세요 숙소관련 문의합니다</td>'
                    			+  '</tr>';
						$('.type02').html(value);
						
					},
					error:function(){
						console.log('통신실패')
					}
				});
			});			

		})
	</script>
 -->

      	<script>
      	
		$(document).ready(function() {
			$("#checkAll").click(function() {
				if($("#checkAll").is(":checked")) $("input[name=cbox]").prop("checked", true);
				else $("input[name=cbox]").prop("checked", false);
			});
			
			$("input[name=cbox]").click(function() {
				var total = $("input[name=cbox]").length;
				var checked = $("input[name=cbox]:checked").length;
				
				if(total != checked) $("#checkAll").prop("checked", false);
				else $("#checkAll").prop("checked", true); 
			});
		});
	</script>
	
	<script>
	<%--
		$(function(){
			
	        $('#updateQAList').click(function(){
	            var list = $(".cbox");
	            if($('input[type=checkbox]:checked').length == 1){
	                list.each(function(index, value){
	                    if($(value).prop('checked')){
	                        $('#updateMemNo').val($(value).parents('td').next()[0].innerText);
	                        openModal(2);
	                    }
	                });
	            }
	            else{
	                alert('하나를 선택하세요');
	            }
	        });
	
		});      
		--%>
		function btnDelete(){
			if(confirm("삭제하시겠습니까?")){
				deleteQA();			
			}
			else{
				return false;
			}
		}
		
		function deleteQA(){
			var cArr = new Array();
			var list = $(".cbox");
			for(var i = 0; i < list.length; i++){
				if(list[i].checked){
					cArr.push(list[i].value);
				}
			}
			console.log(cArr);
			
			$.ajax({
				url : "deleteQna.me"
				,data : {
					cbox : cArr
				}
				,success : function(result){
					if(result > 0){
						location.href = "selectQna.me"
					} else{
						alert("삭제 실패");
					}
				}
			})
			
			
		}
	
	</script>
	<!--  
	<script>
		function updateQAList(){
			$.ajax({
				url : 'updateQna.me',
				data : {
					qnaNo : $('#qnaNo').text()
				},
				success : function(qna){
					console.log(qna)
					value += '<tr>'
                           	+ '<th width="80">제목</th>'
                           	+ '<td width="300"><input type="text" name="qnaTitle" maxlength="20"value="' + qna.qnaTitle + '"></td>'
                    		+ '</tr>';
                    $('.type02').html(value);    		
				},
				error:function(){
					console.log('실패')
				}
			})
			
		}	
	</script>
	-->
	<!--  
	<script>
	function btnDelete(){
		var chekBoxArr =[];
		$("input:checkbox[name='checkbox']:checked").eack(function() {
			checkBoxArr.push($(this).val());
			console.log(checkBoxArr);
		})
	}
	
	
	
	
	
	
	
	<%--
	$(#.btnDelete).click(function() {
		
	}
		
	
	
	
	
	
	$(function() {
		$(document).on('change','.cbox', function(){
			if($(this).prop('checked')){
				
				$.ajax({
					url : 'deleteQna.me',
					data : {
						qnaNo : $('#qnaNo').val()
					},
					success : function(result){
						consol.log(result);
					}
				}) //delete버튼을 누르면 실행해야하는 ajax
			}
		}
	}
	-->
	
	//.parent().sibling(0)
	
	
	
	
	<%--
	$(function(){
		$(document).on('change', '.cbox', function(){
			if($('.cbox').prop('checked')){
			}
		})
	})
	--%>	
		
		
	
	
	</script>
-->

	<script>
        const body = document.querySelector('body');
        

        function QACancel1(){
            let modal = document.querySelector('.modal1');
            const btnCancel = document.getElementById('#QA_cancel1');
            modal.classList.remove('show');
            
            body.style.overflow = 'auto';
        };

        function openModal1(){
            let modal = document.querySelector('.modal1');
            modal.classList.toggle('show');
            
  
            if (modal.classList.contains('show')) {
            body.style.overflow = 'hidden';
            } 
        };
        
        function QACancel2(){
            let modal = document.querySelector('.modal2');
            const btnCancel = document.getElementById('#QA_cancel2');
            modal.classList.remove('show');
            
            body.style.overflow = 'auto';
        };

        function openModal2(){
            let modal = document.querySelector('.modal2');
            modal.classList.toggle('show');
            
            $.ajax({
				url : 'selectQnaUpdate.me',
				data : {
					qnaNo : $('#qnaNo').text()
				},
				success : function(qna){
					console.log(qna)
					let value =  '<tr>'
	                           	+ '<th width="80">제목</th>'
	                           	+ '<td width="300"><input type="text" name="qnaTitle" class="qnaTitle-text"  maxlength="20"value="' + qna.qnaTitle + '"></td>'
	                    		+ '</tr>'
	                    		+ '<tr>'
                    			+ '<th>내용</th>'
                            	+ '<td width="300"><input type="text" name="qnaQ" class="qnaQ-text" value="'+ qna.qnaQ +'"</td>'
                            	+ '</tr>'
                            	+ '<input type="hidden" name="qnaNo" value="' + qna.qnaNo + '">'
                    $('.type03').html(value);    		
				},
				error:function(){
					console.log('실패')
				}
			})
			
 
        };
        
        // 1:1 문의 상세보기
        function QACancel3(){
            let modal = document.querySelector('.modal3');
            const btnCancel = document.getElementById('#QA_cancel3');
            modal.classList.remove('show');
            
            body.style.overflow = 'auto';
        };

        function openModal3(){
            let modal = document.querySelector('.modal3');
            modal.classList.toggle('show');
            
  
            if (modal.classList.contains('show')) {
            body.style.overflow = 'hidden';
            } 
        };

       
        
       
        
        /*

  
        function QACancel(num){
            let modal = document.querySelector('.modal'+ num);
            const btnCancel = document.getElementById('#QA_cancel'+ num);
            modal.classList.remove('show');
            
            body.style.overflow = 'auto';
        };

        function openModal(num){
            let modal = document.querySelector('.modal'+num);
            modal.classList.toggle('show');
            
  
            if (modal.classList.contains('show')) {
            body.style.overflow = 'hidden';
            } 
        };
        
        */

       /*  let modal = document.querySelector('.modal');
            modal.addEventListener('click', (event) => {
            if (event.target === modal) {
                modal.classList.toggle('show');

                
                }
            }
        }); */

      </script>
      <script>
      $(function(){
  		$('#boardList>tbody>tr').click(function(){
  			//location.href = 'detail.bo?bno=' + $(this).children('.bno').text() // .eq(0)  // this현재 내가 선택한
  					
  					
  					
  					
  		})
  		
  		
  	})
      </script>

</body>
</html>

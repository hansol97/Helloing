<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="resources/css/adminPage.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>문의</title>
<style>
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
  #keyword_content{
    font-family: 'S-CoreDream-3Light';
    width:400px;
    height:200px;
    resize: none;
  }

  #keyword_input{
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
                            <form id="searchForm" action="" method="get">
                                <td>
                                    <select class="admin-search_form" name="" id="">
                                        <option value="">회원아이디</option>
                                        <option value="">구분</option>
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
                            <td><button onclick="openModal(2);" class="admin-grey">수정</button></td>
                            <td><button class="admin-grey">삭제</button></td>
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
                                <th width="80">문의번호</th>
                                <th width="80">구분</th>
                                <th width="120">카테고리</th>
                                <th width="250">제목</th>
                                <th width="110">회원아이디</th>
                                <th width="120">등록일</th>
                                <th width="80">답변여부</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td onclick="event.stopPropagation()">
                                    <input name="cbox" type="checkbox" value="">
                                </td>
                                <td>2</td>
                                <td>일반회원</td>
                                <td>상품관련</td>
                                <td>문의합니다</td>
                                <td>user01</td>
                                <td>2022.12.25</td>
                                <td>완료</td>
                            </tr>
                            <tr>
                                <td onclick="event.stopPropagation()">
                                    <input name="cbox" type="checkbox" value="">
                                </td>
                                <td>2</td>
                                <td>일반회원</td>
                                <td>상품관련</td>
                                <td>문의합니다</td>
                                <td>user01</td>
                                <td>2022.12.25</td>
                                <td>완료</td>
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

    <div id="keword_enroll_page" class="modal modal1">
        <div class="modal_body">
            <div>
                <div class="modal-title">
                    <span>키워드 등록</span>
                </div>
                <div align="center">
                    <br>
                    <form action="#">
                        <table>
                            <tr>
                                <td>
                                    <input id="keyword_input" type="text" placeholder="키워드명을 입력하세요" required>
                                </td>
                            </tr>
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr>
                                <td>
                                    <textarea name="" id="keyword_content" placeholder="키워드 답변내용을 입력하세요" required></textarea>
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
    </div>

    <div id="keword_enroll_page" class="modal modal2">
        <div class="modal_body">
            <div>
                <div class="modal-title">
                    <span>키워드 수정</span>
                </div>
                <div align="center">
                    <br>
                    <form action="#">
                        <table>
                            <tr>
                                <td>
                                    <input id="keyword_input" type="text" placeholder="키워드명을 입력하세요" value="안녕" required>
                                </td>
                            </tr>
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr>
                                <td>
                                    <textarea name="" id="keyword_content" placeholder="키워드 답변내용을 입력하세요" required>안녕하세요</textarea>
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
        

        function keywordCancel(num){
            let modal = document.querySelector('.modal'+ num);
            const btnCancel = document.getElementById('#keyword_cancel'+ num);
            modal.classList.remove('show');
        };

        function openModal(num){
            let modal = document.querySelector('.modal'+num);
            modal.classList.toggle('show');
            console.log(modal);
            
  
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
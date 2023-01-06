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
            <br>
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
                                        <option value="">키워드명</option>
                                        <option value="">내용</option>
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
                            <td><button class="admin-grey">등록</button></td>
                            <td><button class="admin-grey">삭제</button></td>
                            <td><button class="admin-grey">수정</button></td>
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
                                <th width="200">키워드명</th>
                                <th width="700">키워드 답변용</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td onclick="event.stopPropagation()">
                                    <input name="cbox" type="checkbox" value="">
                                </td>
                                <td>2</td>
                                <td>제주도 여행</td>
                            </tr>
                            <tr>
                                <tr>
                                    <td onclick="event.stopPropagation()">
                                        <input name="cbox" type="checkbox" value="">
                                    </td>
                                    <td>2</td>
                                    <td>제주도 여행</td>
                                </tr>
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

    <div id="keword_enroll_page" class="modal">
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
                                    <input id="keyword_input" type="text" placeholder="키워드명을 입력하세요">
                                </td>
                            </tr>
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr>
                                <td>
                                    <textarea name="" id="keyword_content" placeholder="키워드 답변내용을 입력하세요"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td><br></td>
                            </tr>
                        </table>
    
                        <div id="keyword_enroll_btn">
                            <button type="submit">등록</button>
                            <button id="keyword_cancel" type="button" onclick="keywordCancel();">취소</button>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>

    <div id="keword_updat_page" class="modal">
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
                                    <input id="keyword_input" type="text" placeholder="키워드명을 입력하세요">
                                </td>
                            </tr>
                            <tr>
                                <td><br></td>
                            </tr>
                            <tr>
                                <td>
                                    <textarea name="" id="keyword_content" placeholder="키워드 답변내용을 입력하세요"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td><br></td>
                            </tr>
                        </table>
    
                        <div id="keyword_enroll_btn">
                            <button type="submit">등록</button>
                            <button id="keyword_cancel" type="button" onclick="keywordCancel();">취소</button>
                        </div>
                    </form>
                    
                </div>
            </div>
        </div>
    </div>
    <button class="btn-open-popup">Modal 띄우기</button>

    <script>
        const body = document.querySelector('body');

        if()
        const modal = document.querySelector('.modal');
        const btnOpenPopup = document.querySelector('.btn-open-popup');

        function keywordCancel(){
            const btnCancel = document.getElementsByClassName('.keyword_cancel');
            modal.classList.remove('show');
        };

        btnOpenPopup.addEventListener('click', () => {
          modal.classList.toggle('show');
  
          if (modal.classList.contains('show')) {
            body.style.overflow = 'hidden';
          }
        });
  
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
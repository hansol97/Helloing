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

    .admin-search_form{
        width:120px;
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

    width: 600px;
    height: 300px;

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

  /* 신고 모달창 설정 */
  #report_table{
    width:520px;
  }

  #report_table th{
    width:130px;
  }

  #report_table.type02 td{
    text-align:left;
  }

  #report_confirm_btn button{
    margin:20px;
    margin-bottom: 0px;
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
                <tr id="admin-menu2">
                    <td><p><a href="boardList.ad">게시물 조회</a></p></td>
                    <td width="200"></td>
                    <td><p><a   href="replyList.ad">댓글 조회</a></p></td>
                    <td width="200"></td>
                    <td><p><a id="admin-page_mark" href="reportList.ad">신고게시물 조회</a></p></td>
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
                                        <option value="">작성자 아이디</option>
                                        <option value="">신고자 아이디</option>
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
                            <td width="555">
                                
                            </td>
                            
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
                                <th width="90">글번호</th>
                                <th width="150">신고코드</th>
                                <th width="140">작성자 아이디</th>
                                <th width="140">신고자 아이디</th>
                                <th width="140">신고일자</th>
                                <th width="70">내용</th>
                                <th width="100">처리상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td onclick="event.stopPropagation()">
                                    <input name="cbox" type="checkbox" value="">
                                </td>
                                <td>10</td>
                                <td>액티비티 리뷰</td>
                                <td>user01</td>
                                <td>user04</td>
                                <td>2023.01.02</td>
                                <td><button>+</button></td>
                                <td>미처리</td>
                            </tr>
                            <tr>
                                <td onclick="event.stopPropagation()">
                                    <input name="cbox" type="checkbox" value="">
                                </td>
                                <td>10</td>
                                <td>액티비티 리뷰</td>
                                <td>user01</td>
                                <td>user04</td>
                                <td>2023.01.02</td>
                                <td><button>+</button></td>
                                <td>미처리</td>
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

    <div class="modal">
        <div class="modal_body">
            <div>
                <div class="modal-title">
                    <span>신고 내용</span>
                </div>
                <div align="center">
                    <form action="">
                        <table id="report_table" class="type02">
                            <tr>
                                <th>신고사유</th>
                                <td>도배</td>
                            </tr>
                            <tr>
                                <th>게시글 내용</th>
                                <td>ㅇㅇㅇㅇ</td>
                            </tr>
                            <tr>
                                <th>추가 사유</th>
                                <td>신고합니다</td>
                            </tr>
                        </table>
    
                        <div id="report_confirm_btn">
                            <button type="submit">삭제</button>
                            <button type="submit">미삭제</button>
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
        const modal = document.querySelector('.modal');
        const btnOpenPopup = document.querySelector('.btn-open-popup');
  
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
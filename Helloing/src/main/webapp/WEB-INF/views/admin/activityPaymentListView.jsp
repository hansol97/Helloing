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

    width: 600px;
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
    margin-left:40px;
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
                            <form id="searchForm" action="" method="get">
                                <td>
                                    <div class="text">
                                        <input type="text" placeholder="회원아이디 입력" class="admin-input_form" name="keyword">
                                    </div>        
                                </td>
                                <td class="td_search_button">
                                    &nbsp;<button type="submit" class="admin-search_button">검색</button>
                                </td>
                            </form>
                            <td width="600">
                                
                            </td>
                        </tr>
                    </table>
                </tr>
                <br>
                <tr>
                    <table id="boardList" class="type02" align="center">
                        <thead>
                            <tr>
                                <th width="110">회원아이디</th>
                                <th width="350">액티비티명</th>
                                <th width="120">사업자명</th>
                                <th width="120">총 지불금액</th>
                                <th width="110">결제일자</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>user02</td>
                                <td>[전남 목포] 목포 해상케이블카 탑승권</td>
                                <td>사업자1</td>
                                <td>69,700원</td>
                                <td>2023.01.01</td>
                            </tr>
                            <tr>
                                <td>user02</td>
                                <td>[전남 목포] 목포 해상케이블카 탑승권</td>
                                <td>사업자1</td>
                                <td>69,700원</td>
                                <td>2023.01.01</td>
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
                    <span>액티비티 상세정보</span>
                </div>
                <div align="center">
                    <table class="type02">
                        <thead>
                            <th>티켓번호</th>
                            <th>티켓명</th>
                            <th>수량</th>
                            <th>가격</th>
                            <th>유효기간</th>
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
                            </tr><tr>
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
                            <tr>
                                <td>25</td>
                                <td>주중 종일권</td>
                                <td>2</td>
                                <td>43,800원</td>
                                <td>2022.12.24 ~ 2023.02.27</td>
                            </tr><tr>
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
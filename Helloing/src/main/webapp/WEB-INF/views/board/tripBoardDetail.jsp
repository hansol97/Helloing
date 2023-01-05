<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   table {
     border-collapse: separate;
     border-spacing: 0;
     width: 100%;
     margin : auto;
   }
   th,
   td {
     padding: 6px 15px;
   }
   th {
     background: #42444e;
     color: #fff;
     text-align: left;
   }
   tr:first-child th:first-child {
     border-top-left-radius: 6px;
   }
   tr:first-child th:last-child {
     border-top-right-radius: 6px;
   }
   td {
     border-right: 1px solid #c6c9cc;
     border-bottom: 1px solid #c6c9cc;
   }
   td:first-child {
     border-left: 1px solid #c6c9cc;
   }
   tr:nth-child(even) td {
     background: #eaeaed;
   }
   tr:last-child td:first-child {
     border-bottom-left-radius: 6px;
   }
   tr:last-child td:last-child {
     border-bottom-right-radius: 6px;
   }
	.fontfont > pre {
		font-size:50px;
		font-weight:500px;
	}
	
	.thumbnail{
		width:400px;
		height:200px;
	}
	.size{
		font-size:30px;
		font-weight:300px;
	}
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar_user.jsp" />
	
		<br><br>
							
		<div align="center" class=fontfont>
			<pre>리뷰 상세조회</pre>
		
			<br><br><br>
				<div class="size">제목 : <!-- 여기 제목 --></div>
				<br><br>
				
	            <div class="thumbnail" align="center">
	                	여기 사진 EL구문~~~ <img src="" onclick="window.open(this.src)">
	            </div>
				
				<div class="size">내용</div>
				<br><br>
				<!-- 여기 내용나올공간 -->
				<div class="contentDetail"></div>
				
	        <c:if test="<!-- 내가 본 게시판이 내꺼일경우~ -->">
		        <div align="center">
		            <button type="button" class="btn btn-primary" onclick="updateTripReview();">수정하기</button>
		            <button type="button" class="btn btn-danger" onclick="deleteTripReview();">삭제하기</button>
		        </div>
	        </c:if>
		</div>
		
		<script>
			function updateTripReview(){
				location.href = "updateTripBoard";
			}
			function deleteTripReview(){
				location.href = "deleteTripBoard";
			}
		</script>	
	
	
</body>
</html>
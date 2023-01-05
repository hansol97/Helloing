<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>enrollFormTripBoard</title>
    
    <style>
        .reviewContent {
            width:1100px;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            height:800px;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
		.innerOuter > pre {
			font-size:50px;
			font-weight:500px;
		}
		.font {
			font-size:30px;
			font-weight:350px;
		}		
	#title {
		width:800px;
		height:30px;
	}
	.inputReview{
		width:800px;
		height:200px;
	}
	.ReviewButton1 {
		width:150px;
		height:50px;
		background-color:lightblue;

	}
	.ReviewButton2 {
		width:150px;
		height:50px;
		background-color:orange;
	}
    </style>
</head>
<body>

	<jsp:include page="../common/menubar_user.jsp"/>
	
    <div class="reviewContent">
        <br><br>
        <div class="innerOuter">
            <pre align="center">여행리뷰 작성하기</pre>
            <hr><br>

            <form id="insertTripBoard" method="post" action="insertTripBoard" enctype="multipart/form-data">
				<div align="center">
                    <div>
                        <th><label for="title" class="font">제목</label></th><br>
                    </div>
                        <td><input type="text" id="title" class="inputTitle" name="boardTitle" required></td>
                        
                    <tr>
                        <td><input type="hidden" id="writer" class="form-control" value="${ loginUser.userId }" name="boardWriter" readonly></td>
                    </tr>
                    
                    <br><br><br><br>
                    
                    <div>
                        <div><label for="content" class="font">내용</label></div><br>
                        <td><textarea id="content" class="inputReview" rows="10" style="resize:none;" name="boardContent" required></textarea></td>
                    </div>
                    
                    <br><br>
                    
                    <tr>
                        <th><label for="upfile" class="font">첨부파일</label></th><br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <td><input type="file" id="upfile" class="form-control-file border" name="upfile"></td>
                    </tr>
                	
					<br><br><br><br>	
					
	                <div align="center">
	                    <button type="submit" class="ReviewButton1">등록하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                    <button type="reset" class="ReviewButton2">취소하기</button>
	                </div>
                </div>
            </form>
        </div>
        <br><br>

    </div>

</body>
</html>
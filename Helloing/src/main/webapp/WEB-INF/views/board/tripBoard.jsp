<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardEnrollForm</title>
<style>
.middle-content{
    display: flex;
    justify-content: space-between;
}
.side-bar{
    width: 280px;
    padding: 0px 5px;
}
.main{
    width: 1100px;
}

/* 메인 컨텐츠 */
.radio-sort{
    text-align: right;
    margin-bottom: 15px;
}
.radio-sort>input[type=radio]{
    opacity: 0;
}
.radio-sort>input[type=radio]>label{
    padding: 5px 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}
.radio-sort>input[type=radio]:checked+label{
    font-weight: bold;
    color: #053E99;
}
.product-list{
    display: flex;
    flex-wrap: wrap;
}
.productbox{
    width: 255px;
    height: 400px;
    margin-bottom: 20px;
    margin-right: 10px;
}
.productbox>div{
    padding: 10px;
}
.productbox img{
    border-radius: 5px;
}
.accommName{
    font-size: 22px;
    font-weight: bold;
}
/* 메인 컨텐츠 끝 */



hr{
    margin: 20px 0px;
}
.inner h1{
	font-size: 30px;
	font-weight: bold;
	margin: 0px 0px 30px 0px;
}
.inner h4{
	font-size: 18px;
	font-weight: bold;
	margin-left: 10px;
}

#enrollTripBoard{
	width : 100px;
	height : 30px;
	background-color : lightblue;
}
</style>
</head>
<body>

	<jsp:include page="../common/menubar_user.jsp"/> <!-- 헤더를 넣으니까 검색창이 헤더 밑으로 간다... relative, absolute 속성 때문일까? -->
	
	<div style="height: 70px;"></div>
        
        
        <div class="middle-content" align="center">
            <div class="inner" align="center">
            
            <form action="enrollTripBoard" method="post">
        		<button type="submit" id="enrollTripBoard">리뷰작성</button> <!-- 로그인 된 상태에서 글 작성 보여지게 -->
        	</form>
        	
                <br><br>
                <div class="product-list">
					
                    <div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
                    	<div class="bno">  </div>
	                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
	                        <div>
	                            <p><span>OO팬션 마음에 들어요</span><br> <!-- N 글자 넘어가면 ... 만들기 -->
	                            등록일 : 2023.01.01</p>
	                        </div>
                    </div>
                    <div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
                    	<div class="bno">  </div>
	                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
	                        <div>
	                            <p><span>OO팬션 마음에 들어요</span><br> <!-- N 글자 넘어가면 ... 만들기 -->
	                            등록일 : 2023.01.01</p>
	                        </div>
                    </div>	                    					
                    <div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
                    	<div class="bno">  </div>
	                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
	                        <div>
	                            <p><span>OO팬션 마음에 들어요</span><br> <!-- N 글자 넘어가면 ... 만들기 -->
	                            등록일 : 2023.01.01</p>
	                        </div>
                    </div>	
                    <div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
                    	<div class="bno">  </div>
	                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
	                        <div>
	                            <p><span>OO팬션 마음에 들어요</span><br> <!-- N 글자 넘어가면 ... 만들기 -->
	                            등록일 : 2023.01.01</p>
	                        </div>
                    </div>	                    
                    <div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
                    	<div class="bno">  </div>
	                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
	                        <div>
	                            <p><span>OO팬션 마음에 들어요</span><br> <!-- N 글자 넘어가면 ... 만들기 -->
	                            등록일 : 2023.01.01</p>
	                        </div>
                    </div>	                    
                    <div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
                    	<div class="bno">  </div>
	                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
	                        <div>
	                            <p><span>OO팬션 마음에 들어요</span><br> <!-- N 글자 넘어가면 ... 만들기 -->
	                            등록일 : 2023.01.01</p>
	                        </div>
                    </div>	                    
                    <div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
                    	<div class="bno">  </div>
	                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
	                        <div>
	                            <p><span>OO팬션 마음에 들어요</span><br> <!-- N 글자 넘어가면 ... 만들기 -->
	                            등록일 : 2023.01.01</p>
	                        </div>
                    </div>	                    
                    <div class="productbox"> <!-- for문 사용해서 계속 뿌려줄거임 페이징바 X -->
                    	<div class="bno">  </div>
	                        <img src="/helloing/resources/img/logo_outline.png" width="250" height="250"><br>
	                        <div>
	                            <p><span>OO팬션 마음에 들어요</span><br> <!-- N 글자 넘어가면 ... 만들기 -->
	                            등록일 : 2023.01.01</p>
	                        </div>
                    </div>	                    
                    
                    	
                    					                                                                                                 
                </div>
            </div>
        </div>
	</div>
	
	<script>
		$(function(){
			$('.productbox').click(function(){
				location.href = 'tripBoardDetail?bno=' + $(this).children('.bno').text();
			});
		});
	</script>
	
	
	
</body>
</html>
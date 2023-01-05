<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 폼</title>
<style>


    #findIdForm_wrap{

        display: inline-block;
        width: 800px;
        height: 500px;
        margin-top: 150px;
        margin-left: 600px;

    }


    #findIdForm_wrap>.container{

        width: 800px;
        height: 350px;
        text-align: center;

    }

    #findIdForm_wrap>.container button{
        border: none;
        width: 125px;
    }

    #findIdForm_wrap>.container input{
        margin-top: 10px;
        height: 30px;
    }
 
</style>
</head>
<body>
	<div class="innor">
		
		    <div id="findIdForm_wrap">

        <div class="container">
            
            <br><br><br>
            <h2>회원정보 찾기</h2>      
            <br><br><br>   
            
            <form action="=findId.me" method="post">

                <div id="Findform">
                    <button type="button" class="btn btn-outline-secondary">아이디 찾기</button>
                    <button type="button" class="btn btn-outline-secondary" onclick="findPwd();">비밀번호 찾기</button><br><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;이름 : <input type="text" placeholder="홍길동" name="findName"><br>
                    이메일 : <input type="text" placeholder="ddd" name="findEmail"><br><br>
                    <button class="btn btn-outline-success" type="submit" style="width: 250px;">확인</button>
                </div>

            </form>
            <script>
						function enrollPage(){
						
							location.href = "findIdForm.me"
		
						}
					</script>
        </div>

</div>
	
	
	
	
	</div>	

</body>
</html>
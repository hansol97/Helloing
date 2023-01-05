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
		<div class="findId-form">
			<form action="findId.me" method="post">
				<label for="memId"> 아이디 : </label>        
                    <input type="text" class="findId" id="memId" placeholder="아이디" name="memId" required>
			
			
			
			
			</form>
		
		
		</div>
	

        

	
	
	
	
	</div>	

</body>
</html>
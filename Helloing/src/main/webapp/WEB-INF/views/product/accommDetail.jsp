<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helloing</title>

<style>
	.inner div {
		border: 1px solid black;
	}

	.middle-content {
		display: flex;
		justify-content: space-between;
	}

	.side-bar {
		width: 280px;
		padding: 0px 5px;
	}

	.main {
		width: 800px;
	}

/* 사이드바 */
.accommselectbox{
	border: 1px solid gray;
	text-align: center;
	padding: 10px;
}
.accommselectbox button{
	width: 250px;
	height: 50px;
	font-size: 18px;
	font-weight: bold;
	background-color: #053E99;
	color: white;
	border: 0;
	border-radius: 3px;
	margin-top: 20px;
}
/* 사이드바 끝 */

</style>

</head>
<body>

	<jsp:include page="../common/menubar_user.jsp"/>
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
		<div class="middle-content">
			<div class="main">
				ddd
			</div>

			<div class="side-bar">
				<div class="accommselectbox">
					<p>1박 <span>65,000원 ~</span></p>
					<button>객실 선택하기</button>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>
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
				ddd
			</div>
		</div>
	</div>
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.productbox{
    border: 1px solid rgb(154, 154, 154);
    height: 320px;
    width: 240px;
    margin-top: 10px;
    margin-right: 30px;
    margin-bottom: 10px;
}
.productbox p{ margin: 0px 10px; padding: 7px; }

.inner h3{ font-size: 25px; font-weight: bold; }
</style>

</head>
<body>
	<jsp:include page="common/menubar_user.jsp"/>
	
	<div style="height: 70px;"></div>
	
	<div class="inner">
		<h3>숙소</h3>
		<div class="accomm"> 
	        <c:forEach items="${ acList }" var="acc">
	        	<c:if test="${ ac.category == 'hotel' }">
	        		<div class="productbox">
		            	<input type="hidden" name="accommNo" value="${ ac.accommNo }">
		                <img src="${ ac.filePath }" width="240" height="200"><br>
		                <p>${ ac.category }<br>
			                <span class="accommName">${ ac.accommName }</span><br>
			               	 ⭐ ${ ac.avg } (${ ac.reviewCount })<br>
			                ${ ac.rowPrice }원 ~</p>
		            </div>
	        	</c:if>
	        </c:forEach>
        </div>
        
        <h3>액티비티</h3>
        <div class="hot" id="hot-ticket"> 
        	<c:forEach items="${ actList }" var="a">
        		<div class="productbox">
                    <input type="hidden" name="activityNo" value="${ a.activityNo }">
	                <img src="${ a.filePath }" width="240" height="200">
	                <p><span class="activityName">${ a.activityName }</span><br>
	                    	⭐⭐⭐⭐⭐ ${ a.reviewCount }<br>
	                    ${ a.rowPrice }원 ~
	                </p>
	            </div>
        	</c:forEach>
        </div>
	</div>
	
	<script>
		$(function(){
			loadAccomm();
		})
		
		function loadAccomm(){
			$.ajax({
				url : "hot.accomm",
				success : function(result){
					
				},
				error : function(){
					
				}
			})
		}
	
	</script>
</body>
</html>
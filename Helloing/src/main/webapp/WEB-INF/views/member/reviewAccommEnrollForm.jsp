<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성 페이지</title>
<style>
	/* 구조 관련 */
	.out{
		width : 1200px; 
		height : 100%;
		margin : auto;
	}
	.out .include{
		width : 300px;
		float : left;
	}
	#detail{
		width : 900px;
		float : left;
	}

	#detail h1{
		font-size: 30px;
		font-weight: 600;
	}

	#tag-area{
		height: 200px;
	}

	#detail a{
		font-size: 20px;
		font-weight: 300;
	}
	#detail a:hover{
		text-decoration:underline;
	}

	/* 후기작성란 */
	#content{
		height: 400px;
		border-radius: 30px;
	}
	#content h3{
		padding : 10px;
		text-align: center;
		font-size: 25px;
		font-weight:600;
	}


	/* 버튼 */
	#btn{
		padding-left: 300px;
	}
	#btn button{
		font-family: 'S-CoreDream-3Light';
		font-size: 15px;
		border: 0.1px solid darkgray;
		border-radius: 10px;
		width: 120px;
		height: 40px;
		background-color: snow;
	}
	#btn button:hover{
		background-color:#002ead;
		color: white;
    	transition: 0.7s;
	}

	/* 이미지 */
	#image{
		display:flex;
		padding: 10px;
	}
	#image img{
		padding: 20px;
		border:1px solid lightgray;
		border-radius: 10px;
		margin: 5px;
	}
	/* 별점 */
	 #star-area img{
        margin: 10px 10px; 
    }

    #star-area label{
        display: inline-block;
    }

    #star-area input[name=star] {
        display: none;
    }

	#content textarea[name=content]{
		border: 1px solid lightgray;
		border-radius: 10px;
		font-size: 15px;
		font-family: 'S-CoreDream-3Light';
		margin: 10px;
		padding: 10px;
	}
	#content span{
		margin-left: 10px;
	}

	/* 태그 */

	#tag-area h3{
		padding : 10px;
		text-align: center;
		font-size: 25px;
		font-weight:600;
	}

	#photo-area h3{
		padding : 10px;
		text-align: center;
		font-size: 25px;
		font-weight:600;
	}
	/* 이미지 */
	#root {
		width: 100%;
		margin: 0 auto;
		max-width: 800px;
		}

		.title {
		text-align: center;
		}

		.contents {
		display: flex;
		flex-direction: row;
		margin-top: 30px;
		}
		.contents .upload-box {
		width: 100%;
		margin-right: 30px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		}

		.contents .upload-box .drag-file {
		position: relative;
		width: 100%;
		height: 360px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		border: 3px dashed #dbdbdb;
		}
		.contents .upload-box .drag-file.highlight {
		border: 3px dashed red;
		}
		.contents .upload-box .drag-file .image {
		width: 40px;
		}
		.contents .upload-box .drag-file .message {
		margin-bottom: 0;
		}
		.contents .upload-box .drag-file .preview {
		display: none;
		position: absolute;
		left: 0;
		height: 0;
		width: 100%;
		height: 100%;
		}
		.contents .upload-box .file-label {
		margin-top: 30px;
		background-color: #5b975b;
		color: #fff;
		text-align: center;
		padding: 10px 0;
		width: 65%;
		border-radius: 6px;
		cursor: pointer;
		}
		.contents .upload-box .file {
		display: none;
		}

		@media (max-width: 700px) {
		.contents {
			display: flex;
			flex-direction: column;
			margin-top: 30px;
		}
		.contents .upload-box {
			width: 100%;
			box-sizing: border-box;
			margin-right: 0;
		}
		.contents .upload-box .drag-file {
			height: 150px;
		}
		.contents .files {
			width: 100%;
			box-sizing: border-box;
			margin-right: 0;
			overflow: initial;
		}
		}
		.tag-opt{
		    height: 50px;
		    width: 200px;
		    font-size: 16px;
		    border-radius: 10px;
		    border: 1px solid rgb(193 193 193);
		    font-family: 'S-CoreDream-3Light';
		    
		}
</style>
</head>
<body>
	
	<jsp:include page="../common/menubar_user.jsp"/>
	<br><br>

	<div class="out">
		<div class="include">
			<jsp:include page="../member/myPage.jsp"/>
		</div>
		
		<div id="detail">
		<br><br>
		<h1>리뷰 작성 페이지</h1><br>
		<form action="insertAccommReview.hj" method="post" enctype="multipart/form-data">
		<input type="hidden" name="orderNo" value="${orderNo}">
			<hr>
			<div id="star-area">
				<label for="rate1">
					<input type="radio" name="star" value="1" id="rate1" checked>
					<img src="/helloing/resources/img/star1.png" width="50" height="50" alt="">
				</label>

				<label for="rate2">
					<input type="radio" name="star" value="2" id="rate2">
					<img src="/helloing/resources/img/star2.png" width="50" height="50" alt="">
				</label>

				<label for="rate3">
					<input type="radio" name="star" value="3" id="rate3">
					<img src="/helloing/resources/img/star2.png" width="50" height="50" alt="">
				</label>

				<label for="rate4">
					<input type="radio" name="star" value="4" id="rate4">
					<img src="/helloing/resources/img/star2.png" width="50" height="50" alt="">
				</label>
				
				<label for="rate5">
					<input type="radio" name="star" value="5" id="rate5">
					<img src="/helloing/resources/img/star2.png" width="50" height="50" alt="">
				</label>
			</div>
			
			
			<div id="content">
				<h3>구체적으로 어떤 경험이었나요?</h3>
				<textarea name="reviewContent" id="text-area"cols="110px" rows="10px" placeholder="이용하기 전 알기 어려운 사실이나 꿀팁을 알려주세요." required></textarea>
				<span id="count">0</span> / 150
				
				<p>
					<br>
					* 상품과 무관한 내용이나 동일한 문자의 반복 등 부적합한 내용은 삭제될 수 있습니다.
					<br>
					* 후기 내용에 개인 정보가 노출되지 않도록 주의해주세요.
				</p>
			</div>

			<br>
			<hr>

			<div id="tag-area">
				<h3>어떤 점이 특히 좋았나요?</h3>
				<br>
				
				 <select name="tagArr" class="tag-opt" required>
					<option value="위치가 찾기 쉬워요">🧭위치가 찾기 쉬워요</option>
					<option value="관광지와 가까워요">🏝️관광지와 가까워요</option>
					<option value="방문하기 편해요">🚗방문하기 편해요</option>
					<option value="즐길 거리가 많아요">🗽즐길 거리가 많아요</option>
					<option value="관리가 잘 되어있어요">🧹관리가 잘 되어있어요</option>
					<option value="사진과 동일해요">🖼️사진과 동일해요</option>
					<option value="친절해요">😊친절해요</option>
					<option value="전문적이에요">💻전문적이에요</option>
					<option value="응답이 빨라요">✉️응답이 빨라요</option>
				</select>
                    <span id="tag-zone"></span>
                    <a id="tag-add" style="cursor:pointer;"> ➕ </a>
                    <a id="tag-minus" style="cursor:pointer;"> ➖ </a>
			</div>

			<hr>
			<div id="photo-area">
				<h3>사진을 공유해주세요.</h3>
				<div id="root">
					<hr>
					<div class="contents">
					<div class="upload-box">
						<div id="drop-file" class="drag-file">
						<img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
						<p class="message">사진을 끌어당기거나, 선택해주세요.</p>
						<img src="" alt="미리보기 이미지" class="preview">
						</div>
						<label class="file-label" for="chooseFile">사진 선택하기</label>
						<input name="upfile" class="file form-control-file border" id="chooseFile" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif" required>
					</div>
					</div>
				</div>
			</div>

			<br>
			<div id="btn">
				<button id="list_btn">목록으로</button>
				<button type="submit" id="cancel_btn">등록</button>
			</div>	
		</form>
		</div>
	</div>

<script>
//리뷰 별 
	$('input[name=star]').click(function(){
	
	    var $num = $(this).val();
	
	    $('input[name=star]').each(function(){
	
	        if($(this).val() <= $num){
	            $(this).next().attr('src','/helloing/resources/img/star1.png');
	        } else {
	            $(this).next().attr('src','/helloing/resources/img/star2.png');
	        }
	    })
	});

//글자 수
	$('#text-area').keyup(function(){
           $('#count').text($(this).val().length);

       });
//태그
       $('#tag-add').click(function(){
           if($('.tag-opt').length <= 2){
               $('#tag-zone').append($('.tag-opt').first().clone(true));
           } else {
               alert('최대 입력 수를 초과하셨습니다.');
           }
       });

       $('#tag-minus').click(function(){
               if($('.tag-opt').length > 1){
                   $('.tag-opt').last().remove();
               } else {
                   alert('최대 삭제수를 초과하셨습니다.');
              }
       });  

	//사진업로드
	function DropFile(dropAreaId, fileListId) {
	let dropArea = document.getElementById(dropAreaId);
	let fileList = document.getElementById(fileListId);

	function preventDefaults(e) {
		e.preventDefault();
		e.stopPropagation();
	}

	function highlight(e) {
		preventDefaults(e);
		dropArea.classList.add("highlight");
	}

	function unhighlight(e) {
		preventDefaults(e);
		dropArea.classList.remove("highlight");
	}

	function handleDrop(e) {
		unhighlight(e);
		let dt = e.dataTransfer;
		let files = dt.files;

		handleFiles(files);

		const fileList = document.getElementById(fileListId);
		if (fileList) {
		fileList.scrollTo({ top: fileList.scrollHeight });
		}
	}

	function handleFiles(files) {
		files = [...files];
		// files.forEach(uploadFile);
		files.forEach(previewFile);
	}

	function previewFile(file) {
		console.log(file);
		renderFile(file);
	}

	function renderFile(file) {
		let reader = new FileReader();
		reader.readAsDataURL(file);
		reader.onloadend = function () {
		let img = dropArea.getElementsByClassName("preview")[0];
		img.src = reader.result;
		img.style.display = "block";
		};
	}

	dropArea.addEventListener("dragenter", highlight, false);
	dropArea.addEventListener("dragover", highlight, false);
	dropArea.addEventListener("dragleave", unhighlight, false);
	dropArea.addEventListener("drop", handleDrop, false);

	return {
		handleFiles
	};
	}

	const dropFile = new DropFile("drop-file", "files");

	$('#list_btn').clilk(function(){
		location.href="accommBook.hj";
	})
</script>

</body>
</html>
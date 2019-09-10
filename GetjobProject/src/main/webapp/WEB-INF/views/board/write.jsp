<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Naver SmartEditor -->
<!-- <script type="text/javascript" -->
<!--  src="/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script> -->
<!-- include summernote css/js -->

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<script type="text/javascript">


$(document).ready(function() {
	$("#btnWrite").click(function() {
			$("form").submit();
	});
	
// 	$("#title").focus();

	$("#btnCancel").click(function() {
		history.go(-1);
		console.log('취소버튼');
	});
	
    $('#summernote').summernote({
        height: 300,          // 기본 높이값
         minHeight: null,      // 최소 높이값(null은 제한 없음)
         maxHeight: null,      // 최대 높이값(null은 제한 없음)
         focus: true,          // 페이지가 열릴때 포커스를 지정함
         lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
     });

});

</script>

<div class="container">
<h1>글쓰기 페이지</h1>
<hr>

<form action="/board/write" method="post">
	<div class="form-group">
		<label for="writer">작성자</label>
		<input type="text" id="writer"  value="${loginnick }" readonly="readonly" class="form-control"/>
	</div>
	<div class="form-group">
		<label for="title">제목</label>
		<input type="text" id="title" name="title"  class="form-control" /> <!-- name dto랑 똑같이 -->
	</div>
	<div class="form-group">
		<label for="content">본문</label>
		<textarea rows="10" style="width:100%" id="summernote" name="content"></textarea>
	</div>

	<div class="text-center">
		<button type="button" class="btn btn-primary" id="btnWrite">작성</button>
		<button type="button" class="btn btn-danger" id="btnCancel">취소</button>
	</div>
	
</form>

</div>




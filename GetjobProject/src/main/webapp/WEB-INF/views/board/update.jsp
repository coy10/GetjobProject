<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Naver SmartEditor -->
<script type="text/javascript"
 src="/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		$("form").submit();
	});
	
	$("#title").focus();

	$("#cancel").click(function() {
		history.back(-1);
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

</head>
<body>

<div class="container">
<h1>글쓰기 페이지</h1>
<hr>

<form action="/board/update" method="post">
	<input type="hidden" name="board_no" value="${view.board_no }" />

	<div class="form-group">
		<label for="writer">작성자</label>
		<input type="text" id="writer" 
			value="${view.writer_nick }" readonly="readonly"
			class="form-control"/>
	</div>
	<div class="form-group">
		<label for="title">제목</label>
		<input type="text" id="title" name="title" 
			class="form-control" value="${view.title }"/>
	</div>
	<div class="form-group">
		<label for="content">본문</label>
		<textarea rows="10" style="width:100%" id="summernote" name="content">${view.content }</textarea>
	</div>

	<div class="text-center">
		<button type="button" class="btn btn-primary" id="btnUpdate">수정</button>
		<input type="reset" id="cancel"
			class="btn btn-danger" value="취소"/>
	</div>
	
</form>

</div>

<!-- <textarea> 태그 아래쪽에 스마트에디터 초기화코드 삽입 -->
<script type="text/javascript">
</script>

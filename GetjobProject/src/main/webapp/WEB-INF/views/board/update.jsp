<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Naver SmartEditor -->
<script type="text/javascript"
 src="/resources/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script type="text/javascript">
//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

    try {
        elClickedObj.form.submit();
    } catch(e) {}
}

$(document).ready(function() {
	$("#btnUpdate").click(function() {
		submitContents($(this));
	});
	
	$("#title").focus();

	$("#cancel").click(function() {
		history.back(-1);
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
		<textarea rows="10" style="width:100%" id="content" name="content">${view.content }</textarea>
	</div>

	<div class="text-center">
		<button class="btn btn-primary" id="btnUpdate">수정</button>
		<input type="reset" id="cancel"
			class="btn btn-danger" value="취소"/>
	</div>
	
</form>

</div>

<!-- <textarea> 태그 아래쪽에 스마트에디터 초기화코드 삽입 -->
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",
    fCreator: "createSEditor2",
    htParams : {
    	bUseToolbar: true, // 툴바 사용여부
    	bUseVerticalResizer: false, //입력창 크기 조절바
    	bUseModeChanger: true //모드 탭
    }
});
</script>

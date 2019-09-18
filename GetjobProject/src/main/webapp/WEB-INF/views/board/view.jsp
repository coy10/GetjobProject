<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(document).ready(function() {
	// 추천버튼 초기화
	if(${recommend.recommend_cnt == true}) { 
		$("#btnRecommend")
			.toggleClass("btn-danger")
			.text("추천 취소");
	} else {
		$("#btnRecommend")
			.toggleClass("btn-primary")
			.text("추천");
	}
	
	// 추천 수행
	$("#btnRecommend").click(function() {
		$.ajax({
			type: "get"
			, url: "/board/recommend"
			, dataType: "json"
			, data: {
				writer_id: '${sessionScope.loginid}'
				, board_no: '${view.board_no}'
			}
			, success: function(response) {
				console.log(response);
				if(response.recommend_cnt == true) {
					$("#btnRecommend")
						.text("추천 취소")
						.toggleClass("btn-primary")
						.toggleClass("btn-danger");
				} else {
					$("#btnRecommend")
						.text("추천")
						.toggleClass("btn-danger")
						.toggleClass("btn-primary");
				}
				$("#recommend")
				.text(response.total);
// 				$("#recommend").text(data.recommend);
			}
			, error: function(e) {
				console.log(e.responseText);
			}
		});
	});	
	
	// 댓글 입력
	$("#btnCommInsert").click(function() {
		// 게시글 번호.... ${board.board_no }
// 		console.log($("#commentWriter").val());
// 		console.log($("#commentContent").val());
		
		
		$form = $("<form>").attr({
			action: "/board/insertComment",
			method: "post"
		}).append(
			$("<input>").attr({
				type:"hidden",
				name:"board_no",
				value:"${view.board_no }"
			})
		).append(
			$("<input>").attr({
				type:"hidden",
				name:"writer_nick",
				value:"${sessionScope.loginnick }"
			})
		).append(
			$("<textarea>")
				.attr("name", "content")
				.css("display", "none")
				.text($("#commentContent").val())
		);
		$(document.body).append($form);
		$form.submit();
	});
	
});


// 댓글 삭제
function deleteComment(comment_no) {
	$.ajax({
		type: "post"
		, url: "/board/deleteComment"
		, dataType: "json"
		, data: {
			comment_no: comment_no
		}
		, success: function(response){
			console.log(response);
			
			$("[data-commentno='"+response.comment_no+"']").remove();
			
		}
	});
}

function updateComment(comment_no,content,board_no) {
	$("#comment"+comment_no).html("<form id='updateCommentForm' action='/board/updateComment' method='post'><textarea name='content'>"+content+"</textarea><input type='hidden' name='board_no' value='${view.board_no}'/><input type='hidden' name='comment_no' value='"+comment_no+"'/></form>")
	$("#btnUpdate").hide();
	$("#btnUpdatecancel").show();
	$("#comment"+comment_no).append("<input type='button' class='btn btn-default' value='수정완료' onclick='commentUpdate();'><input type='button' class='btn btn-default' value='수정취소' onclick='cancelUpdate("+board_no+");'> ")
}

function commentUpdate(){
	
	$("#updateCommentForm").submit();
}

function cancelUpdate(board_no){
	
	location.replace("http://localhost:8088/board/view?board_no="+board_no+"");
}

</script>
<style type="text/css">
.commentli{
	list-style : none;
	padding-bottom : 20px;
}
</style>



</head>
<body>
<div class="container">
<div>
<h1 class="pull-left">게시글 상세보기</h1>
<button id="btnRecommend" class="btn pull-right" type="button">추천</button>
</div>
<div class="clearfix"></div>
<hr>

<!-- 상세보기 영역 -->
<div>
글번호 : ${view.board_no }<br>
글제목 : ${view.title }<br>
아이디 : ${view.writer_id }<br>
이름 : ${view.writer_nick }<br>
본문 : ${view.content }<br>
조회수 : ${view.hit }<br>
추천수 : <span id="recommend">${recommend.total }</span><br>
작성일 : <fmt:formatDate value="${view.write_date }"
				pattern="yy-MM-dd HH:mm:ss" /><br>
</div>	<!-- 상세보기 영역 end -->

<!-- 버튼 영역 -->
<div class="text-center">
	<a href="/board/list"><button class="btn btn-default">목록</button></a>
	<c:if test="${loginid eq view.writer_id}">
		<a href="/board/update?board_no=${view.board_no }"><button class="btn btn-primary">수정</button></a>
		<a href="/board/delete?board_no=${view.board_no }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div>	
<!-- 버튼 영역 end -->

<!-- 댓글 처리 -->
<div>


<!-- 댓글 입력 -->
<div class="form-inline text-center">
	<input type="text" size="7" class="form-control" id="commentWriter" value="${sessionScope.loginnick }" readonly="readonly"/>
	<textarea rows="2" cols="60" class="form-control" id="commentContent"></textarea>
	<button id="btnCommInsert" class="btn">입력</button>
</div>
<!-- 댓글 입력 end -->

<hr>


<!-- 댓글 리스트 -->

	<c:forEach items="${comment }" var="comment">
		<li data-commentno="${comment.comment_no }" class="commentli">
			${comment.writer_nick }
			
			<fmt:formatDate value="${comment.writtendate }" pattern="yy-MM-dd hh:mm:ss" />
			
				<c:if test="${sessionScope.loginnick eq comment.writer_nick }">
				<button class="btn btn-default" onclick="deleteComment(${comment.comment_no });">삭제</button>
				<button id="btnUpdate" class="btn btn-default" onclick="updateComment(${comment.comment_no},'${comment.content}',${comment.board_no });">수정</button>
				</c:if>
				<button class="btn btn-default" onclick="insertComment(${comment.comment_no });">댓글달기</button>
			<p id="comment${comment.comment_no }">
				${comment.content }
			</p>
			<hr>
		</li>
	</c:forEach>

<!-- 댓글 리스트 end -->



</div>	
<!-- 댓글 처리 end -->

</div>	
<!-- container end -->
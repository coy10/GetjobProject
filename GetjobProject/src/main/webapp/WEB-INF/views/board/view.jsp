<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript">
$(document).ready(function() {
	// 추천버튼 초기화 recommend.dto이름
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
				writer_id: '${sessionScope.loginid }'
				, board_no: '${view.board_no }'
			}
			, success: function(data) {
				console.log(data);
				if(data.recommend_cnt==true) {
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
				.text(data.total);
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
				name:"boardNo",
				value:"${board.board_no }"
			})
		).append(
			$("<input>").attr({
				type:"hidden",
				name:"userid",
				value:"${sessionScope.id }"
			})
		).append(
			$("<input>").attr({
				type:"hidden",
				name:"commentWriter",
				value:$("#commentWriter").val()
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
function deleteComment(commentNo) {
	$.ajax({
		type: "post"
		, url: "/board/deleteComment"
		, dataType: "json"
		, data: {
			commentNo: commentNo
		}
		, success: function(data){
			if(data.success) {
				
				$("[data-commentno='"+commentNo+"']").remove();
				
			} else {
				alert("댓글 삭제 실패");
			}
		}
		, error: function() {
			console.log("error");
		}
	});
}
</script>

</head>
<body>

<div class="container">
<div>
<h1 class="pull-left">게시글 상세보기</h1>
<button id="btnRecommend" class="btn pull-right">추천</button>
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
	<c:if test="${loginid eq view.writer_id }">
		<a href="/board/update?board_no=${view.board_no }"><button class="btn btn-primary">수정</button></a>
		<a href="/board/delete?board_no=${view.board_no }"><button class="btn btn-danger">삭제</button></a>
	</c:if>
</div>	<!-- 버튼 영역 end -->

<!-- 댓글 처리 -->
<div>

<hr>
<!-- 댓글 입력 -->
<div class="form-inline text-center">
	<input type="text" size="7" class="form-control"
		id="commentWriter"
		value="${sessionScope.nick }" readonly="readonly"/>
	<textarea rows="2" cols="60"
		class="form-control" id="commentContent"></textarea>
	<button id="btnCommInsert" class="btn">입력</button>
</div>	<!-- 댓글 입력 end -->

<!-- 댓글 리스트 -->
<table class="table table-striped table-hover table-condensed">
<thead>
<tr>
	<th>번호</th>
	<th>작성자</th>
	<th>댓글</th>
	<th>작성일</th>
	<th></th>
</tr>
</thead>
<tbody>
<c:forEach items="${commentList }" var="comment">
<tr data-commentno="${comment.commentNo }">
	<td>${comment.rnum }</td>
	<td>${comment.commentWriter }</td>
	<td>${comment.content }</td>
	<td>
		<fmt:formatDate value="${comment.writtenDate }"
			pattern="yy-MM-dd hh:mm:ss" />
	</td>
	<td>
		<c:if test="${sessionScope.id eq comment.userid }">
		<button class="btn btn-default"
			onclick="deleteComment(${comment.commentNo });">삭제</button>
		</c:if>
	</td>
	
</tr>
</c:forEach>
</tbody>
</table>	<!-- 댓글 리스트 end -->

</div>	<!-- 댓글 처리 end -->

</div>	<!-- container end -->

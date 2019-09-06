<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>게시판</title>
<script type="text/javascript">

	$(document).ready(function(){
		
// 		if(${sessionScope.loginid=='a'}){
// 			$("#checkAll").attr("type","checkbox")
// 			$(".checkRow").attr("type","checkbox")
// 			$("#btnDelete").attr("type","button")
// 		}
		
		$("#btnSearch").click(function(){
			$("#searchForm").submit();
		})
		
		$("#btnDelete").click(function(){
			
		var $checkboxes=$("input:checkbox[name='checkRow']:checked")
			
		var map = $checkboxes.map(function(){
			return $(this).val();
		});
		
		var names = map.get().join(",");
		console.log(names);
		
		var $form = $("<form>")
					.attr("action","/board/listDelete") 
					.attr("method","post")
					.append(
							$("<input>")
							.attr("type","hidden")
							.attr("name","names")
							.attr("value",names)
							
					);
		console.log(names);
		$(document.body).append($form);
		$form.submit();
		})
		
		
	});
	
	function checkAll(){
		
		var $checkboxes=$("input:checkbox[name='checkRow']");
		
		var check_status = $("#checkAll").is(":checked");
		
		if(check_status){
			
			$checkboxes.each(function(){
				this.checked = true;
				
			});
		}else{
			$checkboxes.each(function(){
				this.checked = false;
			});
		}
		
	}
</script>

<style>
	.listTd{
		text-align: center;
	}
</style>

</head>

<body>

<div>
	<h1>게시판</h1>
</div>

<hr>
<table>
	<tr>
		<c:if test="${loginid=='a' }">
		<th><input type="checkbox" id="checkAll" onclick="checkAll();" class="allCheck"/></th>
		</c:if>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>닉네임</th>
		<th>조회수</th>
		<th>작성일</th>
		<th>추천수</th>
	</tr>

<c:forEach items="${list1 }" var="i">
<tr>
	<c:if test="${loginid=='a' }">
	<td class="listTd"><input  type="checkbox" id="checkRow" class="checkRow" name="checkRow" value="${i.board_no}"/></td>
	</c:if>
	<td class="listTd">${i.board_no}</td>
	<td class="listTd"><a href="/board/view?board_no=${i.board_no}">${i.title }</a></td>
	<td class="listTd">${i.writer_id}</td>
	<td class="listTd">${i.writer_nick }</td>
	<td class="listTd">${i.hit }</td>
	<td class="listTd"><fmt:formatDate value="${i.write_date }" pattern="yyyy-MM-dd" /></td>
	<td class="listTd">${i.recommend }</td>
</tr>
</c:forEach>
</table>
<div class="search">
	<form action="/board/list" method="get" id="searchForm">
		<select name="select">
			<option selected="selected" value="title">제목</option>
			<option value="content">내용</option>
			<option value="writer_nick">작성자</option>
		</select>
		
		<input type="text" name="search" placeholder="검색어를 입력해주세요" />
		<button type="button" id="btnSearch">검색</button>
	</form>
</div>

<div>
	<a href="/member/main"><button>메인으로</button></a>
	<a href="/board/write"><button>글쓰기</button></a>
	<c:if test="${loginid=='a' }">
	<input type="button" id="btnDelete" value="삭제"></input>
	</c:if>
	
</div>
</body>
<div class="pagingBox">
	<c:import url="/WEB-INF/views/board/paging.jsp" />
</div>
</html>
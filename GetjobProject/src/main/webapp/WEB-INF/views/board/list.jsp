<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	$(document).ready(function(){
		$("#btnSearch").click(function(){
			$("#searchForm").submit();
		})
		
		$("#btnDelete").click(function(){
			
			var $checkboxes=$("input:checkbox[name='checkRow']:checked")
			
// 			var names="";
			
// 			var len = $checkboxes.each(function(idx){
				
// 				names += $(this).val();
				
// 				if(len-1 != idx){
// 					names += ",";
// 				}
// 			})
// 		console.log(names);
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
<h1>리스트</h1>
<hr>
<table>
	<tr>
		<th><input type="checkbox" id="checkAll" onclick="checkAll();" class="allCheck"/></th>
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
	<td class="listTd"><input type="checkbox" name="checkRow" value="${i.board_no}"/></td>
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
	<button type="button" id="btnDelete">삭제</button>
	
</div>
</body>
<div class="pagingBox">
	<c:import url="/WEB-INF/views/board/paging.jsp" />
</div>
</html>